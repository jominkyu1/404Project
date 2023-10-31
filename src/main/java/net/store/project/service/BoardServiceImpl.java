package net.store.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.store.project.dao.BbsDAO;
import net.store.project.dao.BoardDAO;
import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	@Autowired
	private BbsDAO bbsDao;

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
	public void editBoard(BoardVO b) {
		this.boardDao.editBoard(b);
	}

	@Override
	public void delBoard(int board_no) {
		this.boardDao.delBoard(board_no);
	}

	@Transactional
	@Override
	public void insertBoardWithFiles(BoardVO b, List<BbsVO> bbsList) {
		int sequence = this.boardDao.insertBoard(b);

		// bbsList.forEach(bbsVO -> bbsVO.setBoard_no(sequence));

		for (BbsVO bbs : bbsList) {
			bbs.setBoard_no(sequence);
		}

		this.bbsDao.insertBoardWithFiles(bbsList);
	}

	@Override
	public BoardVO getBbsCont(int board_no) {
		return this.boardDao.getBbsCont(board_no);
	}

	@Override
	public BoardVO getBbsCont2(int board_no) {
		return this.boardDao.getBbsCont(board_no);
	}

	// 상단바에서 게시판 제목 검색
	@Override
	public List<BoardVO> searchboard(String search) {
		return this.boardDao.searchboard(search);
	}

	@Transactional
	@Override
	public BoardVO getBoardCont3(int no) {
		this.boardDao.updateHit(no);
		return this.boardDao.getBoardCont(no);
	}

}
