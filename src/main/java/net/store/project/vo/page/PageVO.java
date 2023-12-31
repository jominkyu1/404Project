package net.store.project.vo.page;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PageVO {//페이징과 검색기능 관련 클래스

	//페이징 관련변수
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호
	
	//검색기능 관련변수
	private String find_field;//검색 필드
	private String find_name;//검색어
	
	//private String board_category;//구분값 qna, bbs, gongji
}
