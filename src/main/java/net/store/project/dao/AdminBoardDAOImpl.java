package net.store.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Repository
public class AdminBoardDAOImpl implements AdminBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount(PageVO p) {
		return this.sqlSession.selectOne("ab_count", p);
	}//검색전후 레코드 개수

	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return this.sqlSession.selectList("ab_list", p);
	}//검색전후 목록

	@Override
	public int insertBoard(BoardVO b) {
		this.sqlSession.insert("ab_in", b);
		int sequence = b.getBoard_no();

		return sequence;
	}//관리자 게시판 저장

	@Override
	public BoardVO getAdminBoardCont(int board_no) {
		return this.sqlSession.selectOne("ab_cont", board_no);
	}//내용보기+수정폼

	@Override
	public void editBoard(BoardVO eb) {
		this.sqlSession.update("ab_edit", eb);
	}//수정완료

	@Override
	public void deleteBoard(int no) {
		this.sqlSession.delete("ab_del", no);
	}//삭제
	
	
}
