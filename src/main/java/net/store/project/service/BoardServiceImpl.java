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

	@Override
	public BoardVO getBoardCont(int board_no) {
		return this.boardDao.getBoardCont(board_no);
	}

	@Override
	public BoardVO getBoardCont2(int board_no) {
		return this.boardDao.getBoardCont(board_no);
	}

	@Override
	public void updateHit(int board_no) {
		this.boardDao.updateHit(board_no);
	}

	@Override
	public void replyBoard(BoardVO rb) {
		this.boardDao.replyBoard(rb);
	}

	@Override
	public void editBoard(BoardVO eb) {
		this.boardDao.editBoard(eb);
	}

	@Override
	public void delBoard(int board_no) {
		this.boardDao.delBoard(board_no);
	}



}
