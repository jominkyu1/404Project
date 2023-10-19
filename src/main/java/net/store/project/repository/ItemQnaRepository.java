package net.store.project.repository;

import net.store.project.vo.item.ItemQnaVO;
import net.store.project.vo.item.ItemVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;


public interface ItemQnaRepository extends JpaRepository<ItemQnaVO, Long> {

   Optional<ItemQnaVO> findByItemVO(ItemVO itemVO);

   Integer countByItemVO(ItemVO itemVO);

   List<ItemQnaVO> findAllByItemVO(ItemVO itemVO);

   List<ItemQnaVO> findAllByAnswered(int answered);

   @Query("select iq from ItemQnaVO iq where iq.userVO.user_id = :user_id")
   List<ItemQnaVO> findAllByUserId(Long user_id);
}
