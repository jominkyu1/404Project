package net.store.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.store.project.dao.GongjiDAO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Service
public class GongjiServiceImpl implements GongjiService {
	
	@Autowired
	private GongjiDAO gongjiDao;

	@Override
	public int getListCount(PageVO p) {
		return this.gongjiDao.getListCount(p);
	}

	@Override
	public List<BoardVO> getGongjiList(PageVO p) {
		return this.gongjiDao.getGongjiList(p);
	}

	@Override
	public void insertGongji(BoardVO b) {
		this.gongjiDao.insertGongji(b);
	}

	@Override
	public BoardVO getGongjiCont(int board_no) {
		return this.gongjiDao.getGongjiCont(board_no);
	}

	@Override
	public void editGongji(BoardVO b) {
		this.gongjiDao.editGongji(b);
	}

	@Override
	public void delGongji(int no) {
		this.gongjiDao.delGongji(no);
	}

	@Override
	public void updateHit(int board_no) {
		this.gongjiDao.updateHit(board_no);
	}

}
