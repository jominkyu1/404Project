package net.store.project.controller;

import lombok.RequiredArgsConstructor;
import net.store.project.repository.UserRepository;
import net.store.project.service.UserService;
import net.store.project.vo.user.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final UserService userService;

    @GetMapping
    public String admin_Main(Model model){

        //회원 등급에따른 유저수
        Map<String, Long> count = userCounts();
        model.addAttribute("count", count);

        return "admin/admin_main";
    }

    @GetMapping("/write_store")
    public String admin_Store(){
        return "admin/admin_write_store";
    }

    private Map<String, Long> userCounts(){
        Map<String, Long> count = new HashMap<>();

        count.put("allUsers", userService.getAllCount());
        count.put("normalUsers", userService.getNormalUsersCount());
        count.put("adminUsers", userService.getAdminUsersCount());

        return count;
    }
}
