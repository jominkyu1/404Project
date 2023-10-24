package net.store.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.store.project.dao.AdminBoardDAO;
import net.store.project.dao.BbsDAO;
import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private AdminBoardDAO adminBoardDAO;
	
	@Autowired
	private BbsDAO bbsDAO;

	@Override
	public int getListCount(PageVO p) {
		return this.adminBoardDAO.getListCount(p);
	}

	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return this.adminBoardDAO.getBoardList(p);
	}

	@Override
	public void insertBoard(BoardVO b) {
		this.adminBoardDAO.insertBoard(b);
	}

	@Override
	public BoardVO getAdminBoardCont(int board_no) {
		return this.adminBoardDAO.getAdminBoardCont(board_no);
	}

	@Override
	public void editBoard(BoardVO eb) {
		this.adminBoardDAO.editBoard(eb);
	}

	@Override
	public void deleteBoard(int no) {
		this.adminBoardDAO.deleteBoard(no);
	}

	
	@Override
	public void insertBoardWithFiles(BoardVO b, List<BbsVO> bbsList) {
		int sequence = this.adminBoardDAO.insertBoard(b);
		
		bbsList.forEach(bbsVO -> bbsVO.setBoard_no(sequence));
		
		//TODO BbsVO에 BoardVO의 PK를 넣어줘야함
		this.bbsDAO.insertBoardWithFiles(bbsList);
	}

	
}
