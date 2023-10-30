package net.store.project.dao;

import net.store.project.vo.item.ItemVO;

import java.util.List;

public interface ItemDao {
    ItemVO findById(Long itemId);

    void editProduct(ItemVO item);

    List<ItemVO> searchItems(String search);

}
