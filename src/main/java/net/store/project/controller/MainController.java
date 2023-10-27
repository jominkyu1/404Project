package net.store.project.controller;

import net.store.project.service.BoardService;
import net.store.project.service.ItemService;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.item.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MainController {

	@Autowired
	private  ItemService itemService;

	@Autowired
	private BoardService boardService;



	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}


	//상단바 검색창
	@GetMapping("/search")
	public ModelAndView Search(@RequestParam("search") String search) {


		//상품명으로 검색
		List<ItemVO> searchItems = this.itemService.searchItems("%" + search + "%");
		//게시판 이름으로 검색
		List<BoardVO> searchBoardList  = this.boardService.searchboard("%" + search + "%");


		System.out.println("아이템 검색 목록 개수 :" + searchItems.size());
		System.out.println("보드게시판 검색 목록 개수 : " + searchBoardList.size());

		ModelAndView searchM = new ModelAndView();
		searchM.addObject("itemlist", searchItems);
		searchM.addObject("boardlist", searchBoardList);

		searchM.setViewName("search");
		return searchM;

	}//search()

	//상단바 검색창; board내용 목록보기
	@GetMapping("/borad_cont")
	public ModelAndView board_cont(int no, String state, BoardVO b){
		if(state.equals("cont")){//내용보기일때만 조회수 증가
			b = boardService.getBoardCont3(no);
		}else{//답변 수정 삭제폼=>조회수 증가 X
			b = boardService.getBoardCont(no);
		}

		String board_cont=b.getBoard_cont().replace("\n", "<br>");

		ModelAndView cm = new ModelAndView();
		cm.addObject("b", b);
		cm.addObject("board_cont", board_cont); //줄바꿈한 내용 저장

		if(state.equals("cont")){
			cm.setViewName("board_cont");
		}else if(state.equals("reply")){//답변폼일떄
			cm.setViewName("board_reply");
		}else if(state.equals("edit")){//수정폼일 떄
			cm.setViewName("board_edit");
		}else if(state.equals("del")){//삭제폼일 떄
			cm.setViewName("board_del");
		}
		return cm;
	}
}