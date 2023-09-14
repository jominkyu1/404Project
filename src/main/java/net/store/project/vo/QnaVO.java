package net.store.project.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QnaVO {
    /*  테이블명: 404_QNA
    *   FK: userid
    * */
    private String userid;
    private String qna_title;
    private String qna_cont;
}
