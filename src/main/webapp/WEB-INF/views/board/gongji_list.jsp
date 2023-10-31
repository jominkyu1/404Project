<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!-- 더미이미지(데모이미지) 사용시
    <img src="https://placehold.it/가로x세로">
    로 적용 후 확인해보면 자동으로 그 사이즈에 맞게 불러옴
-->
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>404 Store</title>
<!--부트스트랩 아이콘 CSS
            https://icons.getbootstrap.com/ 이곳에서 아이콘 확인! 클래스명에 아이콘 적으면됨!
        -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet" />

</head>
<style>
.carousel-inner {
	width: 80%;
	height: 35vh;
}

.carousel-item, .carousel-item img {
	width: 100%;
	height: 100%;
}

.grid {
	display: grid;
	grid-template-columns: repeat(5, minmax(0px, 1fr));
}

.bg-gray-3 { -
	-tw-bg-opacity: 1;
	background-color: rgb(223, 223, 223/ var( - -tw-bg-opacity));
}

.bg-white { -
	-tw-bg-opacity: 1;
	background-color: rgb(223, 223, 223/ var( - -tw-bg-opacity));
}

.grid-cols-2 {
	grid-template-columns: repeat(2, minmax(0, 1fr));
}

.gap-\[1px\] {
	gap: 1px;
}

.px-\[1\.2rem\] {
	padding-left: 1.2rem;
	padding-right: 1.2rem;
}

#id1 li a, #id2 li a, #id3 li a, #id4 li a {
	color: black;
}

#id1 li a:link, #id2 li a:link, #id3 li a:link, #id4 li a:link {
	color: black;
	text-decoration: none;
}

/* 방문한 후 링크 색상 (회색) */
/*#id1 li a:visited, #id2 li a:visited, #id3 li a:visited, #id4 li a:visited {
        color: gainsboro; 
        text-decoration: none;
        }*/
#id1 li a:hover, #id2 li a:hover, #id3 li a:hover, #id4 li a:hover {
	text-decoration: underline;
	color: rgb(127, 129, 255);
}

#id1 li a:active, #id2 li a:active, #id3 li a:active, #id4 li a:active {
	color: wheat;
}

#body, #body2 {
	width: 1000px;
	margin: auto;
}

#body, td, th {
	border-collapse: collapse;
	border: 1px solid black;
}

</style>
<body>
	<!-- 네비게이션(nav) 로드 -->
	<jsp:include page="../include/nav.jsp" />
	<!-- 배너(header) 로드 -->
	<jsp:include page="../include/header.jsp" />
	<section>
	<br>
		<%-- 메인 본문 --%>
		<div id="aMain_cont">
			<form method="get" action="gongji_list">
				<div id="bList_wrap">
					<h3 align="center">공지사항</h3>
					
					<%-- 상단 탭 --%>
					<jsp:include page="board_include/board_tab.jsp" />
					
					<br>
					<div class="bList_count"
						style="margin-left: 20px; font-size: 20px;">글개수:
						${listcount} 개</div>
					<table id="bList_t" border=1
					class="table table-hover">
						<tr>
							<th width="6%" height="26" style="text-align: center;">번호</th>
							<th width="34%">제목</th>
							<th width="14%" style="text-align: center;">작성자</th>
							<th width="18%" style="text-align: center;">작성일</th>
							<th width="10%" style="text-align: center;">조회수</th>
							<sec:authorize access="hasRole('ROLE_ADMIN') ">
								<th width="18%" style="text-align: center;">수정/삭제</th>
							</sec:authorize>
						</tr>
						<c:if test="${!empty glist}">
							<c:forEach var="b" items="${glist}">
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
										</c:if> <a
										href="gongji_cont?no=${b.board_no}&page=${page}&state=cont">
											${b.board_title}</a></td>
									<td align="center">${b.board_name}</td>
									<td align="center">${fn:substring(b.board_date,0,10)}</td>
									<td align="center">${b.board_hit}</td>
									<!-- 관리자 로그인일때 수정/삭제 뜨게하기 -->
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<sec:authentication property="principal.user" var="user" />
										<td align="center"><input type="button" value="수정"
											onclick="location= 'gongji_cont?no=${b.board_no}&page=${page}&state=edit';" />
											<input type="button" value="삭제"
											onclick="if(confirm('정말로 삭제할까요?') == true){
								location='gongji_del?no=${b.board_no}&page=${page}&state=del';}else{ return ;}" />
										</td>
									</sec:authorize>


								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty glist}">
							<tr>
								<th colspan="5">목록이 없습니다!</th>
							</tr>
						</c:if>
					</table>

					<%--검색 폼추가 --%>
					<div id="bFind_wrap" style="text-align: center; margin: 0 auto;">
						<select name="find_field">
							<option value="board_title"
								<c:if test="${find_field=='board_title'}">${'selected'}</c:if>>제목</option>
							<option value="gongji_cont"
								<c:if test="${find_field=='board_cont'}">${'selected'}</c:if>>내용</option>
						</select> <input name="find_name" id="find_name" size="14"
							placeholder="Search" value="${find_name}"
							onfocus="if(this.placeholder == 'Search') this.placeholder = '';"
							onblur="if(this.placeholder == '') this.placeholder = 'Search';" />
						<input type="submit" value="검색" />
					</div>


					<br>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div id="bList_menu">
						<a href="gongji_write?page=${page}"
							 onclick="location.href='gongji_write?page=${page}';"
							 style="position: absolute; right: 30px; font-size: 12px;"
							 class="btn btn-outline-dark btn-lg">글쓰기 <c:if
								test="${(!empty find_field) && (!empty find_name)}">
						</c:if>
						</a>
					</div>
					</sec:authorize>
					
					<%-- 페이징 --%>
					<jsp:include page="board_include/board_paging.jsp" />
					
				</div>
			</form>
		</div>
	</section>
	<!-- 푸터 (footer.html) -->
	<jsp:include page="../include/footer.jsp" />
</body>

<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>
