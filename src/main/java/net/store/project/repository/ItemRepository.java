package net.store.project.repository;

import net.store.project.vo.item.ItemVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


public interface ItemRepository extends JpaRepository<ItemVO, Long> {


}
