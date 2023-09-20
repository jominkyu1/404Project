package net.store.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recommand")
public class RecommandController {
    @GetMapping
    public String recommand() {
        return "recommand";
    }

    @GetMapping("/item")
    public String recommandItem(){
        return "recommand-re";
    }
}
