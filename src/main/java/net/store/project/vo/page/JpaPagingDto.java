package net.store.project.vo.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class JpaPagingDto {
    private int previous;
    private int next;

    private int currentPage;
    private int totalPage;

    private boolean hasPrevious;
    private boolean hasNext;

    //현재 페이지기준 좌우 표시할 페이지 갯수
    //ex) blockLimit의 값이3이면 현재 페이지가 7일때 [ 5 6 7 8 9 ]
    private int blockLimit;
    private int currentBlock;

    private boolean hasNextBlock;
    private boolean hasPreviousBlock;

    private int startPage;

    private int endPage;
}
