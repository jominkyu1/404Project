package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.ItemRepository;
import net.store.project.vo.item.ItemVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/specialstore")
@RequiredArgsConstructor
public class StoreController {

    private final ItemRepository itemRepository;

    @GetMapping
    public String specialStore(Model model){
        List<ItemVO> itemList = itemRepository.findAll();
        model.addAttribute("itemlist", itemList);
        return "specialstore";
    }
}
