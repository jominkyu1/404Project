package net.store.project.service;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.CartItemRepository;
import net.store.project.repository.ItemRepository;
import net.store.project.vo.cart.CartItemVO;
import net.store.project.vo.item.ItemVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartItemService {

    private final CartItemRepository cartItemRepository;
    private final ItemRepository itemRepository;

    @Transactional
    public int modifyQuantity(Long cartId, Long itemId, int orderQuantity) {
        CartItemVO cartItemVO = cartItemRepository.findCartItemVOByCartIdAndItemId(cartId, itemId)
                .orElseThrow(() -> new IllegalArgumentException("장바구니의 아이템을 찾을 수 없습니다."));

        int itemQuantity = itemRepository.findById(itemId)
                    .orElseThrow(() -> new IllegalArgumentException("아이템을 찾을 수 없습니다."))
                    .getStockQuantity();

        //변경된 수량이 재고보다 많으면 예외처리
        if(itemQuantity < orderQuantity){
            throw new IllegalArgumentException("아이템의 재고가 부족합니다.");
        }

        //장바구니페이지에서 +, -버튼을눌러 변경된 수량의 값을 DB에 저장
        cartItemVO.setQuantity(orderQuantity);
        
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
