package net.store.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.store.project.dao.AdminBbsDAO;
import net.store.project.dao.AdminBoardDAO;
import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private AdminBoardDAO adminBoardDAO;
	
	@Autowired
	private AdminBbsDAO adminBbsDAO;

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

	@Transactional
	@Override
	public void insertBoardWithFiles(BoardVO b, List<BbsVO> bbsList) {
		//TODO b의 PK 값을 각 List에 담아야함
		
		//TODO Board의 DAO와 Bbs의 DAO에있는 insert 호출
		this.adminBoardDAO.insertBoard(b);
		this.adminBbsDAO.insertBoardWithFiles(bbsList);
	}

	
}
