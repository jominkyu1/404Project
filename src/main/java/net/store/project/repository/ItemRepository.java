package net.store.project.repository;

import net.store.project.vo.item.ItemCategory;
import net.store.project.vo.item.ItemVO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface ItemRepository extends JpaRepository<ItemVO, Long> {

    Page<ItemVO> findAllByNameLike(String name, Pageable pageable);
    Page<ItemVO> findAllByNameContaining(String name, Pageable pageable);

    //카테고리별 상품리스트
    Page<ItemVO> findAllByCategory(ItemCategory category, Pageable pageable);

    //검색어와 카테고리별 상품리스트
    Page<ItemVO> findAllByNameContainingAndCategory(String name, ItemCategory category, Pageable pageable);
}
