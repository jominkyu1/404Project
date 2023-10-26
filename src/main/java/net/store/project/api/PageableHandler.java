package net.store.project.api;

import net.store.project.vo.page.JpaPagingDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

@Component
public class PageableHandler {

    public JpaPagingDto makePages(Pageable pageable, Page<?> items, int blockLimit){
        int totalPage = items.getTotalPages();

        int currentPage = pageable.getPageNumber();
        int currentBlock = (int) Math.ceil((currentPage + 1) / (double) blockLimit);

        int startPage = (currentBlock - 1) * blockLimit;
        int endPage = Math.min(startPage + blockLimit -1, totalPage - 1);

        JpaPagingDto jpaPagingDto = new JpaPagingDto();

        //전체페이지
        jpaPagingDto.setTotalPage(totalPage);
        
        //현재페이지기준 좌우 표시할 페이지 갯수
        jpaPagingDto.setBlockLimit(blockLimit);
        jpaPagingDto.setHasPreviousBlock(currentBlock > 1);
        jpaPagingDto.setHasNextBlock(totalPage-1 > endPage);

        //현재 페이지정보
        jpaPagingDto.setCurrentPage(currentPage);
        jpaPagingDto.setCurrentBlock(currentBlock);
        
        //이전페이지
        jpaPagingDto.setPrevious(pageable.previousOrFirst().getPageNumber());
        jpaPagingDto.setHasPrevious(items.hasPrevious());

        //다음페이지
        jpaPagingDto.setNext(pageable.next().getPageNumber());
        jpaPagingDto.setHasNext(items.hasNext());

        //시작페이지
        jpaPagingDto.setStartPage(startPage);
        //마지막페이지
        jpaPagingDto.setEndPage(endPage);
        return jpaPagingDto;
    }
}
