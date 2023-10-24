package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.ItemQnaRepository;
import net.store.project.repository.ItemRepository;
import net.store.project.repository.UserRepository;
import net.store.project.service.ItemQnaService;
import net.store.project.vo.item.ItemQnaVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.user.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

@Controller
@RequestMapping("item")
@RequiredArgsConstructor
public class ItemController {

    private final ItemRepository itemRepository;
    private final UserRepository userRepository;
    private final ItemQnaService itemQnaService;

    @GetMapping
    public String itemInfo(){
        return "iteminfo";
    }

    @GetMapping("/{item_id}")
    public String itemInfo(@PathVariable Long item_id, Model model){
        ItemVO item = itemRepository.findById(item_id)
                .orElseThrow(() -> new IllegalArgumentException("해당 아이템이 없습니다."));

        model.addAttribute("item", item);


        //상품문의처리
        int count = itemQnaService.countQna(item);
        List<ItemQnaVO> qnaList = itemQnaService.findAllQna(item);
        //답변이 없는 문의글을 위로
        qnaList.sort(Comparator.comparingInt(ItemQnaVO::getAnswered));
        
        model.addAttribute("qnaCount", count); //해당 상품에대한 문의글 갯수
        model.addAttribute("qnaList", qnaList); //해당 상품에대한 문의글 리스트
        return "iteminfo";
    }


    /**
     * 상품문의 등록 메소드
     * */
    @PostMapping("/{item_id}/applyQna")
    public String applyQna(@PathVariable Long item_id,
                           @RequestParam String username,
                           @RequestParam String contents){
        ItemVO itemVO = itemRepository.findById(item_id)
                .orElseThrow(() -> new IllegalArgumentException("문의 등록 중 오류가 발생했습니다. 상품을 찾을 수 없습니다."));
        UserVO userVO = userRepository.findByUsername(username)
                .orElseThrow(() -> new NoSuchElementException("문의 등록 중 오류가 발생했습니다. 유저를 찾을 수 없습니다."));

        ItemQnaVO qnaVO = ItemQnaVO.builder()
                    .itemVO(itemVO)
                    .userVO(userVO)
                    .contents(contents)
                    .build();

        itemQnaService.applyQna(qnaVO);

        return "redirect:/item/{item_id}";
    }







}
