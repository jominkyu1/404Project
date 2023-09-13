package net.store.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin_main")
public class AdminController {

    @GetMapping
    public String admin_Main(){
        return "admin/admin_main";
    }

    @GetMapping("/write_store")
    public String admin_Store(){
        return "admin/admin_write_store";
    }
}
