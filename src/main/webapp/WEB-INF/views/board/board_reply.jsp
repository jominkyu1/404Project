<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
;
</style>
<body>
	<!-- 네비게이션(nav) 로드 -->
	<jsp:include page="../include/nav.jsp" />
	<!-- 배너(header) 로드 -->
	<jsp:include page="../include/header.jsp" />
	<section>
		<div id="bWrite_wrap">
			<h2 class="bWrite_title">게시판 답변</h2>
			<form method="post" action="board_reply_ok"
				onsubmit="return bw_check();">
				<%--답변글 히든값 --%>
				<input type="hidden" name="board_ref" value="${b.board_ref}" />
				<%--원본글과 답변글을 묶어주는 그룹
  번호값 --%>
				<input type="hidden" name="board_step" value="${b.board_step}" />
				<%-- 원본글이면 0,첫번째 답변글이면
  1,즉 원본글과 답변글을 구분하는 번호값이면서 몇번째 답변글인가
  를 알려줌. --%>
				<input type="hidden" name="board_level" value="${b.board_level}" />
				<%--답변글 정렬순서 --%>
				<%-- 페이징 히든값 --%>
				<input type="hidden" name="page" value="${page}" />

				<sec:authorize access="isAnonymous()">
					<script>
						alert("관리자 권한입니다!")
						location.href = "/board_list";
					</script>
				</sec:authorize>

				<table id="bWrite_t">
					<tr>
						<th>이름</th>
						<td><input name="board_name" id="board_name" size="14" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input name="board_title" id="board_title" size="35"
							value="Re:${b.board_title}" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="board_pwd" id="board_pwd"
							size="14" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="board_cont" id="board_cont" rows="9"
								cols="36"></textarea></td>
					</tr>
				</table>
				<div id="bWrite_menu">
					<input type="submit" value="답변" /> <input type="reset" value="취소"
						onclick="$('#board_name').focus();" /> <input type="button"
						value="목록" onclick="location='board_list?page=${page}';" />
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
