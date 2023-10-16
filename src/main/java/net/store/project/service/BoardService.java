package net.store.project.service;

import java.util.List;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface BoardService {

	void insertBoard(BoardVO b);

	List<BoardVO> getBoardList(PageVO p);
	
	int getListCount(PageVO p);



	
}
