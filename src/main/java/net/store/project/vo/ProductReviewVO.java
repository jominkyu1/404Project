package net.store.project.vo;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class ProductReviewVO {
    /*  테이블명: 404_REVIEW
    *   FK: userid, product_num
    * */
    private Long review_id;
    private String userid;
    private int product_num;
    private String product_review_cont;
}
