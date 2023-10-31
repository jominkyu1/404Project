<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--페이징 즉 쪽나누기 추가 --%>
<div id="bList_paging" class="text-center">
  <%-- 검색전 페이징 --%>
  <c:if test="${(empty find_field) && (empty find_name)}">
    <c:if test="${page<=1}">
      &laquo;
    </c:if>
    <c:if test="${page>1}">
      <a href="board_list?page=${page-1}">&laquo;</a>
    </c:if>
    
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
      <c:if test="${a == page}">
        <%--현재 페이지가 선택되었다면--%>
        <${a}>
      </c:if>
      <c:if test="${a != page}">
        <%--현재 페이지가 선택되지 않았다면 --%>
        <a href="board_list?page=${a}">[${a}]</a>&nbsp;
      </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
      &raquo;
    </c:if>
    <c:if test="${page<maxpage}">
      <a href="board_list?page=${page+1}">&raquo;</a>
    </c:if>
  </c:if>
  
  <%-- 검색후 페이징 --%>
  <c:if test="${(!empty find_field) || (!empty find_name)}">
    <c:if test="${page<=1}">
      &laquo;
    </c:if>
    <c:if test="${page>1}">
      <a
          href="board_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">&laquo;</a>&nbsp;
    </c:if>
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
      <c:if test="${a == page}">
        <%--현재 페이지가 선택되었다면--%>
        <${a}>
      </c:if>
      <c:if test="${a != page}">
        <%--현재 페이지가 선택되지 않았
다면 --%>
        <a
            href="board_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
      </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
      &raquo;
    </c:if>
    <c:if test="${page<maxpage}">
      <a
          href="board_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">&raquo;</a>
    </c:if>
  </c:if>
</div>