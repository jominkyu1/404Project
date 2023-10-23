package net.store.project.vo.cart;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.user.UserVO;

import javax.persistence.*;
import java.util.List;

@Setter
@Getter
@ToString
@Entity
@SequenceGenerator(
        name="users_cart_seq_gename",
        sequenceName="users_cart_seq",
        initialValue=1,
        allocationSize=1
)
@Table(name = "user_cart")
public class CartVO {
    @Id
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE,
            generator="users_cart_seq_gename"
    )
    private Long cart_id;

    //단방향
    @OneToOne
    @JoinColumn(name = "user_id")
    private UserVO userVO; //유저 PK ID


    /**
     * 카트객체 생성 메소드
     * 만약 카트테이블에 유저정보가없다면 이 메소드를 통해 카트를 생성함
     * */
    public static CartVO createCart(UserVO userVO){
        CartVO cartVO = new CartVO();
        cartVO.setUserVO(userVO);
        return cartVO;
    }
}