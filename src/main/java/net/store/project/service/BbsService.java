package net.store.project.service;

import java.util.List;

import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface BbsService {

	int getRowCount(PageVO p);

	List<BbsVO> getBbsList(PageVO p);

	List<BoardVO> getBoardList(PageVO p);


}
