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

    @Test
    void MyBatisTest(){
        Assertions.assertThat(testMapper.findAllUsers()).hasOnlyElementsOfType(UserVO.class);
    }

}
