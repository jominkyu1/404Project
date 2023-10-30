package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import net.store.project.api.PageableHandler;
import net.store.project.repository.ItemRepository;
import net.store.project.vo.item.ItemCategory;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.page.JpaPagingDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/specialstore")
@RequiredArgsConstructor
public class StoreController {

    private final ItemRepository itemRepository;
    private final PageableHandler pageableHandler;

    @GetMapping
    public String specialStore(Model model,
                               @PageableDefault(size=8, sort="regdate") Pageable pageable,
                               @RequestParam(required = false) String search,
                               @RequestParam(required = false) String category) {

        Page<ItemVO> itemList = itemListBySearchAndCategory(search, category, pageable);
        JpaPagingDto jpaPagingDto = pageableHandler.makePages(pageable, itemList, 3);

        model.addAttribute("itemlist", itemList.getContent());
        model.addAttribute("paging", jpaPagingDto);
        model.addAttribute("search", search);
        model.addAttribute("category", category);

        return "specialstore";
    }

    private Page<ItemVO> itemListBySearchAndCategory(String search, String category, Pageable pageable){
        //전체상품
        if(search == null && category == null) {
            return itemRepository.findAll(pageable);
        } //검색어만 존재할때
        else if(search != null && Objects.equals(category, "") || category == null) {
            return itemRepository.findAllByNameContaining(search, pageable);
        } //카테고리만
        else if(search == null) {
            return itemRepository.findAllByCategory(ItemCategory.valueOf(category), pageable);
        }

        //검색어 + 카테고리
        return itemRepository.findAllByNameContainingAndCategory(search, ItemCategory.valueOf(category), pageable);
    }
}
