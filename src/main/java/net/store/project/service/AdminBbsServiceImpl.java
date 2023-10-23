package net.store.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.store.project.dao.AdminBbsDAO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Service
public class AdminBbsServiceImpl implements AdminBbsService {
	
	@Autowired
	private AdminBbsDAO adminBbsDAO;

	@Override
	public int getListCount(PageVO p) {
		return this.adminBbsDAO.getListCount(p);
	}

	@Override
	public List<BoardVO> getadminBbsList(PageVO p) {
		return this.adminBbsDAO.getadminBbsList(p);
	}
}
