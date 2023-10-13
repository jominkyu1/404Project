package net.store.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelpController {
	
	@GetMapping("/help")
	public String help_main(Model model) {
		
		//TODO 데이터베이스에서 모든 게시글들을 가져와 모델에 담아서 보내주기
		
		//model.addAttribute("boardlist", 게시글목록);
		return "help/help";
	}
}
