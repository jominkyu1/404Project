package net.store.project.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import net.store.project.service.AdminBoardService;
import net.store.project.service.BbsService;
import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;
import net.store.project.vo.user.UserVO;

@Controller
public class BbsCotroller {
	
	@Autowired
	private BbsService bbsService;
	@Autowired
	private ImageHandler imageHandler;
	@Autowired
	private AdminBoardService adminBoardService;
	

	//자료실 글쓰기 폼
	@GetMapping("/bbs_write") // bbs_write라는 매핑주소 등록
	public ModelAndView bbs_write(HttpServletRequest request) {
		//페이징에서 내가 본 페이지 번호로 바로 이동하는 책갈피 기능
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
			//get으로 전달된 쪽번호가 있는 경우 정수 숫자로 변경해서 저장
		}

		ModelAndView wm=new ModelAndView();
		wm.addObject("page",page);//페이징 책갈피 기능때문에 page키이름에 쪽번호 저장
		wm.setViewName("board/bbs_write");//뷰리졸브(뷰페이지)경로는 /WEB-INF/views/board/bbs_write
		//_write.jsp
		return wm;
	}//bbs_write()

	//파일경로
	@PostMapping("/bbs_write_ok")
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
        return "redirect:/bbs_list";//자료실 목록보기 매핑주소로 이동
    }

	//페이징과 검색기능이 되는 자료실 목록
	@RequestMapping("/bbs_list")
	public ModelAndView bbs_list(HttpServletRequest request,PageVO p) {

		int page=1;
		int limit=10;//한페이지에 보여지는 목록개수를 10개로 함
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		/* 검색과 관련된 부분 */
		String find_name = request.getParameter("find_name");//검색어
		String find_field = request.getParameter("find_field");//검색필드
		p.setFind_name("%"+find_name+"%");//%는 SQL문에서 하나이상의 임의의 모르는 문자와 매핑 대응
		p.setFind_field(find_field);

		int totalCount = this.bbsService.getRowCount(p);
		//검색전 총 레코드 개수,검색후 레코드 개수

		p.setStartrow((page-1)*10+1);//시작행 번호
		p.setEndrow(p.getStartrow()+limit-1);//끝행번호

		List<BbsVO> blist=this.bbsService.getBbsList(p);//검색전 목록

		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,11,21 ..)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;

		ModelAndView listM=new ModelAndView("board/bbs_list");//생성자 인자값으로 뷰페이지 경로
		//설정
		listM.addObject("blist",blist);//blist키이름에 목록저장
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);//시작페이지
		listM.addObject("endpage",endpage);//마지막 페이지
		listM.addObject("maxpage",maxpage);//최대페이지
		listM.addObject("listcount",totalCount);//검색전후 레코드개수
		listM.addObject("find_field",find_field);//검색 필드
		listM.addObject("find_name", find_name);//검색어
		
		return listM;
	}//bbs_list()

		//반복적인 관리자 로그인을 안하기 위한 코드 추가
		public static boolean isAdminLogin(HttpServletResponse response, 
				@AuthenticationPrincipal StoreUserDetails storeUserDetails) throws Exception{
			
			PrintWriter out = response.getWriter();
			UserVO u = storeUserDetails.getUser();
			
			if(u == null || !u.getUsername().equals("admin")) {//관리자 로그아웃 되었을 때
				out.println("<script>");
				out.println("alert('관리자로 로그인 하세요!');");
				out.println("location='login';");
				out.println("</script>");
				
				return false;
			}
			return true;
		}//isAdminLogin()
		
		
		
}//BbsController class
