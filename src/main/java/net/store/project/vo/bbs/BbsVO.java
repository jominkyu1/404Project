package net.store.project.vo.bbs;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BbsVO {
	 
	private int bbs_no;
	private String bbs_filepath; //서버에 저장되는 경로/파일명
	private String bbs_originalFilename; //원본 파일명
	private int board_no; //글의 번호를 외래키로 가짐(FK)
}
