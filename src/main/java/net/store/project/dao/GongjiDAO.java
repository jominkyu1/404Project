package net.store.project.dao;

import java.util.List;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface GongjiDAO {

	int getListCount(PageVO p);

	List<BoardVO> getGongjiList(PageVO p);

	void insertGongji(BoardVO b);

	BoardVO getGongjiCont(int board_no);

	void editGongji(BoardVO b);

	void delGongji(int no);

}
