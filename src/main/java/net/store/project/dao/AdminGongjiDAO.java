package net.store.project.dao;

import java.util.List;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface AdminGongjiDAO {

	int getListCount(PageVO p);

	List<BoardVO> getGongjiList(PageVO p);

	void insertGongji(BoardVO b);

	BoardVO getGongjiCont(int no);

}
