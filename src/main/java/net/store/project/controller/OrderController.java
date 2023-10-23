package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.repository.CartItemRepository;
import net.store.project.repository.CartRepository;
import net.store.project.security.StoreUserDetails;
import net.store.project.service.OrderService;
import net.store.project.vo.cart.CartItemVO;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.order.OrderVO;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
@RequiredArgsConstructor
public class OrderController {

    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final OrderService orderService;

    /**
     * 단품으로 주문하는 경우
     * TODO
     * */
    @GetMapping("/order")
    public String orderPage(){
        return "order/order_main";
    }

    /**
     * 장바구니페이지에서 주문하는 경우
     * @param cart_id: 유저의 장바구니 아이디
     * */
    @GetMapping("/order/{cart_id}")
    public String orderPage(@PathVariable Long cart_id,
                            @AuthenticationPrincipal StoreUserDetails storeUserDetails,
                            Model model){
        //유저검증
        if(storeUserDetails == null) return "redirect:/login";
        CartVO cartVO = cartRepository.findById(cart_id)
                .orElseThrow(() -> new IllegalArgumentException("해당 장바구니가 없습니다."));
        
        //세션 장바구니 != 접근 장바구니 에러발생
        if(!cart_id.equals(storeUserDetails.getUser_cart_id())) throw new IllegalStateException("잘못된 접근입니다.");

        //세션에 있는 유저가 장바구니에 추가한 아이템의 총 가격
        Long totalPrice = cartItemRepository.sumByCartVO(cartVO);
        model.addAttribute("totalPrice", totalPrice);

        return "order/order_main";
    }

    /**
     * 장바구니페이지에서 주문한 경우
     * @param cart_id: 유저의 카트아이디
     * @param merchant_uid: orders에 저장될 주문번호
     * @param paid_amount: 결제한 금액
     * */
    @PostMapping("/order/{cart_id}")
    @ResponseBody
    public String orderProcess(@PathVariable Long cart_id, String merchant_uid, String paid_amount){

        OrderVO orderVO = orderService.orderItemByCartId(cart_id, merchant_uid);
        System.out.println("::: 성공적으로 주문완료 ::: " + orderVO.getOrder_id());
        return "SUCCESS";
    }
}
