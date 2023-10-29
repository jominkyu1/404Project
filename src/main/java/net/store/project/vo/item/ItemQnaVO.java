package net.store.project.vo.item;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import net.store.project.vo.user.UserVO;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
@Entity
@SequenceGenerator(
        name="item_qna_seq_gename",
        sequenceName="item_qna_seq",
        initialValue=1,
        allocationSize=1
)
@Table(name = "item_qna")
public class ItemQnaVO {

    @Id @GeneratedValue(
            strategy=GenerationType.SEQUENCE,
            generator="item_qna_seq_gename"
    )
    private Long item_qna_id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private ItemVO itemVO; //문의상품의 ID

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private UserVO userVO; //문의한 유저의 ID

    @Column(length = 4000)
    private String contents; //문의내용

    @ColumnDefault(value = "0")
    private int answered; // 미답변0,  답변1

    @Column(length = 4000)
    private String answered_text;

    @CreationTimestamp
    private Timestamp regdate;

    public ItemQnaVO(){}

    @Builder
    public ItemQnaVO(ItemVO itemVO, UserVO userVO, String contents) {
        this.itemVO = itemVO;
        this.userVO = userVO;
        this.contents = contents;
    }


}
