package net.store.project.service;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.CartItemRepository;
import net.store.project.repository.CartRepository;
import net.store.project.repository.ItemRepository;
import net.store.project.repository.UserRepository;
import net.store.project.vo.cart.CartItemVO;
import net.store.project.vo.cart.CartVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.user.UserVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartService {

    private final UserRepository userRepository;
    private final ItemRepository itemRepository;
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;

    /**
     * 유저가 카트에 추가한 아이템과 수량을 받아서 카트에 추가
     * 
     * 매개변수로 아이템의PK, 유저의PK, 수량이 넘어옴
     * */
    @Transactional
    public void addCart(Long item_id, Long user_id, int quantity){
        ItemVO itemVO = itemRepository.findById(item_id)
                .orElseThrow(IllegalArgumentException::new);

        UserVO userVO = userRepository.findById(user_id)
                .orElseThrow(IllegalArgumentException::new);

        CartVO cartVO = cartRepository.findByUserVO(userVO);

        //유저가 카트가 없다면 카트를 생성
        if(cartVO == null){
            cartVO = CartVO.createCart(userVO);
            cartRepository.save(cartVO);
        }

        Optional<CartItemVO> optionalCartItemVO = cartItemRepository.findByItemVOAndCartVO(itemVO, cartVO);
        if(optionalCartItemVO.isPresent()){
            //이미추가한 아이템을 다시 추가하려고하면 수량 추가업데이트
            optionalCartItemVO.get().setQuantity(optionalCartItemVO.get().getQuantity() + quantity);
        } else {
            //카트에 유저가 추가한 아이템을 추가
            CartItemVO cartItemVO = CartItemVO.createCartItem(cartVO, itemVO, quantity);
            cartItemRepository.save(cartItemVO);
        }
    }
}
