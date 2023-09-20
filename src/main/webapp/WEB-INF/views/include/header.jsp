<%@ page contentType="text/html; charset=UTF-8" %>
<!-- BOOTSTRAP -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />

<header class="bg-white" id="headerjs">
    <div id="carouselExampleIndicators" class="carousel slide carousel-dark" data-bs-ride="carousel">
        <!-- 배너 하단 버튼 -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <!-- 배너 이미지 넣는 공간 1100x260 -->
        <div class="carousel-inner mx-auto">
            <div class="carousel-item active">
                <img src="/images/banner1.webp"
                     class="d-block mx-auto" alt="Slide 1">
            </div>
            <div class="carousel-item">
                <img src="/images/dummybanner.png"
                     class="d-block mx-auto" alt="Slide 2">
            </div>
            <div class="carousel-item">
                <img src="https://placehold.it/1100x260"
                     class="d-block mx-auto" alt="Slide 3">
            </div>
        </div>
        <!-- 배너 좌우 버튼 -->
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</header>