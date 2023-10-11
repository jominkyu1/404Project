package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.security.StoreUserDetails;
import net.store.project.repository.UserRepository;
import net.store.project.service.UserService;
import net.store.project.vo.user.UserVO;
import net.store.project.vo.user.form.UserRegisterForm;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.NoSuchElementException;
import java.util.Objects;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserRepository userRepository;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;
    private final UserDetailsService userDetailsService;

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String illegalArgumentHandler(IllegalArgumentException e, Model model) {
        model.addAttribute("message", e.getMessage());
        return "error/4xx";
    }

    @GetMapping("/{id}")
    public String userInfo(@PathVariable("id") Long user_id,
                           @AuthenticationPrincipal StoreUserDetails user,
                           Model model) {

        if (user == null) return "redirect:/login";

        Long sessionUserId = user.getUser().getUser_id();
        if (!Objects.equals(sessionUserId, user_id)) throw new IllegalArgumentException("잘못된 접근입니다.");

        UserVO userVO = userRepository.findById(user_id)
                .orElseThrow(() -> new NoSuchElementException("해당 유저가 없습니다."));

        model.addAttribute("user", userVO);
        return "user/userinfo";
    }

    @GetMapping("/{id}/edit")
    public String userEdit(@PathVariable Long id,
                           Model model) {
        UserVO user = userRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("해당 유저가 없습니다."));

        UserRegisterForm userRegisterForm = UserRegisterForm.fromEntity(user); //UserVO -> UserRegisterForm

        model.addAttribute("userRegisterForm", userRegisterForm);
        return "user/useredit";
    }

    @PostMapping("/{id}/edit")
    public String userEditDone(@Validated @ModelAttribute UserRegisterForm user,
                               BindingResult bindingResult,
                               @PathVariable Long id,
                               @RequestParam Boolean passwordChanged,
                               Model model,
                               @AuthenticationPrincipal StoreUserDetails storeUserDetails){
        log.info("수정객체: {}", user);

        //검증
        if (bindingResult.hasErrors()) {
            log.info("binding errors={}", bindingResult);
            model.addAttribute("errors", bindingResult);
            return "user/useredit";
        }

        //비밀번호를 수정했다면 인코딩
        if(passwordChanged) user.setPassword(passwordEncoder.encode(user.getPassword()));

        //유저정보 업데이트
        UserVO userVO = userService.updateUser(id, user);
        //스프링시큐리티 UserDetails 업데이트
        storeUserDetails.updateUserDetails(userVO);
        
        return "redirect:/user/" + id;
    }
}
