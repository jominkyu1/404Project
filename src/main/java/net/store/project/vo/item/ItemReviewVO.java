package net.store.project.vo.item;

import net.store.project.vo.user.UserVO;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;


/**
 * 아이템 리뷰 Entity
 * */
public class ItemReviewVO {

    private Long item_review_id;

    private ItemVO item;

    private UserVO user;

    private String contents; //리뷰내용

    private Timestamp regdate;

    private List<MultipartFile> images;
}
