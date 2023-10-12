package net.store.project.vo.cart;

import lombok.Getter;
import lombok.Setter;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.user.UserVO;

import javax.persistence.*;
import java.util.List;

@Setter
@Getter
@Entity
@Table(name = "user_cart")
public class CartVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cart_id;

    //단방향
    @OneToOne
    @JoinColumn(name = "user_id")
    private UserVO userVO; //유저 PK ID

}