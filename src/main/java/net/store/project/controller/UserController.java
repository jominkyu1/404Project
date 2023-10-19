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

import javax.persistence.Tuple;
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

    @GetMapping("/{id}")
    public String userInfo(@PathVariable Long id,
                           @AuthenticationPrincipal StoreUserDetails storeUserDetails,
                           Model model) {
    	//로그인된 유저가 아니라면 로그인창으로 리다이렉트
        if (storeUserDetails == null) return "redirect:/login";

        // 접근하는주소 != 세션에있는유저 -> 예외발생
        if(!isValidatedUser(id, storeUserDetails)) throw new IllegalArgumentException("잘못된 접근입니다.");

        UserVO userVO = userRepository.findById(id).get();

        model.addAttribute("user", userVO);
        return "user/userinfo";
    }

    @GetMapping("/{id}/edit")
    public String userEdit(@PathVariable Long id,
                           @AuthenticationPrincipal StoreUserDetails storeUserDetails,
                           Model model) {

        // 접근하는주소 != 세션에있는유저 -> 예외발생
        if(!isValidatedUser(id, storeUserDetails)) throw new IllegalArgumentException("잘못된 접근입니다.");
        UserVO user = userRepository.findById(id).get();

        //UserVO -> UserRegisterForm
        UserRegisterForm userRegisterForm = UserRegisterForm.fromEntity(user);

        model.addAttribute("userRegisterForm", userRegisterForm);
        return "user/useredit";
    }

    @PostMapping("/{id}/edit")
    public String userEditDone(@Validated @ModelAttribute UserRegisterForm user,
                               BindingResult bindingResult,
                               @PathVariable Long id,
                               @RequestParam Boolean idChanged,
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
        
        //username(아이디)가 이미 있다면 예외발생
        if(userRepository.findByUsername(user.getUsername()).isPresent() && idChanged) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }

        //비밀번호를 수정했다면 인코딩
        if(passwordChanged) user.setPassword(passwordEncoder.encode(user.getPassword()));

        //유저정보 업데이트
        UserVO userVO = userService.updateUser(id, user);
        //스프링시큐리티 UserDetails 업데이트
        storeUserDetails.updateUserDetails(userVO);
        
        return "redirect:/user/" + id;
    }

    /**
     * id에 해당하는 유저와 세션에있는 유저가 같은지 검증
     * @return true: 같음, false: 다름
     * */
    private boolean isValidatedUser(Long id, StoreUserDetails storeUserDetails){

        UserVO foundUser = userRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("존재하지 않는 사용자입니다"));
        
        return Objects.equals(foundUser.getUser_id(), storeUserDetails.getUser().getUser_id());
    }


}
