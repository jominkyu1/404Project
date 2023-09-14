package net.store.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
@Getter
public class ProductVO {
    /*  테이블명: 404_PRODUCT
    *   pk: product_num
    * */
    private int product_num;
    private String product_name;
    private String product_cont;
    private int proudct_price;
    private int product_quantity;
    private Timestamp product_regdate;
    private ProductCategory product_category;
}
