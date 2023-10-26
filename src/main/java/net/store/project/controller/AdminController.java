package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.api.ImageHandler;
import net.store.project.repository.ItemQnaRepository;
import net.store.project.repository.ItemRepository;
import net.store.project.repository.UserRepository;
import net.store.project.service.ItemQnaService;
import net.store.project.service.ItemService;
import net.store.project.service.UserService;

import net.store.project.vo.item.ItemQnaVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.item.form.ItemUploadForm;
import net.store.project.vo.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;


@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

    private final UserRepository userRepository;
    private final UserService userService;
    private final ItemRepository itemRepository;
    private final ImageHandler imageHandler;
    private final ItemQnaRepository itemQnaRepository;
    private final ItemQnaService itemQnaService;

    @Autowired
    private ItemService itemService;


    @GetMapping
    public String admin_Main(Model model){

        //회원 등급에따른 유저수
        Map<String, Long> count = userCounts();
        model.addAttribute("count", count);

        List<ItemQnaVO> notAnsweredQnaList = itemQnaRepository.findAllByAnswered(0);// 0 미답변 1 답변
        if(notAnsweredQnaList.size() > 10) model.addAttribute("qnaMore", true); // 10개 이상이면 더보기 버튼
        notAnsweredQnaList.sort(Comparator.comparing(ItemQnaVO::getRegdate).reversed()); // 최신순으로 정렬

        notAnsweredQnaList.subList(0, Math.min(notAnsweredQnaList.size(), 10)); // 10개만 가져오기
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


    //상품수정 폼 표시
    @GetMapping("/item/{itemId}/edit")
    public String editProductForm(@PathVariable Long itemId, Model model){

        //GET요청일경우 처리
        ItemVO item = this.itemService.findById(itemId);
        System.out.println("상품정보:" + item);
        model.addAttribute("item", item);

        //select update 구현

        //id ->쿼리로 객체 가져오기 -> jsp로 뿌려주기 ->submit 시 update문

    //아이템의 id jsp에서 넘기기

        return "/admin/admin_store_edit";
    }



    // 상품 수정 처리
    @RequestMapping(value = "/item/{itemId}/edit", method = RequestMethod.POST)
    public String editProduct(@PathVariable Long itemId, @ModelAttribute ItemVO item) {
        // 상품 정보를 수정하고, 수정이 성공하면 상품 목록 페이지로 리다이렉트
        System.out.println("수정ID::: " + itemId);
        System.out.println("수정할아이템::: " + item);


        item.setItem_id(itemId);
        this.itemService.editProduct(item);


        return "redirect:/admin/store";
    }





    //회원관리
    @GetMapping("/members")
    public String members(Model model){
        Long count = userRepository.count();
        List<UserVO> list = userRepository.findAll();

        model.addAttribute("userList", list);
        model.addAttribute("memberCount", count); //회원수

        return "/admin/admin_members";
    }



    //상품문의
    @GetMapping("/item")                        /* default size = 10 */
    public String item (Model model, @PageableDefault(size = 10, sort={"answered", "regdate"}) Pageable pageable){
        //페이징
        Page<ItemQnaVO> items = itemQnaRepository.findAll(pageable);
        model.addAttribute("items", items);

        int previous = pageable.previousOrFirst().getPageNumber();
        int next = pageable.next().getPageNumber();

        model.addAttribute("previous", previous);
        model.addAttribute("next", next);
        model.addAttribute("hasPrevious", items.hasPrevious());
        model.addAttribute("hasNext", items.hasNext());

        int blockLimit = 3;
        int startPage = Math.max(1, (((int) Math.ceil((double) pageable.getPageNumber() / blockLimit)) -1) * blockLimit +1);
        int endPage = Math.min((startPage + blockLimit -1), items.getTotalPages());

        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        Long count = itemQnaRepository.count();
        model.addAttribute("qnaCount", count); //해당 상품에대한 문의글 갯수

        return "/admin/admin_item";
    }

    private Map<String, Long> userCounts() {
        Map<String, Long> count = new HashMap<>();

        count.put("allUsers", userService.getAllCount());
        count.put("normalUsers", userService.getNormalUsersCount());
        count.put("adminUsers", userService.getAdminUsersCount());

        return count;
    }






}
