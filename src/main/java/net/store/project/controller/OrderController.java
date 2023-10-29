package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.repository.CartItemRepository;
import net.store.project.repository.CartRepository;
import net.store.project.repository.ItemRepository;
import net.store.project.security.StoreUserDetails;
import net.store.project.service.OrderService;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.order.OrderVO;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
@RequiredArgsConstructor
public class OrderController {

    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final OrderService orderService;
    private final ItemRepository itemRepository;

    /**
     * 단품으로 주문하는 경우(GET)
     * */
    @GetMapping("/order")
    public String orderPage(@AuthenticationPrincipal StoreUserDetails storeUserDetails,
                            Long item_id,
                            int orderQuantity,
                            Model model){
        if(storeUserDetails == null) return "redirect:/login";
        ItemVO itemVO = itemRepository.findById(item_id)
                .orElseThrow(() -> new IllegalArgumentException("해당 상품이 없습니다."));
        
        //TODO 할인정책
        int totalPrice = itemVO.getPrice() * orderQuantity;

        model.addAttribute("orderQuantity", orderQuantity);
        model.addAttribute("itemVO", itemVO);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("singleItem", true);
        return "order/order_main";
    }

    /**
     * 단품으로 주문하는 경우(POST AJAX)
     * */
    @PostMapping("/order")
    @ResponseBody
    public String orderProcSingleItem(@AuthenticationPrincipal StoreUserDetails storeUserDetails,
                                      int orderQuantity,
                                      Long item_id,
                                      String merchant_uid){
        if(storeUserDetails == null) {
            throw new IllegalStateException("로그인되지 않은 사용자입니다.");
        }

        OrderVO orderVO = orderService.orderItemByItemId(item_id, merchant_uid, orderQuantity, storeUserDetails.getUser());
        System.out.println("단품주문 성공 ::: 주문번호 - " + orderVO.getOrder_id());
        return "SUCCESS";
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
     * */
    @PostMapping("/order/{cart_id}")
    @ResponseBody
    public String orderProcess(@PathVariable Long cart_id, String merchant_uid){

        OrderVO orderVO = orderService.orderItemByCartId(cart_id, merchant_uid);
        System.out.println("::: 성공적으로 주문완료 ::: [주문번호] " + orderVO.getOrder_id());
        return "SUCCESS";
    }
    
    /**
     * 주문취소
     * */
    @PatchMapping("/order/{order_id}")
    @ResponseBody
    public String cancelOrder(@PathVariable Long order_id){
        orderService.cancelOrder(order_id);
        return "SUCCESS";
    }
}
