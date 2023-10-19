package net.store.project.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.store.project.api.ImageHandler;
import net.store.project.security.StoreUserDetails;
import net.store.project.service.AdminBbsService;
import net.store.project.service.AdminBoardService;
import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;
import net.store.project.vo.user.UserVO;

@Controller
public class AdminBbsCotroller {
	
	@Autowired
	private AdminBbsService adminBbsService;
	@Autowired
	private AdminBoardService adminBoardService;
	@Autowired
	private ImageHandler imageHandler;
	
	//관리자 자료실 목록
		@RequestMapping("/admin_bbs_list")
		public ModelAndView admin_bbs_list(BbsVO b,HttpServletResponse response,
				@AuthenticationPrincipal StoreUserDetails storeUserDetails,
				HttpServletRequest request, HttpSession session,PageVO p)
		throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			UserVO u = storeUserDetails.getUser();
			
			if(u == null || !u.getUsername().equals("admin")) {
				out.println("<script>");
				out.println("alert('관리자로 로그인 하세요!');");
				out.println("location='admin_login';");
				out.println("</script>");
			}else {
				int page=1;//쪽번호
				int limit=7;//한페이지에 보여지는 목록개수
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));         
				}
				String find_name=request.getParameter("find_name");//검색어
				String find_field=request.getParameter("find_field");//검색 필드
				p.setFind_field(find_field);
				p.setFind_name("%"+find_name+"%");
				//%는 sql문에서 검색 와일드 카드 문자로서 하나이상의 임의의 모르는 문자와 매핑 대응, 
				//하나의 모르는 문자와 매핑 대응하는 와일드 카드문자는 _

				int listcount=this.adminBbsService.getListCount(p);
				//검색전 전체 레코드 개수 또는 검색후 레코드 개수
				//System.out.println("총 게시물수:"+listcount+"개");

				p.setStartrow((page-1)*7+1);//시작행번호
				p.setEndrow(p.getStartrow()+limit-1);//끝행번호

				List<BbsVO> blist=this.adminBbsService.getadminBbsList(p);//검색 전후 목록

				//총페이지수
				int maxpage=(int)((double)listcount/limit+0.95);
				//현재 페이지에 보여질 시작페이지 수(1,11,21)
				int startpage=(((int)((double)page/10+0.9))-1)*10+1;
				//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
				int endpage=maxpage;
				if(endpage > startpage+10-1) endpage=startpage+10-1;

				ModelAndView listM=new ModelAndView();
				
				listM.addObject("blist",blist);//blist 키이름에 값 저장
				listM.addObject("page",page);
				listM.addObject("startpage",startpage);
				listM.addObject("endpage",endpage);
				listM.addObject("maxpage",maxpage);
				listM.addObject("listcount",listcount);   
				listM.addObject("find_field",find_field);
				listM.addObject("find_name", find_name);

				listM.setViewName("board/admin_bbs_list");//뷰페이지 경로
				return listM;
			}
			return null;
		}//admin_bbs_list()
		
		//관리자 자료실 글쓰기
		@GetMapping("/admin_bbs_write")
		public ModelAndView admin_bbs_write(HttpServletResponse response,
				@AuthenticationPrincipal StoreUserDetails storeUserDetails,
				HttpServletRequest request) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			
			if(isAdminLogin(response, storeUserDetails)) {
				int page=1;
				
				if(request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				
				ModelAndView wm = new ModelAndView("admin/admin_bbs_write");//생성자 인자값으
				//로 뷰페이지 경로가 들어감.
				wm.addObject("page",page);//페이징에서 책갈피 기능때문에 page에 쪽번호 저장
				return wm;
			}
			return null;
		}//admin_bbs_write()

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
		
		//파일경로
		@PostMapping("/ss")
	    public String insertBoardWithFiles(BoardVO b, List<MultipartFile> multipartFiles) {
			List<BbsVO> bbsList = new ArrayList<>();
			// 파일저장로직	
			for(MultipartFile multipartFile : multipartFiles ) {
				String dbFilePath = imageHandler.upload(multipartFile);
				
				BbsVO bbs = new BbsVO();
				bbs.setBbs_filepath(dbFilePath);
				bbs.setBbs_originalFilename(multipartFile.getOriginalFilename());
				bbs.setBoard_no(b.getBoard_no());
				
				bbsList.add(bbs);
			}

	        this.adminBoardService.insertBoardWithFiles(b, bbsList);
	        // filePath를 사용하여 파일 경로에 대한 작업 수행
	        return "글을 작성 후 이동해야할 뷰페이지 경로";
	    }
}//AdminBbsController class
