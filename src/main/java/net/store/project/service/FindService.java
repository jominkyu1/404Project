package net.store.project.service;

import net.store.project.dao.FindDao;
import net.store.project.vo.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FindService {

    @Autowired
    private FindDao findDao;

    public UserVO findByUsername(UserVO uservo) {
        return this.findDao.findByUsername(uservo);
    }

    public void updatePwd(UserVO user) {
        this.findDao.updatePwd(user);
    }
}
