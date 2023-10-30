package net.store.project.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.store.project.security.StoreUserDetails;
import net.store.project.service.BoardService;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	//사용자 게시판 글쓰기 폼
	@GetMapping("/board_write")
	//get으로 접근하는 매핑주소를 처리한다.
	public String board_write(HttpServletRequest request,
			Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		m.addAttribute("page",page);//키,값 쌍으로 쪽번호 저장
		
		
		return "board/board_write";//WEB-INF/views/board/
		//board_write.jsp 뷰페이지 경로와 파일명
	}//board_write()

	//게시판 저장
	@PostMapping(value="/board_write_ok")
	//POST방식으로 접근하는 매핑주소를 처리
	public ModelAndView board_write_ok(
		@ModelAttribute BoardVO b,
		@RequestParam("board_pwd") String board_pwd,
		@AuthenticationPrincipal StoreUserDetails storeUserDetails,
		HttpServletResponse response) throws Exception {
		
		//비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(b.getBoard_pwd());
		b.setBoard_pwd(encodedPassword);
		
		
		b.setBoard_category("qna");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String encodedAdminPassword = storeUserDetails.getUser().getPassword();
		//게시글의 비밀번호가 유저의 비밀번호와 일치하는지 확인
		if(!passwordEncoder.matches(board_pwd, encodedAdminPassword)) {
			out.println("<script>");
			out.println("alert('비밀 번호가 다릅니다!');");
			out.println("location='board_list';");
			out.println("</script>");
		}else {
			this.boardService.insertBoard(b);
			return new ModelAndView("redirect:/board_list");
			//board_list로 이동
		}
		return null;
		
		//@ModelAttribute BoardVO b라고 하면 네임피라미터 이름과
		//빈클래스 변수명이 같으면 b객체에 값이 벌써 저장됨.
		//this.boardService.insertBoard(b);//게시판 저장
		
	}//board_write_ok()

	//목록보기
	@RequestMapping("/board_list")
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
		
		//p.setBoard_category(board_category);//get으로 전달된 qna, bbs, gongji저장
		p.setFind_field(find_field);
		p.setFind_name("%"+find_name+"%");
		//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
		//매핑 대응

		int listcount=this.boardService.getListCount(p);
		//전체 레코드 개수 또는 검색전후 레코드 개수
		//System.out.println("총 게시물수:"+listcount+"개");

		p.setStartrow((page-1)*10+1);//시작행번호
		p.setEndrow(p.getStartrow()+limit-1);//끝행번호

		List<BoardVO> blist=this.boardService.getBoardList(p);
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
	}

	/*내용보기+수정폼+답변폼+삭제폼*/
	@RequestMapping("/board_cont")
	public String board_cont(
			@RequestParam("no") int board_no,
			@RequestParam("state") String state,
			HttpServletRequest request,
			Model m,@ModelAttribute BoardVO b)
					throws Exception{
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}

		if(state.equals("cont")) {//내용보기일때만 조회수 증가
			b=this.boardService.getBoardCont(board_no);
			this.boardService.updateHit(board_no);
		}else {
			b=this.boardService.getBoardCont2(board_no);
		}

		String board_cont=b.getBoard_cont().replace("\n",
				"<br/>");
		//textarea태그 영역에서 엔터키 친부분을 웹브라우에 출력할때 줄바꿈처리

		m.addAttribute("b",b);
		m.addAttribute("bcont",board_cont);
		m.addAttribute("page",page);//키,값 쌍으로 저장

		if(state.equals("cont")) {//내용보기
			return "board/board_cont";// /WEB-INF/board/
			//board_cont.jsp 뷰페이지로 이동
		}else if(state.equals("reply")) {//답변글 폼
			return "board/board_reply";
		}else if(state.equals("edit")) {//수정폼
			return "board/board_edit";
		}
		return null;
	}//board_cont()

	//답변 저장+레벨증가
	@RequestMapping("/board_reply_ok")
	public String board_reply_ok(
			HttpServletResponse response,
			@AuthenticationPrincipal StoreUserDetails storeUserDetails,
			HttpServletRequest request, @ModelAttribute BoardVO b)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String board_pwd = b.getBoard_pwd();

		//비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(b.getBoard_pwd());
		b.setBoard_pwd(encodedPassword);
		
		String encodedAdminPassword = storeUserDetails.getUser().getPassword();
		//게시물 번호를 기준으로 디비로 부터 비번을 가져옴.
		if(!passwordEncoder.matches(board_pwd, encodedAdminPassword)) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			/* 1. @ModelAttribute BoardVO rb라고 하면 네임피라미터 이름과
			 * 빈클래스 변수명이 일치하면 rb객체에 값이 저장되어져 있다. 		
			 */
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			this.boardService.replyBoard(b);//답변저장+레벨증가
			return "redirect:/board_list?page="+page;//목록보기로 이동
		}
		return null;
		
	}

	/* 수정완료 */
	@RequestMapping("/board_edit_ok")
	public String board_edit_ok(@ModelAttribute BoardVO b,
			@RequestParam("board_pwd") String board_pwd,
			HttpServletResponse response,
			HttpServletRequest request) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		//웹브라우저로 출력되는 파일형태와 언어코딩 타입을 설정
		PrintWriter out=response.getWriter();
		//비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(b.getBoard_pwd());
		b.setBoard_pwd(encodedPassword);
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		BoardVO db_pwd=this.boardService.getBoardCont2(b.getBoard_no());
		//게시물 번호를 기준으로 디비로 부터 비번을 가져옴.
		if(!passwordEncoder.matches(board_pwd, db_pwd.getBoard_pwd())) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			this.boardService.editBoard(b);//게시물 수정
			return 
					"redirect:/board_cont?no="+b.getBoard_no()+
					"&page="+page+"&state=cont";//?뒤에 3개의 인자값이 get방식으로
			//내용보기로 이동.	 
		}
		return null;
	}//board_edit_ok()
	
	//삭제 완료
		@RequestMapping("/board_del_ok")
		public String board_del_ok(
				@RequestParam("no") int board_no,
				HttpServletResponse response,
				HttpServletRequest request)
						throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			//오라클 디비로 부터 비번을 가져옴.
			
			this.boardService.delBoard(board_no);//게시판 삭제
			return "redirect:/board_list?page="+page;
		
		}//board_del_ok()
	
}
