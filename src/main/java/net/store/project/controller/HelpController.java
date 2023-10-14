package net.store.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.store.project.service.HelpService;
import net.store.project.vo.help.HelpVO;

@Controller
public class HelpController {
	
	@Autowired
	private HelpService helpService;
	
	//고객센터 글쓰기
	@RequestMapping(value="/help_write"
			,method=RequestMethod.GET)
	public String help_write(HttpServletRequest request, Model m) {
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		m.addAttribute("page",page);//키,값 쌍으로 쪽번호 저장
		return "help/help_write";//WEB-INF/views/help/
		//help_write.jsp 뷰페이지 경로와 파일명
		
		//TODO 데이터베이스에서 모든 게시글들을 가져와 모델에 담아서 보내주기
		
		//model.addAttribute("help_list", 게시글목록);
	}//help_write()
	
	//게시판 저장
		@RequestMapping(value="/help_write_ok",
				method=RequestMethod.POST)
		//POST방식으로 접근하는 매핑주소를 처리
		public ModelAndView help_write_ok(
				@ModelAttribute HelpVO h) {
			//@ModelAttribute HelpVO h라고 하면 네임피라미터 이름과
			//빈클래스 변수명이 같으면 h객체에 값이 벌써 저장됨.
			this.helpService.insertHelp(h);//고객센터 저장
			return new ModelAndView("redirect:/help_list");
			//help_list로 이동 
		}//help_write_ok()

		//목록보기
		/*@RequestMapping("/help_list")
		//get or post 방식으로 접근하는 매핑주소를 처리
		public ModelAndView board_list(
				PageVO p,
				HttpServletRequest request) {
			int page=1;//쪽번호
			int limit=10;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색
			//필드
			p.setFind_field(find_field);
			p.setFind_name("%"+find_name+"%");
			//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
			//매핑 대응

			int listcount=this.HelpService.getListCount(p);
			//전체 레코드 개수 또는 검색전후 레코드 개수
			//System.out.println("총 게시물수:"+listcount+"개");

			p.setStartrow((page-1)*10+1);//시작행번호
			p.setEndrow(p.getStartrow()+limit-1);//끝행번호

			List<HelpVO> hlist=this.HelpService.getBoardList(p);
			//목록

			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			ModelAndView listM=new ModelAndView();
			listM.addObject("blist",blist);//blist 키이름에 값
			//저장
			listM.addObject("page",page);
			listM.addObject("startpage",startpage);
			listM.addObject("endpage",endpage);
			listM.addObject("maxpage",maxpage);
			listM.addObject("listcount",listcount);	
			listM.addObject("find_field",find_field);
			listM.addObject("find_name", find_name);

			listM.setViewName("board/board_list");//뷰페이지 폴더
			//경로와 파일명 지정
			return listM;
		}*/
}
