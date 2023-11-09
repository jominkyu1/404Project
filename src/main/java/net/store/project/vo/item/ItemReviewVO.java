
package net.store.project.vo.item;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.user.UserVO;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Setter @Getter
@SequenceGenerator(
        name="product_review_seq_gename",
        sequenceName="product_review_qna_seq",
        initialValue=1,
        allocationSize=1
)
@Table (name = "item_review")
public class ItemReviewVO {
    /*  테이블명: item_review
     *   FK: userid, product_num
     * */
    @Id
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE,
            generator="item_review_seq_gename"
    )
    private Long review_id; //PK

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private UserVO userVO; //FK String userid

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private ItemVO itemVO; //FK int product_num

    @CreationTimestamp
    private Timestamp regdate;

    @Column(length = 4000)
    private String contents;

    protected ItemReviewVO(){}

    @Builder
    public ItemReviewVO(ItemVO itemVO, UserVO userVO, String contents) {
        this.itemVO = itemVO;
        this.userVO = userVO;
        this.contents = contents;
    }

    @ColumnDefault(value = "0")
    private int reviewAnswered; // 미답변0,  답변1

    @Column(length = 4000)
    private String reviewAnswered_text;


    //private List<MultipartFile> images;

}
