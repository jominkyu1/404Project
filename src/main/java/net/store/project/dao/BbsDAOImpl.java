package net.store.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Repository
public class BbsDAOImpl implements BbsDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBoardWithFiles(List<BbsVO> bbsList) {
		for (BbsVO bbs : bbsList) {
			this.sqlSession.insert("bs_in", bbs);
		}
	}// 자료실 저장

	@Override
	public int getRowCount(PageVO p) {
		return this.sqlSession.selectOne("bs_count", p);
	}// 검색 전후 총 레코드 개수

	@Override
	public List<BbsVO> getBbsList(PageVO p) {
		return this.sqlSession.selectList("bs_list", p);// mybatis에서 selectList()메서드는
		// 하나이상의 레코드를 검색해서 컬렉션 List로 변환
	}// 검색전후 목록

	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return this.sqlSession.selectList("bs_list", p);
	}// 검색전후 목록

	@Override
	public List<BbsVO> getFiles(int board_no) {
		return this.sqlSession.selectList("bs_co", board_no);
	}// 내용보기

	@Override
	public void updateHit(int board_no) {
		this.sqlSession.update("bs_hi", board_no);
	}// 조회수 증가

	@Override
	public void delBbs(int board_no) {
		this.sqlSession.delete("bs_del", board_no);
	}// 삭제

	@Override
	public void editBbs(BoardVO b) {
		this.sqlSession.update("bs_edit", b);
	}// 수정

	@Override
	public void delbbsFile(int bbs_no) {
		this.sqlSession.delete("bsfile_del", bbs_no);
	}// db 삭제

	@Override
	public BbsVO getFile(int bbs_no) {
		return this.sqlSession.selectOne("getFileByBbs_no", bbs_no);
	}// 실제 파일 삭제

	@Override
	public int getRowCount2(PageVO p) {
		return this.sqlSession.selectOne("bs_count2", p);
	}

	@Override
	public List<BoardVO> getBoardList2(PageVO p) {
		return this.sqlSession.selectList("bs_list2", p);
	}

}
