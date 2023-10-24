package net.store.project.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.store.project.security.StoreUserDetails;
import net.store.project.service.AdminBoardService;
import net.store.project.service.BoardService;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;
import net.store.project.vo.user.UserVO;

//@Controller
//public class AdminBoardController {
	
//	@Autowired
//	private AdminBoardService adminBoardService;
	
//	@Autowired
//	private BoardService boardService;
	
	//@Autowired
	//private PasswordEncoder passwordEncoder;
	
	/*관리자 게시판 목록*/
	/*@RequestMapping("/admin_board_list")
	public String admin_board_list(Model listM,
			@ModelAttribute PageVO p,
			@AuthenticationPrincipal StoreUserDetails storeUserDetails,
			HttpServletResponse response,	
			HttpServletRequest request)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		UserVO u = storeUserDetails.getUser();

		if(u==null || !u.getUsername().equals("admin")) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='login';");
			out.println("</script>");
		}else {//관리자 로그인 후 게시판 목록
			int page=1;//쪽번호
			int limit=7;//한페이지에 보여지는 목록개수
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

			int listcount=this.adminBoardService.getListCount(p);
			//전체 레코드 개수 또는 검색전후 레코드 개수
			//System.out.println("총 게시물수:"+listcount+"개");

			p.setStartrow((page-1)*7+1);//시작행번호
			p.setEndrow(p.getStartrow()+limit-1);//끝행번호

			List<BoardVO> blist=
					this.adminBoardService.getBoardList(p);
			//목록

			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			listM.addAttribute("blist",blist);
			//blist 키이름에 값 저장
			listM.addAttribute("page",page);
			listM.addAttribute("startpage",startpage);
			listM.addAttribute("endpage",endpage);
			listM.addAttribute("maxpage",maxpage);
			listM.addAttribute("listcount",listcount);	
			listM.addAttribute("find_field",find_field);
			listM.addAttribute("find_name", find_name);

			return "board/admin_board_list";
			//뷰페이지 폴더경로와 파일명 지정		
		}
		return null;
	}//admin_board_list()
	
	//관리자 게시판 글쓰기
	@RequestMapping("/admin_board_write")
	public ModelAndView admin_board_write(
			@AuthenticationPrincipal StoreUserDetails storeUserDetails,
			HttpServletRequest request,
			HttpServletResponse response)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		UserVO u = storeUserDetails.getUser();
		if(u==null || !u.getUsername().equals("admin")) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='login';");
			out.println("</script>");
		}else {//관리자 로그인 된 상태
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));     		
			}
			ModelAndView cm=
					new ModelAndView("board/admin_board_write");
			cm.addObject("page",page);
			return cm;
		}
		return null;
	}//admin_board_write
	
	//관리자 게시판 저장
		@RequestMapping("/admin_board_write_ok")
		public String admin_board_write_ok(
				@ModelAttribute BoardVO b,
				@RequestParam("board_pwd") String board_pwd,
				@AuthenticationPrincipal StoreUserDetails storeUserDetails,
				//HttpServletRequest request,
				HttpServletResponse response)
						throws Exception{
			//@ModelAttribute BoardVO b라고 하면 네임피라미터 이름과 빈
			//클래스 변수명이 일치하면 b객체에 값이 저장되어 있다.
			
			//비밀번호 암호화
			String encodedPassword = passwordEncoder.encode(b.getBoard_pwd());
			b.setBoard_pwd(encodedPassword);
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			String encodedAdminPassword = storeUserDetails.getUser().getPassword();
			//게시글의 비밀번호가 관리자의 비밀번호와 일치하는지 확인
			if(!passwordEncoder.matches(board_pwd, encodedAdminPassword)) {
				out.println("<script>");
				out.println("alert('비밀 번호가 다릅니다!');");
				out.println("location='admin_board_list';");
				out.println("</script>");
			}else {
				this.adminBoardService.insertBoard(b);
				return "redirect:/admin_board_list";
			}
			return null;
		}//admin_board_write_ok()
		
		//내용보기+수정폼
		@RequestMapping("/admin_board_cont")
		public ModelAndView admin_board_cont(
				@RequestParam("no") int board_no,
				@RequestParam("state") String state,
				@AuthenticationPrincipal StoreUserDetails storeUserDetails,
				HttpServletResponse response,
				HttpServletRequest request)
						throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			UserVO u = storeUserDetails.getUser();

			if(u==null || !u.getUsername().equals("admin")) {
				out.println("<script>");
				out.println("alert('다시 로그인 하세요!');");
				out.println("location='login';");
				out.println("</script>");
			}else {
				int page=1;
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
					//get으로 전달된 쪽번호를 정수 숫자로 바꿔서 저장
				}
				BoardVO b=this.adminBoardService.getAdminBoardCont(board_no);
				//디비로 부터 레코드 내용을 가져옴.
				String board_cont=b.getBoard_cont().replace("\n","<br/>");
				//textarea태그영역에서 엔터키 친부분을 줄바꿈 처리<br/>

				ModelAndView cm=new ModelAndView();
				cm.addObject("b",b);
				cm.addObject("board_cont",board_cont);
				cm.addObject("page",page);

				if(state.equals("cont")) {//내용보기
					cm.setViewName("board/admin_board_cont");
				}else if(state.equals("edit")) {//수정폼
					cm.setViewName("board/admin_board_edit");
				}
				return cm;
			}//if else
			return null;
		}//admin_board_cont()
		
		//관리자 게시판 수정완료
		@RequestMapping("/admin_board_edit_ok")
		public String admin_board_edit_ok(
				@ModelAttribute BoardVO eb,
				@AuthenticationPrincipal StoreUserDetails storeuserDetails,
				HttpServletResponse response,
				HttpServletRequest request,
				HttpSession session,
				@RequestParam("page") int page) 
						throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			UserVO u = storeuserDetails.getUser();
			
			if(u==null || !u.getUsername().equals("admin")) {
				out.println("<script>");
				out.println("alert('다시 로그인 하세요!');");
				out.println("location='login';");
				out.println("</script>");
			}else {
				this.adminBoardService.editBoard(eb);
				return "redirect:/admin_board_list?page="+page;
			}
			return null;
		}//admin_board_edit_ok()
		
		//관리자 게시판 삭제
		@RequestMapping("/admin_board_del")
		public String admin_board_del(
				@RequestParam("no") int no,
				@RequestParam("page") int page,
				@AuthenticationPrincipal StoreUserDetails storeuserDetails,
				HttpServletResponse response,
				HttpServletRequest request)
						throws Exception{
			System.out.println("게시글 삭제 요청");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			UserVO u = storeuserDetails.getUser();
			
			if(u == null || !u.getUsername().equals("admin")) {
				out.println("<script>");
				out.println("alert('다시 관리자로 로그인 하세요!');");
				out.println("location='login';");
				out.println("</script>");
			}else {
				System.out.println("실제 삭제 서비스실행");
				this.adminBoardService.deleteBoard(no);//게시물 삭제
				return "redirect:/board_list?page="+page;
			}		  
			return null;
		}
} */
