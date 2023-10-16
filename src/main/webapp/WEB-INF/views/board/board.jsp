<%@ page contentType="text/html; charset=UTF-8"%>
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
    width:1000px; 
    margin: auto;
}

#body, td, th {
    border-collapse : collapse;
    border : 1px solid black;
};
</style>
<body>
	<!-- 네비게이션(nav) 로드 -->
	<jsp:include page="../include/nav.jsp" />
	<!-- 배너(header) 로드 -->
	<jsp:include page="../include/header.jsp" />
	<section>
		<h2 align="center">게시판</h2>
		<table id="body">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<!-- <c:forEach items="${boardlist}" var="item">
				<td>${item.title}</td>
				${item.cont}
			</c:forEach>
			 -->
			<tr>
				<td>1</td>
				<td>제목입니다</td>
				<td>홍길동</td>
				<td>날짜~~~</td>
				<td>조회수!</td>
			</tr>
			<tr>
				<td>2</td>
				<td>제목입니다2</td>
				<td>홍길동</td>
				<td>날짜~~~</td>
				<td>조회수!</td>
			</tr>
			<tr>
				<td>3</td>
				<td>제목입니다3</td>
				<td>홍길동</td>
				<td>날짜~~~</td>
				<td>조회수!</td>
			</tr>
			<tr>
				<td>4</td>
				<td>제목입니다4</td>
				<td>홍길동</td>
				<td>날짜~~~</td>
				<td>조회수!</td>
			</tr>
		</table>	
		
		<table id="body2">
		<tr align="center">
			<td colspan="2" width="399"><input type=button value="글쓰기">
				<input type=button value="답글"> <input type=button value="목록">
				<input type=button value="수정"> <input type=button value="삭제">
		</tr>
		</table>

	</section>
	<!-- 푸터 (footer.html) -->
	<jsp:include page="../include/footer.jsp" />
</body>

<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>
