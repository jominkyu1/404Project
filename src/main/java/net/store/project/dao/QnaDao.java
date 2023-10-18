package net.store.project.dao;

import net.store.project.vo.admin.PageVO;
import net.store.project.vo.item.ItemQnaVO;

import java.util.List;

public interface QnaDao {

    void insertBbs(PageVO b);

    

    List<ItemQnaVO> getBbsList(PageVO p);

    void updateHit(int bbs_no);

    PageVO getBbsCont(int bbs_no);

    void updateLevel(PageVO rb);

    void replyBbs(PageVO rb);

    void editBbs(PageVO b);

    void delBbs(int bbs_no);

    int getRowCount(PageVO p);
}






