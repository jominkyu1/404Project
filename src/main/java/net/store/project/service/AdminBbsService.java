package net.store.project.service;

import java.util.List;

import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.page.PageVO;

public interface AdminBbsService {

	int getListCount(PageVO p);

	List<BbsVO> getadminBbsList(PageVO p);

	void adminInsertBbs(BbsVO b);

}
