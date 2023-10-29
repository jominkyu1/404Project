package net.store.project.repository;

import net.store.project.vo.item.ItemVO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface ItemRepository extends JpaRepository<ItemVO, Long> {

    Page<ItemVO> findAllByNameLike(String name, Pageable pageable);

}
