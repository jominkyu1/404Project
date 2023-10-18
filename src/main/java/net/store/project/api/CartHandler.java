package net.store.project.api;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.CartRepository;
import net.store.project.security.StoreUserDetails;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.user.UserVO;
import org.springframework.stereotype.Component;

/**
 * 유저의 장바구니ID를 세션에 넣기위한 핸들러
 * */
@Component
@RequiredArgsConstructor
public class CartHandler {

    private final CartRepository cartRepository;

    public void setSessionCartId(StoreUserDetails storeUserDetails){
        UserVO user = storeUserDetails.getUser();
        CartVO cartVO = null;
        if(cartRepository.findByUserVO(user) == null){
            cartVO = CartVO.createCart(user);
            cartRepository.save(cartVO);
        } else {
            cartVO = cartRepository.findByUserVO(user);
        }

        storeUserDetails.setUser_cart_id(cartVO.getCart_id());

        System.out.println("SESSION -- storeUserDetails에 cart_id설정::: " + cartVO.getCart_id());
    }
}
