package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.CartItemRepository;
import net.store.project.service.CartItemService;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class CartRestController {

    private final CartItemService cartItemService;

    @PutMapping("/cart/modifyQuantity")
    public String modifyQuantity(Long cart_id, Long item_id, int order_quantity){
        //수량 변경
       // cartItemService.modifyQuantity(cart_id, item_id, order_quantity);

        return "OK!";
    }
}
