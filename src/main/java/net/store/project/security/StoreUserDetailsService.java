package net.store.project.security;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.vo.user.UserRepository;
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

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 유저정보 가져오기
        Optional<UserVO> foundUsername = userRepository.findByUsername(username);

        if(foundUsername.isPresent()){ //유저정보가 있다면
            log.info("로그인 성공: {}", username);
            return new StoreUserDetails(foundUsername.get());
        } else {
            log.info("로그인 실패: {} ", username);
            throw new UsernameNotFoundException("없는 아이디 입니다. 다시 확인해주세요. :: " + username);
        }

        //흐름 : DB -> Optional<UserVO> -> UserVO -> UserDetails
    }
}
