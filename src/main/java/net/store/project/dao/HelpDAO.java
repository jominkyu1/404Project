package net.store.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.store.project.vo.help.HelpVO;

@Repository 
public interface HelpDAO {
	
	@Autowired
	private SqlSession sqlSession; //mybatis 쿼리문 수행 sqlSession 의존성 주입

	void insertHelp(HelpVO h);
}
