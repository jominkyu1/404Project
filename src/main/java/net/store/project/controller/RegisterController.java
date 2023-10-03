package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.vo.user.UserGrade;
import net.store.project.vo.user.UserRepository;
import net.store.project.vo.user.UserVO;
import net.store.project.vo.user.form.UserRegisterForm;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller
@Slf4j
@RequiredArgsConstructor
public class RegisterController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/register/test")
    @ResponseBody
    public String registerTest(Principal principal){
        System.out.println(principal.getName());
        return "TEST OK!";
    }

    @GetMapping("/register")
    public String register(@ModelAttribute UserRegisterForm user) {
        return "register";
    }

    @PostMapping("/register")
    public String registerPost(@Validated @ModelAttribute UserRegisterForm user,
                               BindingResult bindingResult,
                               Model model,
                               HttpServletRequest request){

        log.info("register user: {}", user);

        //검증
        if (hasDataError(user, bindingResult, request)) {
            log.info("binding errors={}", bindingResult);
            model.addAttribute("errors", bindingResult);
            return "/register";
        }

        UserVO userEntity = user.toEntity(); //UserRegisterForm -> UserVO
        userEntity.setPassword(passwordEncoder.encode(userEntity.getPassword())); // RAW -> BCrypt
        userEntity.setUsergrade(UserGrade.USER); //회원가입시 USER 권한 부여

        userRepository.save(userEntity);
        log.info("saved user id: {}", userEntity.getUser_id());
        return "redirect:/login";
    }

    private boolean hasDataError(UserRegisterForm user, BindingResult bindingResult, HttpServletRequest request){
        boolean hasError = false;
        String password2 = request.getParameter("password2");
        if(bindingResult.hasErrors()) hasError = true;

        if(!password2.equals(user.getPassword())){
           //비밀번호 불일치
            bindingResult.addError(new FieldError("userRegisterForm", "password2", "비밀번호가 일치하지 않습니다."));
            hasError=true;
        }
        
        if(userRepository.findByUsername(user.getUsername()).isPresent()){
            //아이디 중복체크
            bindingResult.addError(new FieldError("userRegisterForm", "username", "이미 사용중인 아이디입니다."));
        }

        return hasError;
    }
}
