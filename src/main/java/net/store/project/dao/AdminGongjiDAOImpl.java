package net.store.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Repository
public class AdminGongjiDAOImpl implements AdminGongjiDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount(PageVO p) {
		return this.sqlSession.selectOne("ab_count",p);
	}//검색전후 레코드 개수	

	@Override
	public List<BoardVO> getGongjiList(PageVO p) {
		return this.sqlSession.selectList("ab_list", p);
	}//검색전후 목록

	@Override
	public void insertGongji(BoardVO b) {
		this.sqlSession.insert("ag_in", b);
	}//관리자 게시판 저장

	
	
	
}
