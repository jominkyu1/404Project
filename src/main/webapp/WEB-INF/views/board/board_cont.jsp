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

#bCont_t {
	width: 60%;
	margin: auto;
	border-collapse: collapse;
	text-align: left;
}

#bCont_t th, #bCont_t td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

#bCont_t th {
	background-color: #f2f2f2;
}
</style>
<body>
	<!-- 네비게이션(nav) 로드 -->
	<jsp:include page="../include/nav.jsp" />
	<!-- 배너(header) 로드 -->
	<jsp:include page="../include/header.jsp" />
	<section>
		<div id="bCont_wrap" style="text-align: center;">
			<h3 class="bCont_title" style="letter-spacing: 1px;">게시판 내용</h3>
			<br>

			<table id="bCont_t" class="table table-bordered"
				style="text-align: center; border-collapse: collapse; width: 50%; margin: auto;">
				<tr>
					<th width="80"
						style="letter-spacing: 1px; border: 1px solid black; vertical-align: middle; background-color: rgba(211, 211, 211, 0.38);">제목</th>
					<td width="250" style="border: 1px solid black;">${b.board_title}</td>
				</tr>
				<tr>
					<th width="80"
						style="letter-spacing: 1px; border: 1px solid black; vertical-align: middle; background-color: rgba(211, 211, 211, 0.38);">내용</th>
					<td width="250" style="border: 1px solid black;">${bcont}</td>
				</tr>
				<tr>
					<th width="80"
						style="letter-spacing: 1px; border: 1px solid black; vertical-align: middle; background-color: rgba(211, 211, 211, 0.38);">조회수</th>
					<td width="250" style="border: 1px solid black;">${b.board_hit}</td>
				</tr>
			</table>

			<br>

			<div style="text-align: center;">
				<div id="bCont_menu" class="btn-group" role="group"
					aria-label="Basic outlined example">
					<sec:authorize access="hasRole('ROLE_USER')">
						<input type="button" value="수정" class="btn btn-outline-dark"
							style="font-size: 14px; border-radius: 5px; margin-right: 5px;"
							onclick="location= 'board_cont?no=${b.board_no}&page=${page}&state=edit';" />
					</sec:authorize>
					<input type="button" value="목록" class="btn btn-outline-dark"
						style="font-size: 14px; border-radius: 5px; margin-left: 5px;"
						onclick="location='board_list?page=${page}';" />
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<input type="submit" value="답변" class="btn btn-outline-dark"
							style="font-size: 14px; border-radius: 5px; margin-left: 10px;"
							onclick="location = 'board_cont?no=${b.board_no}&page=${page}&state=reply';" />
					</sec:authorize>
				</div>
			</div>
		</div>


		<br>

	</section>
	<!-- 푸터 (footer.html) -->
	<jsp:include page="../include/footer.jsp" />
</body>

<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>
