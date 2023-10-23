package net.store.project.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Repository
public interface BoardDAO {

	void insertBoard(BoardVO b);

	List<BoardVO> getBoardList(PageVO p);
	
	int getListCount(PageVO p);

	BoardVO getBoardCont(int board_no);

	void updateHit(int board_no);

	void replyBoard(BoardVO rb);

	void editBoard(BoardVO eb);

	void delBoard(int board_no);


	

	
	


}
