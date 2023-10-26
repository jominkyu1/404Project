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
	private GongjiDAO adminGongjiDAO;

	@Override
	public int getListCount(PageVO p) {
		return this.adminGongjiDAO.getListCount(p);
	}

	@Override
	public List<BoardVO> getGongjiList(PageVO p) {
		return this.adminGongjiDAO.getGongjiList(p);
	}

	@Override
	public void insertGongji(BoardVO b) {
		this.adminGongjiDAO.insertGongji(b);
	}

	@Override
	public BoardVO getGongjiCont(int no) {
		return this.adminGongjiDAO.getGongjiCont(no);
	}

	@Override
	public void editGongji(BoardVO b) {
		this.adminGongjiDAO.editGongji(b);
	}

	@Override
	public void delGongji(int no) {
		this.adminGongjiDAO.delGongji(no);
	}
}
