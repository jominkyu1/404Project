package net.store.project.service;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.ItemReviewRepository;
import net.store.project.vo.item.ItemQnaVO;
import net.store.project.vo.item.ItemReviewVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.order.OrderStatus;
import net.store.project.vo.order.OrderVO;
import net.store.project.vo.user.UserVO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemReviewService {

    private final ItemReviewRepository itemReviewRepository;

    @Transactional
    public void applyReview(ItemReviewVO itemReviewVO){
        itemReviewRepository.save(itemReviewVO);
        itemReviewVO.getItemVO().setQna_count(itemReviewVO.getItemVO().getQna_count()+1);

        //QNA가 등록되면 아이템의 QNA_COUNT가 1증가
    }


    public int countReview(ItemVO itemVO){
        return itemReviewRepository.countByItemVO(itemVO);
    }

    public List<ItemReviewVO> findAllReview(ItemVO itemVO){
        return itemReviewRepository.findAllByItemVO(itemVO);
    }

}
