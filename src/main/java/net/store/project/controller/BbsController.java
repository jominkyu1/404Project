package net.store.project.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import net.store.project.api.ImageHandler;
import net.store.project.security.StoreUserDetails;
//import net.store.project.service.AdminBoardService;
import net.store.project.service.BbsService;
import net.store.project.service.BoardService;
import net.store.project.vo.bbs.BbsVO;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.page.PageVO;

@Controller
@RequiredArgsConstructor
public class BbsController {
	
	@Autowired
	private BbsService bbsService;
	@Autowired
	private ImageHandler imageHandler;
	@Autowired
	private BoardService boardService;
	
	private final PasswordEncoder passwordEncoder;
	
	
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
    public String insertBoardWithFiles(BoardVO b, List<MultipartFile> bbs_file,
    		@RequestParam("board_pwd") String board_pwd,
    		HttpServletResponse response,
    		@AuthenticationPrincipal StoreUserDetails storeUserDetails) throws Exception {
		List<BbsVO> bbsList = new ArrayList<>();

		//게시판 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(b.getBoard_pwd());
		b.setBoard_pwd(encodedPassword);
		
		b.setBoard_category("bbs");
		
		String encodedAdminPassword = storeUserDetails.getUser().getPassword();
		//게시글의 비밀번호가 유저의 비밀번호와 일치하는지 확인
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		
		if(!passwordEncoder.matches(board_pwd, encodedAdminPassword)) {
			out.println("<script>");
			out.println("alert('비밀 번호가 다릅니다!');");
			out.println("location='bbs_list';");
			out.println("</script>");
		}else {
		// 파일저장로직	
		for(MultipartFile multipartFile : bbs_file) {
			String dbFilePath = imageHandler.upload(multipartFile);
			
			BbsVO bbs = new BbsVO();
			bbs.setBbs_filepath(dbFilePath);
			bbs.setBbs_originalFilename(multipartFile.getOriginalFilename());
			
			bbsList.add(bbs);
			this.boardService.insertBoardWithFiles(b, bbsList);
			// filePath를 사용하여 파일 경로에 대한 작업 수행
			return "redirect:/bbs_list";//자료실 목록보기 매핑주소로 이동
			}
		}
		return null;

    }//bbs_write_ok

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

		List<BoardVO> blist=this.bbsService.getBoardList(p);//검색전 목록
				
		
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
	
	//자료실 내용보기
		@GetMapping("/bbs_cont") //get방식으로 접근하는 매핑주소를 처리
		public ModelAndView board_cont(int board_no,int page,String state,BoardVO b) {
			
			List<BbsVO> files = bbsService.getFiles(board_no);
			if(state.equals("cont")) {//내용보기일때만 조회수 증가
				b=this.boardService.getBoardCont(board_no);
				this.bbsService.updateHit(board_no);
				//답변폼,수정폼,삭제폼일때는 조회수 증가 안한다.
			}else {
				b=this.boardService.getBoardCont2(board_no);
				
			}
			
			String board_cont=b.getBoard_cont().replace("\n","<br>");//textarea 입력박스에서 엔터
			//키를 친 부분 \n을 <br>태그로 변경해서 웹상에서 내용을 볼 때 줄바꿈해서 본다.
			
			ModelAndView cm=new ModelAndView();
			cm.addObject("page",page);//페이징에서 책갈피 기능때문에 쪽번호를 저장
			cm.addObject("b",b);
			cm.addObject("board_cont",board_cont);
			cm.addObject("files", files);
			
			if(state.equals("cont")) {
				cm.setViewName("board/bbs_cont");//뷰페이지 경로가 /WEB-INF/views/board/bbs_cont.
				//jsp
			}else if(state.equals("reply")) {//답변폼일 때
				cm.setViewName("board/bbs_reply");
			}else if(state.equals("edit")) {//수정폼일 때
				cm.setViewName("board/bbs_edit");
			}
			
			return cm;
		}//bbs_cont()
		

		//수정완료
		@RequestMapping("/bbs_edit_ok")
		public String bbs_edit_ok(BoardVO b, BbsVO bbs,
				@RequestParam("board_pwd") String board_pwd,
				HttpServletRequest request,
				HttpServletResponse response,@AuthenticationPrincipal StoreUserDetails storeUserDetails)
					throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
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
				this.bbsService.editBbs(b);//자료실 수정
				this.bbsService.editBbs2(bbs);//자료실 파일 관련 수정
				return "redirect:/bbs_list?page="+page;
			}
			return null;
		}//bbs_edit_ok()

		
		//자료실 삭제
		@RequestMapping("/bbs_del_ok") //get OR POST로 전달되는 매핑주소를 처리
		public ModelAndView bbs_del_ok(int board_no,int page,BoardVO b,BbsVO bbs,
		HttpServletResponse response,HttpServletRequest request)
		throws Exception{
	    /* @RequestParam("del_pwd") 스프링의 애노테이션의 의미는 
	     * 	request.getParameter("del_pwd")와 같은 기능이다.	
	     */
			response.setContentType("text/html;charset=UTF-8");

			if(request.getParameter("page") != null) {
				 page=Integer.parseInt(request.getParameter("page"));
				 this.bbsService.delBbs(board_no);//자료실 삭제 
			}
			
				ModelAndView dm=new ModelAndView();
				dm.setViewName("redirect:/bbs_list?page="+page);
				return dm;
			
		}//bbd_del_ok()
	
}//BbsController class
