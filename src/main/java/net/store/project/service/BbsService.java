package net.store.project.service;

import java.util.List;

import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface BbsService {

	int getRowCount(PageVO p);

	List<BbsVO> getBbsList(PageVO p);

	List<BoardVO> getBoardList(PageVO p);

	List<BbsVO> getFiles(int board_no);

	void updateHit(int board_no);

	void delBbs(int board_no);

	void editBbs(BoardVO b);

	public void insertFile(List<BbsVO> fileList);

	void delbbsFile(int bbs_no);

	BbsVO getFile(int bbs_no);

}
