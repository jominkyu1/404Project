<%@ page contentType="text/html; charset=UTF-8"%>
<!-- BOOTSTRAP -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />

<style>
.carousel-inner {
	width: 100%; /* 컨테이너의 최대 너비를 100%로 설정 */
	height: 35vh; /* 원하는 높이로 설정 */
}

.carousel-inner img {
	height: 100%; /* 이미지 높이를 컨테이너 높이에 맞춥니다. */
	margin: 0 auto; /* 이미지를 수평 가운데 정렬합니다. */
}

/* 배너 높이 조절 */
#carouselExampleIndicators {
	max-height: 35vh; /* 원하는 높이로 설정합니다. */
}
</style>

<header class="bg-white" id="headerjs">
	<div id="carouselExampleIndicators"
		class="carousel slide carousel-dark" data-bs-ride="carousel">
		<!-- 배너 하단 버튼 -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<!-- 배너 이미지 넣는 공간 1900x320 -->
		<div class="carousel-inner mx-auto" style="height: 35vh;">
			<div class="carousel-item active">
				<img src="/images/banner1.webp" class="d-block mx-auto img-fluid"
					alt="Slide 1">
			</div>
			<div class="carousel-item">
				<img src="/images/dummybanner2.png"
					class="d-block mx-auto img-fluid" alt="Slide 2">
			</div>
			<div class="carousel-item">
				<img src="/images/dummybanner2.png"
					class="d-block mx-auto img-fluid" alt="Slide 3">
			</div>
		</div>
		<!-- 배너 좌우 버튼 -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</header>
