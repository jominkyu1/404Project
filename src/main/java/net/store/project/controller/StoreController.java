package net.store.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/specialstore")
public class StoreController {
    @GetMapping
    public String specialStore(){
        return "specialstore";
    }
}
