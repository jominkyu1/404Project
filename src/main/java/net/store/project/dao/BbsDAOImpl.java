package net.store.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.page.PageVO;

@Repository
public class BbsDAOImpl implements BbsDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBoardWithFiles(List<BbsVO> bbsList) {
		for(BbsVO bbs : bbsList) {
			this.sqlSession.insert("insert_files", bbs);
		}
	}//자료실 저장

	@Override
	public int getRowCount(PageVO p) {
		return this.sqlSession.selectOne("bbs_count",p);
	}//검색 전후 총 레코드 개수

	@Override
	public List<BbsVO> getBbsList(PageVO p) {
		return this.sqlSession.selectList("bbs_list",p);//mybatis에서 selectList()메서드는
		//하나이상의 레코드를 검색해서 컬렉션 List로 변환
	}//검색전후 목록
	





}
