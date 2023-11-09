package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.api.PageableHandler;
import net.store.project.repository.ItemRepository;
import net.store.project.repository.ItemReviewRepository;
import net.store.project.vo.item.ItemReviewVO;
import net.store.project.vo.page.JpaPagingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ItemReviewController {

    private final ItemReviewRepository itemReviewRepository;

    private final ItemRepository itemRepository;

    private final PageableHandler pageableHandler;


    @GetMapping("/itemReview")
    public String itemReview (Model model, @PageableDefault Pageable pageable){


        //페이징
        Page<ItemReviewVO> items = itemReviewRepository.findAll(pageable);
        model.addAttribute("items", items);

        JpaPagingDto jpaPagingDto = pageableHandler.makePages(pageable, items, 3);
        model.addAttribute("paging", jpaPagingDto);


        Long count = itemReviewRepository.count();
        model.addAttribute("reviewCount", count); //리뷰 갯수

        return "/item_review";


    }

}
