package net.store.project.vo.board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	
	private int board_no;
	private String board_name;
	private String board_title;
	private String board_pwd;
	
	private String board_cont;
	private int board_hit;
	private int board_ref;
	private int board_step;
	private int board_level;
	private int board_state; //게시판 1, 자료실 2,공지상항 3
	
	private Timestamp board_date;
}
