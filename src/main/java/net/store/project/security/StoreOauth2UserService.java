package net.store.project.security;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.api.CartHandler;
import net.store.project.repository.UserRepository;
import net.store.project.vo.user.UserVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

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

        //로그인 진행중인 서비스 구분 코드 (google, naver, kakao)
        String provider = userRequest.getClientRegistration().getRegistrationId();

        //TODO 구글, 네이버, 카카오 로그인 구분 후 UserVO객체에 provider, providerId 할당
        String providerId = oAuth2User.getAttribute("sub");
        String email = oAuth2User.getAttribute("email");
        String username = "G_"+oAuth2User.getAttribute("name");

        //DB에 해당 소셜로그인 정보가 있는지 확인
        Optional<UserVO> foundUser = userRepository.findByProviderId(providerId);

        if(foundUser.isPresent()){
            userVO = foundUser.get();
        }else{
            userVO = UserVO.builder()
                    .username(username)
                    .provider(provider)
                    .providerId(providerId)
                    .email(email)
                    .build();

            userRepository.save(userVO);
        }
        StoreUserDetails storeUserDetails = new StoreUserDetails(userVO, oAuth2User.getAttributes());

        //세션에 cart_id 저장하기위한 핸들러 호출
        cartHandler.setSessionCartId(storeUserDetails);
        return storeUserDetails;
    }
}
