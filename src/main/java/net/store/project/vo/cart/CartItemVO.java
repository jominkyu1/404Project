package net.store.project.vo.cart;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import net.store.project.vo.item.ItemVO;

import javax.persistence.*;

@Setter
@Getter
@ToString
@Entity
@Table(name = "user_cart_items")
public class CartItemVO {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cart_item_id;

    private int quantity; //담은 아이템의 수량

    @ManyToOne //단방향
    @JoinColumn(name = "item_id")
    private ItemVO itemVO; // 장바구니에 담은 아이템

    @ManyToOne //단방향
    @JoinColumn(name = "cart_id")
    private CartVO cartVO;
    
    /**
     * 카트아이템 생성 메소드
     * 필요인자: 카트객체, 아이템객체, 수량
     * */
    public static CartItemVO createCartItem(CartVO cartVO, ItemVO itemVO, int quantity){
        CartItemVO cartItemVO = new CartItemVO();
        cartItemVO.setCartVO(cartVO);
        cartItemVO.setItemVO(itemVO);
        cartItemVO.setQuantity(quantity);

        return cartItemVO;
    }
}
