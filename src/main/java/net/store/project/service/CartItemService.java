package net.store.project.service;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.CartItemRepository;
import net.store.project.vo.cart.CartItemVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartItemService {

    private final CartItemRepository cartItemRepository;

    @Transactional
    public int modifyQuantity(Long cartId, Long itemId, int orderQuantity) {
        CartItemVO cartItemVO = cartItemRepository.findCartItemVOByCartIdAndItemId(cartId, itemId)
                .orElseThrow(() -> new IllegalArgumentException("장바구니의 아이템을 찾을 수 없습니다."));

        //장바구니페이지에서 +, -버튼을눌러 변경된 수량의 값을 DB에 저장
        cartItemVO.setQuantity(orderQuantity);
        System.out.println("장바구니 수량변경 ::: "+cartItemVO.getQuantity());
        
        //변경된 수량 리턴
        return cartItemVO.getQuantity();
    }

    public Long totalOrderedPrice(Long cart_id){
        return cartItemRepository.findTotalOrderedPriceByCartId(cart_id);
    }

    @Transactional
    public void deleteCartItem(Long cartId, Long itemId) {
        cartItemRepository.deleteCartItemFromCartIdAndItemId(cartId, itemId);
    }
}
