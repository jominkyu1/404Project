package net.store.project.dao;

import net.store.project.vo.help.HelpVO;

public class HelpDAOImpl implements HelpDAO {

	@Override
	public void insertHelp(HelpVO h) {
		this.sqlSession.insert("help_write", h);
		
	}

}