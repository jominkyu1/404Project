package net.store.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.store.project.dao.BbsDAO;
import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Service
public class BbsServiceImpl implements BbsService {
	
	@Autowired
	private BbsDAO bbsDao;

	@Override
	public int getRowCount(PageVO p) {
		return this.bbsDao.getRowCount(p);
	}

	@Override
	public List<BbsVO> getBbsList(PageVO p) {
		return this.bbsDao.getBbsList(p);
	}

	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return this.bbsDao.getBoardList(p);
	}

	@Override
	public List<BbsVO> getFiles(Integer board_no) {
		return this.bbsDao.getFiles(board_no);
	}
}