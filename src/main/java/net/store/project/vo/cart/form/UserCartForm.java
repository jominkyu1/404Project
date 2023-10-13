package net.store.project.vo.cart.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class UserCartForm {
    private int price;
    private int order_quantity;
    private String name;
    private String image_path;
    private Long item_id;

    public UserCartForm(int price, int order_quantity, String name, String image_path, Long item_id) {
        this.price = price;
        this.order_quantity = order_quantity;
        this.name = name;
        this.image_path = image_path;
        this.item_id = item_id;
    }
}
