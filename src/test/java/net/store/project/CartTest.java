package net.store.project;

import net.store.project.repository.CartItemRepository;
import net.store.project.service.CartService;
import net.store.project.vo.cart.CartItemVO;
import net.store.project.vo.cart.form.UserCartForm;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Tuple;
import java.util.List;
import java.util.Optional;

@SpringBootTest
@Transactional
public class CartTest {

    @Autowired
    CartService cartService;
    @Autowired
    CartItemRepository cartItemRepository;

    @Test
    @Rollback(value = false)
    void 카트담기테스트(){
        cartService.addCart(1L, 1L, 1);
    }


    @Test
    void 카트에담긴아이템찾기(){
        Optional<CartItemVO> cartItemVO = cartItemRepository.findCartItemVOByCartIdAndItemId(2L, 1L);
        System.out.println(cartItemVO.get());
    }

    @Test
    void 카트에담긴아이템들의총가격(){
        Long totalPrice = cartItemRepository.findTotalOrderedPriceByCartId(2L);
        System.out.println(totalPrice);
    }

    @Test
    void 카트에담긴아이템의갯수(){
        int count = cartItemRepository.countByCartId(2L);
        System.out.println(count);
    }

}

