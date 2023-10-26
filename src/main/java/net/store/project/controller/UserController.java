package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.repository.OrderRepository;
import net.store.project.repository.UserRepository;
import net.store.project.security.StoreUserDetails;
import net.store.project.service.OrderService;
import net.store.project.service.UserService;
import net.store.project.vo.order.OrderStatus;
import net.store.project.vo.order.OrderVO;
import net.store.project.vo.user.UserGrade;
import net.store.project.vo.user.UserVO;
import net.store.project.vo.user.form.UserRegisterForm;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.NotActiveException;
import java.io.PrintWriter;
import java.util.List;
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
    private final OrderRepository orderRepository;
    private final OrderService orderService;

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

    @GetMapping("/{id}/delete")
    public String deleteUser(@PathVariable Long id,
                             @AuthenticationPrincipal StoreUserDetails storeUserDetails,
                             HttpServletResponse response) throws IOException {
        UserVO user = storeUserDetails.getUser();
        //로그인되지않은 유저
        if(user==null) throw new IllegalStateException("로그인이 필요합니다.");
        //로그인한유저 != 세션에있는유저
        if(user.getUser_id() != id) throw new IllegalStateException("올바르지 않은 접근입니다!");
        //진행중인 주문이 존재하면 탈퇴불가!
        List<OrderVO> orderList = orderRepository.findAllByUser_Id(id);

        if(!orderList.isEmpty()){
            orderList.forEach(orderVO -> {
                if(orderVO.getStatus() != OrderStatus.COMPLETE && orderVO.getStatus() != OrderStatus.CANCEL){
                throw new RuntimeException("진행중인 주문이 존재하므로 탈퇴할 수 없습니다.");
            }
        });};


        userService.deleteUser(id);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('회원탈퇴가 완료되었습니다.'); location.href='/logout';</script>");
        return null;
    }

    @GetMapping("/orders")
    public String orderList(@AuthenticationPrincipal StoreUserDetails storeUserDetails,
                            Model model){
        //로그인되지않은 유저
        if(storeUserDetails==null) throw new IllegalStateException("로그인이 필요합니다.");
        UserVO user = storeUserDetails.getUser();
        List<OrderVO> orders = orderRepository.findAllByUser_Id(user.getUser_id());
        //최근 주문순으로 정렬
        orders.sort((o1, o2) -> o2.getOrder_date().compareTo(o1.getOrder_date()));
        model.addAttribute("orders", orders);

        return "user/ordered_list";
    }

    @GetMapping("/orders/{id}")
    public String orderDetails(@PathVariable Long id,
                               @AuthenticationPrincipal StoreUserDetails storeUserDetails,
                               Model model){
        //로그인되지않은 유저
        if(storeUserDetails==null) throw new IllegalStateException("로그인이 필요합니다.");
        UserVO user = storeUserDetails.getUser();

        //존재하지 않는 주문 접근시 예외발생
        OrderVO orderVO = orderRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("존재하지 않는 주문입니다."));

        //다른유저의 주문정보에 접근하려고할때 예외발생
        if(user.getUser_id() != orderVO.getUser().getUser_id()){
            //운영자가아니면 예외
            if(storeUserDetails.getUser().getUsergrade() != UserGrade.ADMIN) {
                throw new IllegalStateException("올바르지 않은 접근입니다.");
            }
        }

        model.addAttribute("order", orderVO);

        return "order/order_detail";
    }

    /**
     * 배송완료처리
     * */
    @GetMapping("/orders/{orderId}/complete")
    public String orderComplete(@PathVariable Long orderId,
                                @AuthenticationPrincipal StoreUserDetails storeUserDetails)
            throws IllegalAccessException {
        OrderVO orderVO = orderRepository.findById(orderId)
                .orElseThrow(() -> new NoSuchElementException("존재하지 않는 주문입니다."));

        if(!Objects.equals(orderVO.getUser(), storeUserDetails.getUser())){
            throw new IllegalAccessException("올바르지 않은 접근입니다!");
        }

        orderService.completeOrder(orderId);

        return "redirect:/user/orders/" + orderId;
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
