package net.store.project.vo.admin;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVO {//페이징과 검색 기능 관련 클래스

    //한페이지에 보여질 갯수 변수: int paging = 10;
    //총 게시글갯수: 100/paging -> 페이지수
    //1 2 3 4 5 6 7 8 9 10

    //페이징 관련 변수
    private int startrow; //시작행 번호 x 10+x 20+x
    private int endrow; //끝행 번호 10x 20x 30x

    //검색기능 관련 변수
    private String find_field; //검색필드
    private String find_name; //검색어

}
