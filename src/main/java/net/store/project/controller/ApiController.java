package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.repository.UserRepository;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController // @Controller + 각 메서드마다 @ResponseBody
@RequiredArgsConstructor
@Slf4j
public class ApiController {
    private final UserRepository userRepository;

    /**
     * 아이디 중복검사 로직
     * */
    @GetMapping(value = "/user/idCheck")
    public boolean idCheck(@RequestParam String username){
        boolean result = userRepository.findByUsername(username).isPresent();
        log.info("아이디 중복 검사 결과: {}", result);
        return result;
    }
}
