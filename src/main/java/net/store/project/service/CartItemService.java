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

//    @Transactional
//    public void modifyQuantity(Long cartId, Long itemId, int orderQuantity) {
//        cartItemRepository.findByCartVOCart_idAndItemVOItem_id(cartId, itemId)
//                .ifPresent(cartItemVO -> cartItemVO.setQuantity(orderQuantity));
//    }
}
