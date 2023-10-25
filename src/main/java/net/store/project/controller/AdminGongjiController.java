package net.store.project.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import net.store.project.security.StoreUserDetails;
import net.store.project.service.AdminGongjiService;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;
import net.store.project.vo.user.UserVO;

@Controller
@RequiredArgsConstructor
public class AdminGongjiController {
	
	@Autowired
	private AdminGongjiService adminGongjiService;
	
	private final PasswordEncoder passwordEncoder;
	
	//관리자 공지목록
			@RequestMapping("/admin_gongji_list")
			public ModelAndView admin_gongji_list(@ModelAttribute PageVO p,HttpServletRequest request,
					@AuthenticationPrincipal StoreUserDetails storeUserDetails,HttpServletResponse response) throws Exception{
				response.setContentType("text/html;charset=UTF-8");

				//if(isAdminLogin(response, storeUserDetails)) {//관리자로 로그인 된 경우
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

					int listcount=this.adminGongjiService.getListCount(p);
					//전체 레코드 개수 또는 검색전후 레코드 개수
					//System.out.println("총 게시물수:"+listcount+"개");

					p.setStartrow((page-1)*7+1);//시작행번호
					p.setEndrow(p.getStartrow()+limit-1);//끝행번호

					List<BoardVO> glist=this.adminGongjiService.getGongjiList(p);
					//관리자 공지 검색 전후 목록

					//총페이지수
					int maxpage=(int)((double)listcount/limit+0.95);
					//현재 페이지에 보여질 시작페이지 수(1,11,21)
					int startpage=(((int)((double)page/10+0.9))-1)*10+1;
					//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
					int endpage=maxpage;
					if(endpage > startpage+10-1) endpage=startpage+10-1;

					ModelAndView listM=new ModelAndView("board/admin_gongji_list");

					listM.addObject("glist",glist);
					//glist 키이름에 값 저장
					listM.addObject("page",page);
					listM.addObject("startpage",startpage);
					listM.addObject("endpage",endpage);
					listM.addObject("maxpage",maxpage);
					listM.addObject("listcount",listcount);	
					listM.addObject("find_field",find_field);
					listM.addObject("find_name", find_name);

					return listM;
				//}
				//return null;
			}//admin_gongji_list()
			
			//관리자 공지 작성
			@RequestMapping("/admin_gongji_write")
			public ModelAndView admin_gongji_write(HttpServletResponse response,
					@AuthenticationPrincipal StoreUserDetails storeUserDetails,HttpServletRequest request) throws Exception{
				response.setContentType("text/html;charset=UTF-8");

				if(isAdminLogin(response, storeUserDetails)){
					int page=1;
					if(request.getParameter("page") != null) {
						page=Integer.parseInt(request.getParameter("page"));
					}

					ModelAndView wm=new ModelAndView();
					wm.addObject("page",page);//페이징 목록에서 책갈피 기능을 구현하기 위한것
					wm.setViewName("board/admin_gongji_write");
					return wm;
				}
				return null;
			}//admin_gongji_write()


			//관리자 공지 저장
			@RequestMapping("/admin_gongji_write_ok")
			public ModelAndView admin_gongji_write_ok(BoardVO b,@AuthenticationPrincipal StoreUserDetails storeUserDetails,
					HttpServletResponse response) throws Exception{
				/* 네임 피라미터 이름과 빈클래스 변수명이 같으면 GongjiVO g에서 g객체에 이름,공지제목,비번,공지내용까지 
				 * 저장되어 있다.
				 */
				response.setContentType("text/html;charset=UTF-8");
				
				//공지사항 비밀번호 암호화
				String encodedPassword = passwordEncoder.encode(b.getBoard_pwd());
				b.setBoard_pwd(encodedPassword);

				if(isAdminLogin(response, storeUserDetails)){
					this.adminGongjiService.insertGongji(b);//공지 저장

					return new ModelAndView("redirect:/admin_gongji_list");
				}
				return null;
			}//admin_gongji_write_ok()


			//관리자 공지 수정과 상세정보
			@RequestMapping("/admin_gongji_cont")
			public ModelAndView admin_gongji_cont(HttpServletRequest request,
					HttpServletResponse response,@AuthenticationPrincipal StoreUserDetails storeUserDetails,
					@RequestParam("no") int no,
					@RequestParam("state") String state)
							throws Exception{
				response.setContentType("text/html;charset=UTF-8");

				if(isAdminLogin(response, storeUserDetails)){
					int page=1;
					if(request.getParameter("page") != null) {
						page=Integer.parseInt(request.getParameter("page"));		
					}
					BoardVO b=this.adminGongjiService.getGongjiCont(no);
					String b_cont=b.getBoard_cont().replace("\n","<br/>");
					//textarea영역에서 엔터키 친 부분을 다음줄로 줄바꿈

					ModelAndView cm=new ModelAndView();
					cm.addObject("b",b);
					cm.addObject("b_cont",b_cont);
					cm.addObject("page",page);

					if(state.equals("cont")) {//내용보기
						cm.setViewName("board/admin_gongji_cont");
					}else if(state.equals("edit")) {//수정폼
						cm.setViewName("board/admin_gongji_edit");
					}
					return cm;
				}
				return null;
			}//admin_gongji_cont()


			//관리자 공지 수정완료
			@RequestMapping("/admin_gongji_edit_ok")
			public ModelAndView admin_gongji_edit_ok(BoardVO b,
					HttpServletRequest request,
					HttpServletResponse response,@AuthenticationPrincipal StoreUserDetails storeUserDetails)
							throws Exception{
				response.setContentType("text/html;charset=UTF-8");

				if(isAdminLogin(response, storeUserDetails)) {
					int page=1;
					if(request.getParameter("page") != null) {
						page=Integer.parseInt(request.getParameter("page"));
					}
					this.adminGongjiService.editGongji(b);//공지 수정
					return new ModelAndView("redirect:/admin_gongji_list?page="+page);
				}
				return null;
			}//admin_gongji_edit_ok()


			//관리자 공지 삭제
			@RequestMapping("/admin_gongji_del")
			public String admin_gongji_del(int no,
					HttpServletResponse response,@AuthenticationPrincipal StoreUserDetails storeUserDetails,HttpServletRequest request)
							throws Exception{
				response.setContentType("text/html;charset=UTF-8");		

				if(isAdminLogin(response, storeUserDetails)) {
					int page=1;
					if(request.getParameter("page") != null) {
						page=Integer.parseInt(request.getParameter("page"));		
					}
					this.adminGongjiService.delGongji(no);//공지 삭제

					return "redirect:/admin_gongji_list?page="+page;
				}
				return null;
			}//admin_gongji_del()
	
			//반복적인 관리자 로그인을 안하기 위한 코드 추가
			public static boolean isAdminLogin(HttpServletResponse response, 
					@AuthenticationPrincipal StoreUserDetails storeUserDetails) throws Exception{
				
				PrintWriter out = response.getWriter();
				UserVO u = storeUserDetails.getUser();
				
				if(u == null || !u.getUsername().equals("admin")) {//관리자 로그아웃 되었을 때
					out.println("<script>");
					out.println("alert('관리자로 로그인 하세요!');");
					out.println("location='admin_login';");
					out.println("</script>");
					
					return false;
				}
				return true;
			}//isAdminLogin()
}//AdminGongjiCotroller()