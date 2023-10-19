package net.store.project.dao;

import java.util.List;

import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface AdminBbsDAO {

	int getListCount(PageVO p);

	List<BbsVO> getadminBbsList(PageVO p);
	
	void insertBoardWithFiles(List<BbsVO> bbsList);


}
