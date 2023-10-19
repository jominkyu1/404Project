package net.store.project.dao;

import net.store.project.vo.user.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

@Repository
public class FindDaoImpl implements FindDao{

    @Autowired
    private SqlSession sqlSession;


    @Override
    public UserVO findByUsername(UserVO uservo) {
        return this.sqlSession.selectOne("p_find", uservo);
    }

    @Override
    public void updatePwd(UserVO user) {
        this.sqlSession.update("p_edit", user);
    }
}
