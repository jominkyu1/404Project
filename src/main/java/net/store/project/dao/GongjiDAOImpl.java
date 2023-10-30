package net.store.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Repository
public class GongjiDAOImpl implements GongjiDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount(PageVO p) {
		return this.sqlSession.selectOne("g_count",p);
	}//검색전후 레코드 개수	

	@Override
	public List<BoardVO> getGongjiList(PageVO p) {
		return this.sqlSession.selectList("g_list", p);
	}//검색전후 목록

	@Override
	public void insertGongji(BoardVO b) {
		this.sqlSession.insert("g_in", b);
	}//관리자 게시판 저장

	@Override
	public BoardVO getGongjiCont(int board_no) {
		return this.sqlSession.selectOne("g_cont",board_no);
	}//관리자 공지 수정폼과 상세정보

	@Override
	public void editGongji(BoardVO b) {
		this.sqlSession.update("g_edit",b);
	}//관리자 공지 수정 완료

	@Override
	public void delGongji(int no) {
		this.sqlSession.delete("g_del", no);
	}//관리자 공지 삭제

	@Override
	public void updateHit(int board_no) {
		this.sqlSession.update("g_hi",board_no);
	}//조회수 증가

	
	
	
}
