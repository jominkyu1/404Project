package net.store.project.vo.board;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

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
	
	@CreationTimestamp //@CreationTiestamp 는 하이버네이트의 특별한 기능으로 등록시점 날짜값을 기록,mybatis로 실행할 때는 구동 안됨.
	private Timestamp board_date;
}
