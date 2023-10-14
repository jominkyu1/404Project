package net.store.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.store.project.dao.HelpDAO;
import net.store.project.vo.help.HelpVO;

@Service
public class HelpServiceImpl implements HelpService {
	
	@Autowired
	private HelpDAO helpDao;

	@Override
	public void insertHelp(HelpVO h) {
		this.helpDao.insertHelp(h);
		
	}
}
