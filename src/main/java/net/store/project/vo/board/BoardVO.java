package net.store.project.vo.board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
    private String board_category;
    
	private Timestamp board_date;
}
