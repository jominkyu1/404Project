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
	public List<BbsVO> getFiles(int board_no) {
		return this.bbsDao.getFiles(board_no);
	}

	@Override
	public void updateHit(int board_no) {
		this.bbsDao.updateHit(board_no);
	}

	@Override
	public void delBbs(int board_no) {
		this.bbsDao.delBbs(board_no);
	}

	@Override
	public void editBbs(BoardVO b) {
		this.bbsDao.editBbs(b);
	}

	@Override
	public void insertFile(List<BbsVO> fileList) {
		this.bbsDao.insertBoardWithFiles(fileList);
	}

	@Override
	public void delbbsFile(int bbs_no) {
		this.bbsDao.delbbsFile(bbs_no);
	}

	@Override
	public BbsVO getFile(int bbs_no) {
		return this.bbsDao.getFile(bbs_no);
	}


	//상단바 검색
	@Override
	public int getRowCount2(PageVO p) {
		return this.bbsDao.getRowCount2(p);
	}

	@Override
	public List<BoardVO> getBoardList2(PageVO p) {
		return this.bbsDao.getBoardList2(p);
	}
}