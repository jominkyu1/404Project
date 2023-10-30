package net.store.project.service;

import java.util.List;

import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface BoardService {

	void insertBoard(BoardVO b);

	List<BoardVO> getBoardList(PageVO p);
	
	int getListCount(PageVO p);

	BoardVO getBoardCont(int board_no);

	BoardVO getBoardCont2(int board_no);

	void updateHit(int board_no);

	void replyBoard(BoardVO rb);

	void editBoard(BoardVO b);

	void delBoard(int board_no);
	
	void insertBoardWithFiles(BoardVO b, List<BbsVO> bbsList);

	BoardVO getBbsCont(int board_no);

	BoardVO getBbsCont2(int board_no);


	

	//상단바에서 게시판 제목 검색
    List<BoardVO> searchboard(String search);

	BoardVO getBoardCont3(int no);
}
