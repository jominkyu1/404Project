package net.store.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void insertBoard(BoardVO b) {
		this.sqlSession.insert("board_in",b);
		
	}//게시판 저장

	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return this.sqlSession.selectList("board_li",p);
		//selectList()메서드는 복수개의 레코드를 검색해서 컬렉션 List로
		//반환한다. select 아이디명 board_li		
	}//검색 전후 게시판 목록
	
	@Override
	public int getListCount(PageVO p) {
		return this.sqlSession.selectOne("board_row",p);
		//selectOne() 메서드는 단 한개의 레코드만 반환. board_row는
		//select 아이디명		
	}//검색 전후 레코드 개수

	@Override
	public BoardVO getBoardCont(int board_no) {
		return this.sqlSession.selectOne("board_co",board_no);
	}//내용보기

	@Override
	public void updateHit(int board_no) {
		this.sqlSession.update("board_hi", board_no);
	}//조회수 증가

	@Override
	public void replyBoard(BoardVO rb) {
		this.sqlSession.insert("reply_in",rb);
	}//답변저장

	@Override
	public void editBoard(BoardVO eb) {
		this.sqlSession.update("board_up", eb);
	}//게시물 수정

	@Override
	public void delBoard(int board_no) {
		this.sqlSession.delete("board_del",board_no);
	}//게시물 삭제
	

	
	
	

}
