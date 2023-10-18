package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.CartItemRepository;
import net.store.project.service.CartItemService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class CartRestController {

    private final CartItemService cartItemService;
    private final CartItemRepository cartItemRepository;

    @PatchMapping("/cart/modifyQuantity")
    public int modifyQuantity(Long cart_id, Long item_id, int order_quantity){
        //수량 변경 후 변경된 수량값 리턴됨
        return cartItemService.modifyQuantity(cart_id, item_id, order_quantity);
    }

    @GetMapping("/cart/totalPrice")
    public Long totalPrice(Long cart_id){
        //장바구니에 담긴 아이템들의 총 가격 리턴됨
        return cartItemService.totalOrderedPrice(cart_id);
    }

    @DeleteMapping("/cart/delete")
    public void deleteCartItem(Long cart_id, Long item_id){
        cartItemService.deleteCartItem(cart_id, item_id);
    }

    @GetMapping("/cart/count")
    public int countCartItem(Long cart_id){
        //장바구니에 담긴 아이템의 갯수
        return cartItemRepository.countByCartId(cart_id);
    }
}
