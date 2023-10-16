package net.store.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.store.project.dao.BoardDAO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDao;

	@Override
	public void insertBoard(BoardVO b) {
		this.boardDao.insertBoard(b);
		
	}

	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return this.boardDao.getBoardList(p);
	}
	
	@Override
	public int getListCount(PageVO p) {
		
		return this.boardDao.getListCount(p);
	}



}
