package net.store.project.dao;

import java.util.List;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface AdminBoardDAO {

	int getListCount(PageVO p);

	List<BoardVO> getBoardList(PageVO p);

	int insertBoard(BoardVO b);

	BoardVO getAdminBoardCont(int board_no);

	void editBoard(BoardVO eb);

	void deleteBoard(int no);

}
