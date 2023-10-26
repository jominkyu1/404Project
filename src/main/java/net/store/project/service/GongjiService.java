package net.store.project.service;

import java.util.List;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface GongjiService {

	int getListCount(PageVO p);

	List<BoardVO> getGongjiList(PageVO p);

	void insertGongji(BoardVO b);

	BoardVO getGongjiCont(int no);

	void editGongji(BoardVO b);

	void delGongji(int no);

}
