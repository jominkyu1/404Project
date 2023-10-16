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
		
	}

	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return this.sqlSession.selectList("board_li",p);
	}
	
	@Override
	public int getListCount(PageVO p) {
		return this.sqlSession.selectOne("board_row",p);
	}

	
	
	

}
