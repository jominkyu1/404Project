package net.store.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Repository
public class AdminBbsDAOImpl implements AdminBbsDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount(PageVO p) {
		return this.sqlSession.selectOne("abbs_count", p);
	}//관리자 자료실 검색전후 레코드 개수	

	@Override
	public List<BoardVO> getadminBbsList(PageVO p) {
		return this.sqlSession.selectList("abbs_list", p);
	}
}
