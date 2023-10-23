package net.store.project.dao;

import net.store.project.vo.item.ItemVO;

public interface ItemDao {
    ItemVO findById(Long itemId);

    void editProduct(ItemVO item);
}
