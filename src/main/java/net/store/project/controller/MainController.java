package net.store.project.controller;

import net.store.project.api.PageableHandler;
import net.store.project.dao.BbsDAO;
import net.store.project.repository.ItemRepository;
import net.store.project.service.BbsService;
import net.store.project.service.BoardService;
import net.store.project.service.ItemService;
import net.store.project.vo.board.BoardVO;
import net.store.project.vo.item.ItemVO;
import net.store.project.vo.page.JpaPagingDto;
import net.store.project.vo.page.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;


@Controller
public class MainController {
	@Autowired
	private ItemRepository itemRepository;

	@Autowired
	private BoardService boardService;

	@Autowired
	private PageableHandler pageableHandler;

	@Autowired
	private BbsService bbsService;

	@GetMapping("/")
	public String index(Model model) {
		//stockQuantity가 적은순으로 4개만
		List<ItemVO> items = itemRepository.findAll().stream()
								.filter(item -> item.getStockQuantity() > 0)
								.collect(Collectors.toList())
								.subList(0, 4);
		//적은순정렬
		items.sort(Comparator.comparingInt(ItemVO::getStockQuantity));

		model.addAttribute("items", items);
		return "index";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}


	//상단바 검색창
	@GetMapping("/search")
	public ModelAndView Search(Model model, @RequestParam(value = "search", required = false) String search,
							   @PageableDefault(sort="regdate") Pageable pageable, HttpServletRequest request,
							   PageVO p
							   ) {
		List<ItemVO> searchItems = null;

		//ItemVO 검색 및 JPA 페이징
		if(search != null && !search.isEmpty()){//검색어 비어있지 않을때만 수행
			Page<ItemVO> items = itemRepository.findAllByNameContaining(search, pageable);
			JpaPagingDto paging = pageableHandler.makePages(pageable, items, 3);
			model.addAttribute("paging", paging);
			model.addAttribute("search", search);
			searchItems = items.getContent();
		}

		//게시판 이름으로 검색
		List<BoardVO> searchBoardList  = this.boardService.searchboard("%" + search + "%");

		ModelAndView searchM = new ModelAndView();
		searchM.addObject("itemlist", searchItems);
		searchM.addObject("boardlist", searchBoardList);

		searchM.setViewName("search");


		return searchM;

	}//search()

}