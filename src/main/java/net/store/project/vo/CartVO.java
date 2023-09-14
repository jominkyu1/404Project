package net.store.project.vo;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class CartVO {
    /*  테이블명: 404_CART
    *   FK: userid, product_num
    * */
    private String userid;
    private int produdct_num;
    private int quantity;
}
