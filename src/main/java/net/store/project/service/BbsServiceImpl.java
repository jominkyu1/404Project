package net.store.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.store.project.dao.BbsDAO;
import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.page.PageVO;

@Service
public class BbsServiceImpl implements BbsService {
	
	@Autowired
	private BbsDAO bbsDAO;

	@Override
	public int getRowCount(PageVO p) {
		return this.bbsDAO.getRowCount(p);
	}

	@Override
	public List<BbsVO> getBbsList(PageVO p) {
		return this.bbsDAO.getBbsList(p);
	}



	
}
