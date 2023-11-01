package net.store.project.vo.item;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Setter
@Getter
@Entity
@ToString
@SequenceGenerator(
        name="item_seq_gename",
        sequenceName="item_seq",
        initialValue=1,
        allocationSize=1
)
@Table(name = "item")
public class ItemVO {
    @Id
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE,
            generator="item_seq_gename"
    )
    private Long item_id;

    private String name; //상품이름

    @Column(length = 4000)
    private String description; //상품설명

    private int price;

    private int stockQuantity; //상품재고

    private String image_path; //DB에 저장될 이미지 경로

    @CreationTimestamp
    private Timestamp regdate; //상품저장일자

    @ColumnDefault(value = "0")
    private int qna_count; //상품문의 개수

    @Enumerated(EnumType.STRING)
    private ItemCategory category; //상품 카테고리

    protected ItemVO() {}

    @Builder
    public ItemVO(String name, String description, int price, int stockQuantity, String image_path, ItemCategory category) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.image_path = image_path;
        this.category = category;
    }

    //주문시 재고 감소
    public void removeStock(int count){
        int restStock = this.stockQuantity - count;
        if(restStock < 0){
            throw new IllegalStateException("재고가 부족합니다.");
        }
        this.stockQuantity = restStock;
    }

    //주문취소시 재고 증가
    public void addStock(int count){
        this.stockQuantity = this.stockQuantity + count;
    }
}
