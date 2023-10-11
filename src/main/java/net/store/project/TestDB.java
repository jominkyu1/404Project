package net.store.project;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.vo.user.UserGrade;
import net.store.project.repository.UserRepository;
import net.store.project.vo.user.UserVO;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

//@Component
@RequiredArgsConstructor
@Slf4j
public class TestDB {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @PostConstruct
    public void initDB(){
        UserVO user = new UserVO("user", "1234", "test@gmail.com", "01012345678"
        ,"서울시 종로구", "단성사빌딩", "404호", 12345);
        user.setUsergrade(UserGrade.USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        UserVO admin = new UserVO("admin", "1234", "test@gmail.com", "01012345678"
                ,"서울시 종로구", "단성사빌딩", "404호", 12345);
        admin.setUsergrade(UserGrade.ADMIN);
        admin.setPassword(passwordEncoder.encode(admin.getPassword()));

        userRepository.save(user);
        userRepository.save(admin);
        log.info("TEST용 DB user, admin 생성");
    }
}
