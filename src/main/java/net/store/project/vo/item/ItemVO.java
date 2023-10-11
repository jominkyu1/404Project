package net.store.project.vo.item;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
@Entity
@ToString
@Table(name = "item")
public class ItemVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    //TODO 카테고리

    protected ItemVO() {}

    @Builder
    public ItemVO(String name, String description, int price, int stockQuantity, String image_path) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.image_path = image_path;
    }
}
