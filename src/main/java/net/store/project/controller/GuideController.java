package net.store.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/guide")
public class GuideController {

    @GetMapping
    public String guide() {
        return "guide";
    }

    @GetMapping("/digitalit")
    public String digitalIt(){
        return "digital_IT";
    }

    @GetMapping("/item")
    public String itemInfo(){
        return "bluetooth_earphone_guide";
    }
}
