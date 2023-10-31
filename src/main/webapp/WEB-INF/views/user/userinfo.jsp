<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title></title>
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
</style>
<body>
	<jsp:include page="../include/nav.jsp" />
	<jsp:include page="../include/header.jsp" />
	<section class="py-5 mx-auto">
		<div class="text-center ">
			<h2>회원정보</h2>
		</div>
		<div class="container mt-2">
			<div class="row">
				<div class="col-12 col-md-4">
					<div class="text-center">
						<img src="https://placehold.it/200x200" class="rounded"
							style="max-width: 200px; max-height: 200px; margin: 0 auto;" alt="sample">
					</div>
				</div>

				<div class="col-12 col-md-8">
					<table class="table table-hover ">
						<tr>
							<th>아이디</th>
							<td>${user.username}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${user.userphone}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${user.email}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${user.address1}${user.address2}</td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td>${user.address_detail}</td>
						</tr>
						<tr>
							<th>가입날짜</th>
							<td><fmt:formatDate value="${user.regdate}"
									pattern="yyyy년 MM월 dd일 a hh시 mm분" /></td>
						</tr>
						<tr style="white-space: nowrap;">
							<th>정보수정날짜</th>
							<td><fmt:formatDate value="${user.moddate}"
									pattern="yyyy년 MM월 dd일 a hh시 mm분" /></td>
						</tr>
					</table>

					<!-- 하단요소 -->
					<div class="mt-2 w-100" style="white-space: nowrap;">
						<a href="" class="btn btn-outline-secondary" onclick="alert('준비중입니다.')">프로필사진 업로드</a> <a
							href="/user/${user.user_id}/edit"
							class="btn btn-outline-secondary">정보수정</a> <a href="/user/orders"
							class="btn btn-outline-secondary">주문정보</a>
						<button class="btn btn-dark" onclick="deleteMessage()">회원탈퇴</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../include/footer.jsp" />
</body>
<script>
	function deleteMessage() {
		if (confirm("정말로 탈퇴하시겠습니까? 개인정보는 즉시 삭제되며 복구될 수 없습니다.")) {
			location.href = "/user/${user.user_id}/delete";
		}
	}
</script>
<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>