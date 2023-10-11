package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.api.ImageHandler;
import net.store.project.repository.ItemQnaRepository;
import net.store.project.repository.ItemRepository;
import net.store.project.service.ItemQnaService;
import net.store.project.service.UserService;
import net.store.project.vo.item.ItemQnaVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.item.form.ItemUploadForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

    private final UserService userService;
    private final ItemRepository itemRepository;
    private final ImageHandler imageHandler;
    private final ItemQnaRepository itemQnaRepository;
    private final ItemQnaService itemQnaService;

    @GetMapping
    public String admin_Main(Model model){

        //회원 등급에따른 유저수
        Map<String, Long> count = userCounts();
        model.addAttribute("count", count);

        List<ItemQnaVO> notAnsweredQnaList = itemQnaRepository.findAllByAnswered(0);// 0 미답변 1 답변
        model.addAttribute("notAnsweredQnaList", notAnsweredQnaList);

        return "admin/admin_main";
    }

    @PostMapping("/answer")
    public String answer(@RequestParam String type,
                         @RequestParam String answered_text,
                         @RequestParam Long item_qna_id){

        //답변이 상품문의에 대한 답변이면 처리
        if(type.equals("item")){
            itemQnaService.answerQna(item_qna_id, answered_text);
        }

        //TODO 일반 QNA답변처리

        System.out.println(type + answered_text + item_qna_id);
        return "redirect:/admin";
    }

    @GetMapping("/store")
    public String admin_Store(Model model){
        List<ItemVO> itemList = itemRepository.findAll();
        model.addAttribute("itemlist", itemList);
        return "admin/admin_store";
    }

    @GetMapping("/store/write")
    public String admin_Store_Write(@ModelAttribute ItemUploadForm itemUploadForm){
        return "admin/admin_store_write";
    }

    @PostMapping("/store/write")
    public String admin_Store_Write_process(@Valid @ModelAttribute ItemUploadForm itemUploadForm,
                                            BindingResult bindingResult,
                                            Model model) throws IOException {
        //오류처리
        if(bindingResult.hasErrors()){
            log.info("binding errors={}", bindingResult);
            model.addAttribute("errors", bindingResult);
            return "admin/admin_store_write";
        }

        //파일업로드 리턴은 날짜경로/랜덤파일명
        String randomFilename = imageHandler.upload(itemUploadForm.getImage());

        //폼객체 -> item entity
        ItemVO item = ItemUploadForm.toEntity(itemUploadForm);
        item.setImage_path(randomFilename);

        itemRepository.save(item);
        return "redirect:/admin/store";
    }

    private Map<String, Long> userCounts() {
        Map<String, Long> count = new HashMap<>();

        count.put("allUsers", userService.getAllCount());
        count.put("normalUsers", userService.getNormalUsersCount());
        count.put("adminUsers", userService.getAdminUsersCount());

        return count;
    }
}
