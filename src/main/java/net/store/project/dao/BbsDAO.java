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

	List<BbsVO> getFiles(int board_no);

	void updateHit(int board_no);

	void delBbs(int board_no);

	void editBbs(BoardVO b);

	void delbbsFile(int bbs_no);

	BbsVO getFile(int bbs_no);

	int getRowCount2(PageVO p);

	List<BoardVO> getBoardList2(PageVO p);
}
