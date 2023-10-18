package net.store.project.security;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.api.CartHandler;
import net.store.project.repository.UserRepository;
import net.store.project.security.dto.OAuth2GoogleInfo;
import net.store.project.security.dto.OAuth2KakaoInfo;
import net.store.project.security.dto.OAuth2NaverInfo;
import net.store.project.security.dto.OAuth2UserInfo;
import net.store.project.vo.user.UserVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class StoreOauth2UserService extends DefaultOAuth2UserService {

    private final CartHandler cartHandler;
    private final UserRepository userRepository;


    /** OAuth2.0 소셜로그인
     * 회원생성&로그인 동시진행
     * */
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        UserVO userVO;
        OAuth2User oAuth2User = super.loadUser(userRequest);
        log.info("OAuth2.0 Service - getAttributes ::: {}", oAuth2User.getAttributes());

        //소셜 구분 코드 (google, naver, kakao)
        String provider = userRequest.getClientRegistration().getRegistrationId();

        //TODO KAKAO LOGIN
        //각 소셜미디어에따라 가져온 유저정보 값들을 한곳에 통일시키는 인터페이스
        OAuth2UserInfo oAuth2UserInfo = getOAuth2UserInfo(provider, oAuth2User.getAttributes());

        String providerId = oAuth2UserInfo.getProviderId();
        String email = oAuth2UserInfo.getEmail();
        String username = oAuth2UserInfo.getUsername();
        String userphone = oAuth2UserInfo.getMobile();


        //DB에 해당 소셜로그인 정보가 있는지 확인
        Optional<UserVO> foundUser = userRepository.findByProviderId(providerId);

        if(foundUser.isPresent()){
            userVO = foundUser.get();
        }else{
            userVO = UserVO.builder()
                    .username(username)
                    .password(new BCryptPasswordEncoder().encode("1234"))
                    .provider(provider)
                    .providerId(providerId)
                    .email(email)
                    .userphone(userphone)
                    .build();

            userRepository.save(userVO);
        }
        StoreUserDetails storeUserDetails = new StoreUserDetails(userVO, oAuth2User.getAttributes());

        //세션에 cart_id 저장하기위한 핸들러 호출
        cartHandler.setSessionCartId(storeUserDetails);
        return storeUserDetails;
    }

    /**
     * GOOGLE, NAVER, KAKAO 로그인 구분
     * @param provider: 어느소셜 사이트인지 구분
     * @param attributes: 로그인성공시 가져온 유저정보               
     * @return OAuth2UserInfo: 유저정보들을 통일시킨 인터페이스
     * */
    private OAuth2UserInfo getOAuth2UserInfo(String provider, Map<String, Object> attributes){

        if(provider.equals("naver")){
            log.info("소셜로그인 NAVER");
            return new OAuth2NaverInfo((Map<String, Object>) attributes.get("response"));
        }else if(provider.equals("google")){
            log.info("소셜로그인 GOOGLE");
            return new OAuth2GoogleInfo(attributes);
        } else if(provider.equals("kakao")){
            //TODO KAKAO LOGIN
            return new OAuth2KakaoInfo(attributes);
        } else {
            throw new OAuth2AuthenticationException("소셜로그인 인증에 실패했습니다.");
        }
    }
}
