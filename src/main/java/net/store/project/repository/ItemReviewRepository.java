package net.store.project.repository;

import net.store.project.vo.item.ItemReviewVO;
import net.store.project.vo.item.ItemVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface ItemReviewRepository extends JpaRepository<ItemReviewVO, Long> {

    Optional<ItemReviewVO> findByItemVO(ItemVO itemVO);

    Integer countByItemVO(ItemVO itemVO);

    List<ItemReviewVO> findAllByItemVO(ItemVO itemVO);

//    List<ItemReviewVO> findAllByAnswered(int answered);

    @Query("select pr from ItemReviewVO pr where pr.userVO.user_id = :user_id")
    List<ItemReviewVO> findAllByUserId(Long user_id);


}
