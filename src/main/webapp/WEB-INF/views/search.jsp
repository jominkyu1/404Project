<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>404 Store</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
            rel="stylesheet"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<style>
    .carousel-inner {
        width: 80%;
        height: 35vh;
    }
    .carousel-item,
    .carousel-item img {
        width: 100%;
        height: 100%;
    }
</style>
<body>
<!-- 네비게이션(nav.html) 로드 -->
<jsp:include page="include/nav.jsp" />
<!-- 배너(header.html) 로드 -->
<jsp:include page="include/header.jsp" />
<!-- 매인 섹션 -->
<section class="py-5">
    <div class="text-center">
        <h2 class="mb-3">검색 결과</h2>

    <!-- 아이템 검색 결과 -->
    </div>
    <div class="container px-4 px-lg-5 mt-5">
        <div
                class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"
        >
            <c:forEach items="${itemlist}" var="itemlist">
                <div class="col mb-5">
                    <div class="card h-100">

                        <!-- Product image-->
                        <img
                                class="card-img-top"
                                src="/itemimages/${itemlist.image_path}"
                                alt="${itemlist.name}"
                                style="height: 60%; width: auto;"
                        />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">
                                    <a href="/item/${itemlist.item_id}" class="text-decoration-none">
                                            ${itemlist.name}
                                    </a>
                                </h5>
                                <!-- Product price-->
                                <span class="fw-bolder">
                      <!-- 1,000,000원같이 쉼표를 넣어 표기함-->
                      <fmt:formatNumber type="number" maxFractionDigits="3" value="${itemlist.price}"/>원
                    </span>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto mb-1" href="#"
                                >장바구니</a
                                >
                            </div>
                            <div class="text-center">
                                <a class="btn btn-primary mt-auto" href="#">구매하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="d-flex justify-content-center">
    <jsp:include page="paging/paging.jsp">
        <jsp:param name="paging" value="${paging}"/>
    </jsp:include>
    </div>
    <!--게시판 목록 검색 -->
    <table id="bList_t" border="1"
           style="position: relative; top: 28px; left: 48px; opacity: 0.8; margin: 0 auto;"
           class="table table-hover">
        <tr>
            <th width="6%" height="26" style="text-align: center;">번호</th>
            <th width="34%">제목</th>
            <th width="14%" style="text-align: center;">작성자</th>
            <th width="18%" style="text-align: center;">작성일</th>
            <th width="10%" style="text-align: center;">조회수</th>
            <th width="18%" style="text-align: center;">수정/삭제</th>
        </tr>
        <c:if test="${!empty boardlist}">
            <c:forEach var="b" items="${boardlist}">
                <tr>
                    <td align="center"><c:if test="${b.board_step == 0}">
                        <%-- 원본글일때만 그룹번호가 출력 --%>
                        ${b.board_ref}
                    </c:if></td>
                    <td><c:if test="${b.board_step != 0}">
                        <%--답변글일때만 실행--%>
                        <c:forEach begin="1" end="${b.board_step}" step="1">
                            &nbsp;<%--답변글 들여쓰기 --%>
                        </c:forEach>
                        <img src="./images/AnswerLine.gif" />
                        <%--답변글 이미지 출력부분 --%>
                    </c:if> <a href="board_cont?no=${b.board_no}&state=cont">
                            ${b.board_title}</a> <%-- board_cont?no=번호&page=쪽번호&state=cont 3개의 인자값이
get방식으로 &구분하면서 전달된다. --%></td>
                    <td align="center">${b.board_name}</td>
                    <td align="center">${fn:substring(b.board_date,0,10)}</td>
                    <td align="center">${b.board_hit}</td>
                    <!-- 관리자 로그인일때 수정/삭제 뜨게하기 -->
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <sec:authentication property="principal.user" var="user" />
                        <td align="center"><input type="button" value="수정"
                                                  onclick="location=
                                                          'admin_board_cont?no=${b.board_no}&page=${page}&state=edit';" />
                            <input type="button" value="삭제"
                                   onclick="if(confirm('정말로 삭제할까요?') == true){
                                           location='admin_board_del?no=${b.board_no}&page=${page}';}else{ return ;}" />
                        </td>
                    </sec:authorize>


                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty boardlist}">
            <tr>
                <th colspan="5">목록이 없습니다!</th>
            </tr>
        </c:if>
    </table>
</section>
<!-- 푸터 (footer.html) -->
<jsp:include page="include/footer.jsp" />
<!-- include.js 자바스크립트 -->
<script src="/include/include.js"></script>
<script>
    includeHTML();
</script>
</body>

<!-- Bootstrap core JS-->
<script src="js/bootstrap.bundle.js"></script>
</html>
