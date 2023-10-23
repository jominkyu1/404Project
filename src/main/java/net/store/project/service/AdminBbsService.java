package net.store.project.service;

import java.util.List;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

public interface AdminBbsService {

	int getListCount(PageVO p);

	List<BoardVO> getadminBbsList(PageVO p);

}
