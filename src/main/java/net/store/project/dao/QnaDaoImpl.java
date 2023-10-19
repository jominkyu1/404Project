package net.store.project.dao;

import net.store.project.vo.admin.PageVO;
import net.store.project.vo.item.ItemQnaVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QnaDaoImpl implements QnaDao {

    @Autowired
    private SqlSession sqlSession; //Mybatis 쿼리문 수행




    @Override
    public void insertBbs(PageVO b) {

    }


    @Override
    public int getRowCount(PageVO p) {
        return this.sqlSession.selectOne("bbs_count", p);
    }

    @Override
    public List<ItemQnaVO> getBbsList(PageVO p) {
        return this.sqlSession.selectList("bbs_list", p);
    }

    @Override
    public void updateHit(int bbs_no) {

    }

    @Override
    public PageVO getBbsCont(int bbs_no) {
        return null;
    }

    @Override
    public void updateLevel(PageVO rb) {

    }

    @Override
    public void replyBbs(PageVO rb) {

    }

    @Override
    public void editBbs(PageVO b) {

    }

    @Override
    public void delBbs(int bbs_no) {

    }


}
