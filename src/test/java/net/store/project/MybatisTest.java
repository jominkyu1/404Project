package net.store.project;

import net.store.project.repository.mapper.TestMapper;
import net.store.project.vo.user.UserVO;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
public class MybatisTest {

    @Autowired private TestMapper testMapper;
    @Autowired private PasswordEncoder passwordEncoder;

    @Test
    void MyBatisTest(){
        Assertions.assertThat(testMapper.findAllUsers()).hasOnlyElementsOfType(UserVO.class);
    }

    @Test
    void Mythink(){
        String s = "12345";
        String encodedS = passwordEncoder.encode(s);
        String encodedS2 = passwordEncoder.encode(s);

        boolean matches = passwordEncoder.matches(encodedS2, encodedS);
        System.out.println(matches);

    }
}
