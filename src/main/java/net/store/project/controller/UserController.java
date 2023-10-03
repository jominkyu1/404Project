package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.security.StoreUserDetails;
import net.store.project.vo.user.UserRepository;
import net.store.project.vo.user.UserVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.NotNull;
import java.security.Principal;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.Optional;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserRepository userRepository;

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    public String illegalArgumentHandler(IllegalArgumentException e, Model model){
        model.addAttribute("message", e.getMessage());
        return "error/4xx";
    }

    @GetMapping("/{id}")
    public String test(@PathVariable("id") Integer user_id,
                       @AuthenticationPrincipal StoreUserDetails user,
                       Model model) {

        if(user==null) return "redirect:/login";

        Integer sessionUserId = user.getUser().getUser_id();
        if(!Objects.equals(sessionUserId, user_id)) throw new IllegalArgumentException("잘못된 접근입니다.");

        log.info("user_id: {} ::: user: {}", user_id, user);
        UserVO userVO = userRepository.findById(user_id)
                .orElseThrow(() -> new NoSuchElementException("해당 유저가 없습니다."));

        model.addAttribute("user", userVO);
        return "user/userinfo";
    }
}
