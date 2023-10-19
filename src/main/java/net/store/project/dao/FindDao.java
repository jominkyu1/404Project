package net.store.project.dao;

import net.store.project.vo.user.UserVO;

public interface FindDao {

    UserVO findByUsername(UserVO uservo);
    void updatePwd(UserVO user);
}


