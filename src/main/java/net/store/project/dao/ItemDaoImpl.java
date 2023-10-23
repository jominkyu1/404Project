package net.store.project.dao;

import net.store.project.vo.item.ItemVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDaoImpl implements ItemDao{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public ItemVO findById(Long itemId) {
        return this.sqlSession.selectOne("findByItemId", itemId);
    }

    @Override
    public void editProduct(ItemVO item) {
        this.sqlSession.update("updateItem", item);
    }
}
