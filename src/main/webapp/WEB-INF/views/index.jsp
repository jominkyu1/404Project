<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- 더미이미지(데모이미지) 사용시
    <img src="https://placehold.it/가로x세로">
    로 적용 후 확인해보면 자동으로 그 사이즈에 맞게 불러옴
-->
<html>
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
<link href="/css/bootstrap.min.css" rel="stylesheet" />
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

h4 {
	text-align: left;
}
</style>
<body>
	<!-- 네비게이션(nav.jsp) 로드 -->
	<jsp:include page="include/nav.jsp" />
	<!-- 배너(header.jsp) 로드 -->
	<jsp:include page="include/header.jsp" />
	<!-- 매인 섹션 -->
	<section class="py-5">

		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.user" var="user" />

			<c:if test="${!empty user.providerId and empty user.address1}">
				<script>
					alert('사이트 이용에 필요한 정보를 입력해주세요!');
					location.href = '/user/${user.user_id}/edit';
				</script>
			</c:if>
		</sec:authorize>
		<div class="container mt-5">
			<h4 style="text-align: left; color: #dc3545">재고가 얼마 남지 않았습니다! 📌</h4>
			<p>404스토어에서 엄선한 최고의 제품들</p>
			<br>
			
			<div class="row">
				<c:forEach items="${items}" var="item">
				<div class="col-md-6 col-lg-3 mb-3">
					<div class="card" style="width: 100%;">
						<img src="/itemimages/${item.image_path}" class="card-img-top" alt="${item.name}"
						style="height: 200px; width: auto;">
						<div class="card-body">
							<h5 class="card-title">${item.name}</h5>
							<p class="card-text">남은 수량: ${item.stockQuantity}개</p>
							<a href="/item/${item.item_id}" class="btn btn-outline-danger ">제품
								확인하러가기!</a>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>

		<div class="container mt-5">

			<h4 style="text-align: left;">인기 구매가이드📖</h4>

			<div class="container mt-5">
				<div class="row justify-content-center">
					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card text-center" style="width: 100%; height: 100%;">
							<div class="card-body" style="overflow: hidden;">
								<img src="/images/guide/bluetooth_earphones.jpg"
									class="card-img-top mx-auto" alt="블루투스 이어폰"
									style="width: 150px; height: 150px; display: block;">
								<h5 class="card-title">블루투스 이어폰</h5>
								<p class="card-text" style="white-space: nowrap;">나한테 맞는
									무선 이어폰!</p>
								<a href="http://localhost:8082/guide/item"
									class="btn btn-outline-primary" style="white-space: nowrap;">구매가이드
									보러가기!</a>
							</div>
						</div>
					</div>


					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card text-center" style="width: 100%; height: 100%;">
							<div class="card-body">
								<img src="http://placehold.it/150x150"
									class="card-img-top mx-auto" alt="더미 이미지"
									style="width: 150px; height: 150px; display: block;">
								<h5 class="card-title">더미 이미지</h5>
								<p class="card-text">추후 업데이트 예정.</p>
								<a href="#" class="btn btn-outline-primary"
									style="white-space: nowrap;">구매가이드 보러가기!</a>
							</div>
						</div>
					</div>


					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card text-center" style="width: 100%; height: 100%;">
							<div class="card-body">
								<img src="http://placehold.it/150x150"
									class="card-img-top mx-auto" alt="더미 이미지"
									style="width: 150px; height: 150px; display: block;">
								<h5 class="card-title">더미 이미지</h5>
								<p class="card-text">추후 업데이트 예정.</p>
								<a href="#" class="btn btn-outline-primary"
									style="white-space: nowrap;">구매가이드 보러가기!</a>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card text-center" style="width: 100%; height: 100%;">
							<div class="card-body">
								<img src="http://placehold.it/150x150"
									class="card-img-top mx-auto" alt="더미 이미지"
									style="width: 150px; height: 150px; display: block;">
								<h5 class="card-title">더미 이미지</h5>
								<p class="card-text">추후 업데이트 예정.</p>
								<a href="#" class="btn btn-outline-primary"
									style="white-space: nowrap;">구매가이드 보러가기!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="container mt-5">
			<!-- 제목과 링크 -->
			<h4 style="text-align: left;">
				생생한 성능테스트 <i class="bi bi-caret-right-square-fill"></i>
			</h4>



			<!-- 상단 이미지와 링크 -->
			<div class="container mt-5">
				<div class="row justify-content-center">
					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card" style="width: 100%;">
							<img src="images/index/baby_bottle1.png" class="card-img-top"
								alt="이미지">
							<div class="card-body">
								<h5 class="card-title">젖병</h5>
								<p class="card-text">젖병/젖꼭지 고민 중이라면 꼭 봐야하는 영상!</p>
								<a
									href="https://www.youtube.com/watch?v=GtGNB0f324Y&feature=youtu.be"
									class="btn btn-primary">영상 보러가기!</a>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card" style="width: 100%;">
							<img src="images/index/LG.png" class="card-img-top" alt="이미지">
							<div class="card-body">
								<h5 class="card-title">LG 냉장고</h5>
								<p class="card-text">LG 냉장고 사실 분들은 꼭 봐야하는 영상!</p>
								<a
									href="https://www.youtube.com/watch?v=v8wrONAgD_Q&feature=youtu.be"
									class="btn btn-primary">영상 보러가기!</a>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card" style="width: 100%;">
							<img src="images/index/fir.png" class="card-img-top" alt="이미지">
							<div class="card-body">
								<h5 class="card-title">비스포크 냉장고</h5>
								<p class="card-text">비스포크 냉장고 사려면 두번 봐야 하는 영상!</p>
								<a
									href="https://www.youtube.com/watch?v=ZDymMcgG5nA&feature=youtu.be"
									class="btn btn-primary">영상 보러가기!</a>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card" style="width: 100%;">
							<img src="images/index/beam_projector.png" class="card-img-top"
								alt="이미지">
							<div class="card-body">
								<h5 class="card-title">빔프로젝트</h5>
								<p class="card-text">100인치를 만드는데 9.8cm면 충분한 빔프로젝터 영상!</p>
								<a
									href="https://www.youtube.com/watch?v=zloTy4rSBKM&feature=youtu.be"
									class="btn btn-primary">영상 보러가기!</a>
							</div>
						</div>
					</div>
				</div>
			</div>




			<!-- 하단 이미지와 링크 -->
			<div class="container mt-5">
				<div class="row">
					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card" style="width: 100%;">
							<img src="images/index/Epson.png" class="card-img-top" alt="이미지">
							<div class="card-body">
								<h5 class="card-title">앱손</h5>
								<p class="card-text">엡손 CO-FH02 리뷰영상!</p>
								<a
									href="https://www.youtube.com/watch?v=NUg-sHm9PtM&feature=youtu.be"
									class="btn btn-primary">영상 보러가기!</a>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card" style="width: 100%;">
							<img src="images/index/home.png" class="card-img-top" alt="이미지">
							<div class="card-body">
								<h5 class="card-title">홈 카메라</h5>
								<p class="card-text">홈 카메라 8종 성능테스트!</p>
								<a href="https://www.youtube.com/watch?v=-qQADVHVrIs"
									class="btn btn-primary">영상 보러가기!</a>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card" style="width: 100%;">
							<img src="images/index/wet tissue.png" class="card-img-top"
								alt="이미지">
							<div class="card-body">
								<h5 class="card-title">물티슈</h5>
								<p class="card-text">물티슈 30종비교 영상!</p>
								<a href="https://www.youtube.com/watch?v=a0CmLgx1ZBw"
									class="btn btn-primary">영상 보러가기!</a>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-3">
						<div class="card" style="width: 100%;">
							<img src="images/index/nasal_aspirator.png" class="card-img-top"
								alt="이미지">
							<div class="card-body">
								<h5 class="card-title">무선 콧물흡입기</h5>
								<p class="card-text">무선 콧물흡입기, 3종비교 영상!</p>
								<a
									href="https://www.youtube.com/watch?v=Zp4llU1RALY&feature=youtu.be"
									class="btn btn-primary">영상 보러가기!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</section>
	<!-- 푸터 (footer.html) -->
	<jsp:include page="include/footer.jsp" />
</body>

<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>


