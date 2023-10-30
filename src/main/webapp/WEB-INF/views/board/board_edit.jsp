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

table {
	width: 100%;
	margin-bottom: 20px;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
	margin: 4px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

#bWrite_t {
	width: 400px; /* 테이블의 너비를 조절해 필요한 경우에 맞게 조절하세요 */
	margin: 0 auto; /* 수평 가운데 정렬 */
}

#bWrite_t th, #bWrite_t td {
	text-align: center; /* 텍스트를 가운데 정렬 */
}

#bWrite_t input, #bWrite_t textarea {
	width: 100%; /* 부모 요소에 대해 100% 너비로 설정 */
	box-sizing: border-box; /* 폭과 높이에 padding과 border를 포함하여 크기를 정의함 */
	margin-bottom: 10px; /* 입력 요소 사이에 간격을 조절 */
}
</style>
<body>
	<!-- 네비게이션(nav) 로드 -->
	<jsp:include page="../include/nav.jsp" />
	<!-- 배너(header) 로드 -->
	<jsp:include page="../include/header.jsp" />
	<section>
		<div id="bWrite_wrap">
		<br>
			<h2 class="bWrite_title" style="text-align: center;">게시판 수정폼</h2>
			<br>
			<form method="post" action="board_edit_ok"
				onsubmit="return bw_check();">
				<input type="hidden" name="board_no" value="${b.board_no}" /> <input
					type="hidden" name="page" value="${page}" />


				<table id="bWrite_t" border="1" class="table-dark">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.user" var="user" />
						<tr>
							<th style="text-align: center; vertical-align: middle; color: black;">이름</th>
							<td><input name="board_name" id="board_name"
								style="width: 300px; font-size: 14; text-align: center; vertical-align: middle;"
								value="${user.username}" readonly /></td>
						</tr>
					</sec:authorize>
					<tr>
						<th style="text-align: center; vertical-align: middle; color: black;">제목</th>
						<td><input name="board_title" id="board_title"
							style="width: 300px; font-size: 14; text-align: center; vertical-align: middle;"
							value="${b.board_title}" /></td>
					</tr>
					<tr>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<!-- 비밀번호 Hidden <th>비밀번호</th> -->
					
						<td><input type="hidden" name="board_pwd" id="board_pwd" value="1234"
							style="width: 300px; font-size: 14; text-align: center; vertical-align: middle;" /></td>
					</sec:authorize>
					
					<sec:authorize access="hasRole('ROLE_USER')">
						<th style="text-align: center; vertical-align: middle; color: black;">비밀번호</th>
						<td><input type="password" name="board_pwd" id="board_pwd"
							style="width: 300px; font-size: 14; text-align: center; vertical-align: middle;" /></td>
					</sec:authorize>
					</tr>
					<tr>
						<th style="text-align: center; vertical-align: middle; color: black;">내용</th>
						<td><textarea name="board_cont" id="board_cont" rows="9"
								style="width: 300px; font-size: 14; text-align: center; vertical-align: middle;"
								cols="36">${b.board_cont}</textarea></td>
					</tr>
				</table>
				<br>

				<div id="bWrite_menu" style="text-align: center;">
					<input type="submit" value="수정" class="btn btn-outline-dark" /> <input
						type="reset" value="취소" class="btn btn-outline-dark"
						onclick="$('#board_name').focus();" /> <input type="button"
						value="목록" class="btn btn-outline-dark"
						onclick="location='board_list?page=${page}';" />
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
