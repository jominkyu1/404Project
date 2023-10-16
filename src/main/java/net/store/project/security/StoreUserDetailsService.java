package net.store.project.security;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.repository.CartRepository;
import net.store.project.repository.UserRepository;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.user.UserVO;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

/** UserVO객체를 UserDetails객체로 변환해서 반환해주는 서비스 클래스
 * */
@Service
@Slf4j
@RequiredArgsConstructor
public class StoreUserDetailsService implements UserDetailsService {
    private final UserRepository userRepository;
    private final CartRepository cartRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 유저정보 가져오기
        Optional<UserVO> foundUsername = userRepository.findByUsername(username);

        if(foundUsername.isPresent()){ //유저정보가 있다면
            log.info("로그인 성공: {}", username);
            StoreUserDetails storeUserDetails = new StoreUserDetails(foundUsername.get());

            // 시큐리티세션에 storeUserDetails의 cart_id를 저장 (카트가 없으면 생성 후 저장)
            settingSessionCartId(storeUserDetails);
            return storeUserDetails;
        } else {
            log.info("로그인 실패: {} ", username);
            throw new UsernameNotFoundException("없는 아이디 입니다. 다시 확인해주세요. :: " + username);
        }

        //흐름 : DB -> Optional<UserVO> -> UserVO -> UserDetails
    }

    /**
     * 로그인한 유저가 cart_id를 가지고있다면 cart_id를 리턴
     * 없다면 Cart객체를 생성 후 cart_id 리턴
     * 
     * CartVO와 UserVO의 관계가 양방향이라면 Service에서 Transactional을통해 저장해야함.
     * 그러나 CartVO -> UserVO 단방향 관계이기때문에 여기서 트랜잭션을 관리
     * */
    private void settingSessionCartId(StoreUserDetails storeUserDetails){
        UserVO user = storeUserDetails.getUser();
        CartVO cartVO = null;
        if(cartRepository.findByUserVO(user) == null){
            cartVO = CartVO.createCart(user);
            cartRepository.save(cartVO);
        } else {
            cartVO = cartRepository.findByUserVO(user);
        }

        storeUserDetails.setUser_cart_id(cartVO.getCart_id());

        System.out.println("SESSION -- storeUserDetails에 cart_id설정::: " + cartVO.getCart_id());
    }
}
