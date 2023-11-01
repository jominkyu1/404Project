package net.store.project.vo.item.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import net.store.project.vo.item.ItemCategory;
import net.store.project.vo.item.ItemVO;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Column;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
@ToString
public class ItemUploadForm {

    @NotBlank(message = "상품명을 입력해주세요.")
    private String name; //상품이름

    @Column(length = 4000)
    @NotBlank(message = "상품설명을 입력해주세요.")
    private String description; //상품설명

    @Min(value = 10, message = "가격은 10원 이상만 등록할 수 있습니다.")
    @Max(value = 50000000, message = "가격은 50,000,000원 이하만 등록할 수 있습니다.")
    private int price;

    @Min(value = 1, message = "수량은 1개 이상만 등록할 수 있습니다.")
    @Max(value = 5000, message = "수량은 5000개 이하만 등록할 수 있습니다.")
    private int stockQuantity; //상품재고

    private ItemCategory category; //상품 카테고리

    private MultipartFile image; //DB에 저장될 이미지 경로

    public static ItemVO toEntity(ItemUploadForm itemUploadForm) {
        return ItemVO.builder()
                .name(itemUploadForm.getName())
                .description(itemUploadForm.getDescription())
                .price(itemUploadForm.getPrice())
                .stockQuantity(itemUploadForm.getStockQuantity())
                .image_path(itemUploadForm.getImage().getOriginalFilename())
                .category(itemUploadForm.getCategory())
                .build();
    }
}
