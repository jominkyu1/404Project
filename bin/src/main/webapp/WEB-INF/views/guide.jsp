<%@ page contentType="text/html; charset=UTF-8" %>
<!-- 더미이미지(데모이미지) 사용시
    <img src="https://placehold.it/가로x세로">
    로 적용 후 확인해보면 자동으로 그 사이즈에 맞게 불러옴
-->
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>404 Store</title>
    <!--부트스트랩 아이콘 CSS
            https://icons.getbootstrap.com/ 이곳에서 아이콘 확인! 클래스명에 아이콘 적으면됨!
        -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

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

    #hello1 {
        text-decoration: none;
        /* 초기에는 밑줄 없음 */
    }

    #hello1:hover {
        text-decoration: underline;
    }

    /*마우스 오버시 밑줄 */
</style>

<body>
    <!-- 네비게이션(nav.html) 로드 -->
    <jsp:include page="include/nav.jsp" />
    <!-- 배너(header.html) 로드 -->
    <jsp:include page="include/header.jsp" />
    <!-- 매인 섹션 -->
    <section>
        <!--Main 네비게이션바 시작-->
        <nav class="navbar navbar-expand-lg bg-light" id="guidenav">
            <div class="container">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="#" data-abc="true"> <strong>구매 GUIDE</strong></a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02"
                    aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarColor02">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="/guide" data-abc="true">전체 <span
                                    class="visually-hidden">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/guide/digitalit" data-abc="true">디지털 IT</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-abc="true">생활가전</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-abc="true">주방가전</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--Main 네비게이션바 끝-->

        <br>
        <div class="text-center">
            <h2>구매가이드</h2>
        </div>
        <br>
        <!--search bar 시작-->

        <form onsubmit="event.preventDefault()" class="d-flex justify-content-center">
            <input class="form-control me-2 w-25  justify-content-center" type="search" placeholder="Search"
                aria-label="Search">
            <button class="btn btn-secondary" type="submit">Search</button>
        </form>

        <!--search bar끝-->
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        

                        <!-- Product details-->
                        <style>
                            .bd {
                                overflow: hidden;
                            }

                            .radius {
                                border-radius: 20px;
                            }
                        </style>
                        <div class="card-body p-4">
                            <div class="bd">
                                <div class="im w-auto h-auto">
                                    <img class="card-img-top radius h-50" src="/images/guide/bluetooth_earphones.jpg"
                                        alt="버즈2" />
                                </div>
                            </div>
                            <div class="text-center">
                                <!-- Product name-->
                                <br>
                                <h5 class="fw-bolder">블루투스<br>이어폰</h5>
                                <!-- Product explanation-->
                                <div class="text-center">
                                    <a id="hello1" href="/guide/item">
                                        가성비 좋고 <br>
                                        나에게 맞는 제품 추천!
                                    </a>
                                </div>
                            </div>
                        </div>

                        <script>
                            // JavaScript를 사용하여 <a> 요소에 마우스 오버 시 <div class="im"> 클래스 확대
                            const imDiv = document.querySelector(".im");

                            document.getElementById("hello1").addEventListener("mouseenter", () => {
                                imDiv.style.transform = "scale(1.3)";
                            });

                            document.getElementById("hello1").addEventListener("mouseleave", () => {
                                imDiv.style.transform = "scale(1.0)";
                            });
                        </script>

                    </div>
                </div>
            </div>
        </div>
        <!--구매가이드 End-->
    </section>
    <!-- 푸터 (footer.html) -->
    <jsp:include page="include/footer.jsp" />
</body>

<!-- Bootstrap core JS-->
<script src="js/bootstrap.bundle.js"></script>

</html>