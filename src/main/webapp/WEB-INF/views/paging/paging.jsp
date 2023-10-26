<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/css/bootstrap.min.css" rel="stylesheet" />

<%-- 페이징 처리시 JpaPagingDto 객체가 name=paging으로 넘어와야 함! --%>

<!-- 페이징 처리 -->
<div class="mx-auto mb-1">
  
  <ul class="pagination pagination-sm">
    <li class="page-item <c:if test="${paging.hasPrevious == false }"> disabled</c:if>">
     <a href="?page=${paging.previous}" class="page-link">
       [이전]
     </a>
    </li>
    
  <!-- 처음페이지 -->
   <li class="page-item <c:if test="${paging.hasPrevious == false }"> disabled</c:if>">
     <a href="?page=0" class="page-link">
       <<
     </a>
   </li>
  
  <!-- 이전 블록 -->
   <li class="page-item <c:if test="${paging.hasPreviousBlock == false }"> disabled</c:if>">
    <a href="?page=${paging.startPage - 1}" class="page-link">
      <
    </a>
   </li>
   
  <!-- 중앙 페이지처리 -->
    <c:if test="${paging.endPage >= 0}"> <!-- 값이 있을경우만 페이징 -->
      <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
        <li class="page-item <c:if test="${num == paging.currentPage}"> active</c:if>">
        <a href="?page=${num}" class="page-link"
        >${num + 1}</a>
        </li>
      </c:forEach>
    </c:if>
  
  <!-- 다음 블록 -->
   <li class="page-item <c:if test="${paging.hasNextBlock == false }"> disabled</c:if>">
    <a href="?page=${paging.endPage + 1}" class="page-link">
      >
    </a>
   </li>
  
  <!-- 마지막페이지 -->
   <li class="page-item <c:if test="${paging.hasNext == false}"> disabled</c:if>">
    <a href="?page=${paging.totalPage - 1}" class="page-link">
      >>
    </a>
   </li>
    
   <li class="page-item <c:if test="${paging.hasNext == false}"> disabled</c:if>">
    <a href="?page=${paging.next}" class="page-link">
      [다음]
    </a>
   </li>
  </ul>
</div>
<!-- 페이징 처리 -->