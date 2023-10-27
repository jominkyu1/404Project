package net.store.project.dao;

import java.util.List;

import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface BbsDAO {

	void insertBoardWithFiles(List<BbsVO> bbsList);

	int getRowCount(PageVO p);

	List<BbsVO> getBbsList(PageVO p);

	List<BoardVO> getBoardList(PageVO p);

	List<BbsVO> getFiles(Integer board_no);

	

	

	


}
