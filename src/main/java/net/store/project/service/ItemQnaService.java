package net.store.project.service;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.ItemQnaRepository;
import net.store.project.vo.item.ItemQnaVO;
import net.store.project.vo.item.ItemVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
public class ItemQnaService {

    private final ItemQnaRepository itemQnaRepository;



    @Transactional
    public void applyQna(ItemQnaVO itemQnaVO){
        itemQnaRepository.save(itemQnaVO);
        itemQnaVO.getItemVO().setQna_count(itemQnaVO.getItemVO().getQna_count()+1);

        //QNA가 등록되면 아이템의 QNA_COUNT가 1증가
    }

    @Transactional
    public void answerQna(Long item_qna_id, String answered_text){
        ItemQnaVO itemQnaVO = itemQnaRepository.findById(item_qna_id)
                .orElseThrow(() -> new NoSuchElementException("해당 문의글을 찾을 수 없습니다."));

        itemQnaVO.setAnswered(1);
        itemQnaVO.setAnswered_text(answered_text);

        //상품문의 답변이 등록되면 해당 문의글의 ANSWERED가 1로 변경
        //답변내용이 answered_text에 저장
    }

    public int countQna(ItemVO itemVO){
        return itemQnaRepository.countByItemVO(itemVO);
    }

    public List<ItemQnaVO> findAllQna(ItemVO itemVO){
        return itemQnaRepository.findAllByItemVO(itemVO);
    }





}

