package net.store.project.service;

import net.store.project.dao.ItemDao;
import net.store.project.vo.item.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService {

    @Autowired
    private ItemDao itemDao;

    public ItemVO findById(Long itemId) {
        //DAO에서 똑같은 메소드를 만든 후 마이바티스에서 item_id에 해당하는 itemVO를 가져와서 리턴
        return this.itemDao.findById(itemId);
    }

    public void editProduct(ItemVO item) {
        this.itemDao.editProduct(item);

    }

    //상단바에서 게시판 제목 검색
    public List<ItemVO> searchItems(String search) {
        return  itemDao.searchItems(search);
    }

}
