package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.store.project.api.ImageHandler;
import net.store.project.dao.QnaDao;
import net.store.project.repository.ItemQnaRepository;
import net.store.project.repository.ItemRepository;
import net.store.project.repository.UserRepository;
import net.store.project.security.StoreUserDetails;
import net.store.project.service.ItemQnaService;
import net.store.project.service.UserService;
import net.store.project.vo.QnaVO;
import net.store.project.vo.admin.PageVO;
import net.store.project.vo.item.ItemQnaVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.item.form.ItemUploadForm;
import net.store.project.vo.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
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
    @GetMapping("/item")
    public String item (Model model){


        Long count = itemQnaRepository.count();
        List<ItemQnaVO> item = itemQnaRepository.findAll();


        //답변이 없는 문의글을 위로
        item.sort(Comparator.comparingInt(ItemQnaVO::getAnswered));


        model.addAttribute("qnaCount", count); //해당 상품에대한 문의글 갯수
        model.addAttribute("item", item);


        return "/admin/admin_item";
    }


    //상품문의의페이징과 검색기능
    @RequestMapping("/item2")
    public ModelAndView bbs_list(Model model,HttpServletRequest request,
                                 PageVO p) {
                        //,@AuthenticationPrincipal StoreUserDetails storeUserDetails)


        Long count = itemQnaRepository.count();
        List<ItemQnaVO> item = itemQnaRepository.findAll();


        //답변이 없는 문의글을 위로
        item.sort(Comparator.comparingInt(ItemQnaVO::getAnswered));


        model.addAttribute("qnaCount", count); //해당 상품에대한 문의글 갯수
        model.addAttribute("item", item);

        int page=1;
        int limit = 10; //한페이지에 보여지는 목록개수를 10개로함
        if(request.getParameter("page")!=null) {
            page=Integer.parseInt(request.getParameter("page"));
        }

        //검색과 관련된 부분
        String find_name = request.getParameter("find_name"); //검색어
        String find_field = request.getParameter("find_field"); //검색필드(select의 option)

        p.setFind_name("%"+find_name+"%"); // %검색어%
        p.setFind_field(find_field);

        int totalCount = this.itemQnaService.getRowCount(p);//검색전 총 레코드 개수,검색이후 레코드갯수
//       long totalCount = itemQnaRepository.count();
       System.out.println("레코드 개수 : " + totalCount);

        p.setStartrow((page-1)*10+1);//시작행 번호
        p.setEndrow(p.getStartrow()+limit-1);//끝행번호

        //페이지가 1일땐 startRow 1 endRow 10
        //페이지가 2일땐 startRow 11 endRow 20


        List<ItemQnaVO> blist = itemQnaService.getBbsList(p); //검색전 전체 목록, 검색이후 목록

        System.out.println("목록 갯수 : " + blist.size());


        //총 페이지수
        int maxpage=(int)((double)totalCount/limit+0.95);
        //시작페이지(1,11,21 ..)
        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
        //현재 페이지에 보여질 마지막 페이지(10,20 ..)
        int endpage=maxpage;
        if(endpage>startpage+10-1) endpage=startpage+10-1;

        ModelAndView listM = new ModelAndView("admin/admin_item2");
        //생성자 인자값으로 뷰페이지 경로 설정
        listM.addObject("item", blist); //blist 키이름에 목록 저장
        listM.addObject("page", page);
        listM.addObject("startpage", startpage); //시작페이지
        listM.addObject("endpage", endpage); //마지막페이지
        listM.addObject("maxpage", maxpage); //최대 페이지
        listM.addObject("totalCount", totalCount); //검색전후 레코드 개수
        listM.addObject("find_field", find_field); //검색필드
        listM.addObject("find_name", find_name); //검색제목

        return listM;


    }//bbs_list()


    private Map<String, Long> userCounts() {
        Map<String, Long> count = new HashMap<>();

        count.put("allUsers", userService.getAllCount());
        count.put("normalUsers", userService.getNormalUsersCount());
        count.put("adminUsers", userService.getAdminUsersCount());

        return count;
    }


}
