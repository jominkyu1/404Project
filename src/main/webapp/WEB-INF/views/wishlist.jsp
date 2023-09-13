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
        .carousel-inner{
            width: 80%;
            height: 35vh; 
        }
        .carousel-item, .carousel-item img{
            width: 100%;
            height: 100%;
        }   
    </style>
    <body>
    <!-- 네비게이션(nav.html) 로드 -->
    <jsp:include page="include/nav.jsp" />
    <!-- 배너(header.html) 로드 -->
    <jsp:include page="include/header.jsp" />
        <!-- 매인 섹션 -->
        <section class="py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="p-2 text-center">
                            <h2>장바구니</h2>
                        </div>
                        <!-- 더미 아이템 1 -->
                        <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                            <div class="mr-1"><img class="rounded" src="https://placehold.it/70x50" width="70"></div>
                            <div class="d-flex flex-column align-items-start product-details w-25">
                                <span class="fw-bold">삼성 갤럭시 S23 Ultra</span>
                            </div>
                            
                            <div class="d-flex flex-row qty align-items-center w-25">
                                <i class="bi bi-cloud-minus"></i>
                                <h5 class="text-grey mt-1 mx-2">1</h5>
                                <i class="bi bi-cloud-plus-fill"></i>
                            </div>
                            <div class="w-25 text-end">
                                <h5>1,250,000원</h5>
                            </div>
                            <div class="d-flex align-items-center"><i class="bi bi-trash text-danger"></i></div>
                        </div>
                        
                        <!-- 더미 아이템 2 -->
                        <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                            <div class="mr-1"><img class="rounded" src="https://placehold.it/70x50" width="70"></div>
                            <div class="d-flex flex-column align-items-start product-details w-25">
                                <span class="fw-bold">갤럭시 버즈2 프로</span>
                            </div>
                            
                            <div class="d-flex flex-row align-items-center qty w-25">
                                <i class="bi bi-cloud-minus"></i>
                                <h5 class="text-grey mt-1 mx-2">1</h5>
                                <i class="bi bi-cloud-plus-fill"></i>
                            </div>
                            <div class="w-25 text-end">
                                <h5>45,000원</h5>
                            </div>
                            <div class="d-flex align-items-center"><i class="bi bi-trash text-danger"></i></div>
                        </div>
                        
                        <hr class="my-3">

                        <!-- 할인 코드 입력 부분 -->
                        <div class="d-flex align-items-center my-3">
                            <input type="text" class="form-control" placeholder="할인코드/쿠폰 입력">
                            <button class="btn btn-secondary w-25">적용</button>
                        </div>

                        <!-- 총 금액 -->
                        <div class="text-end fw-bolder">
                            <span>합계: 20000원</span> <br>
                            <span class="text-black-50">할인: 5000원</span> <br><br>

                            <span>총 가격: 15000원</span>
                        </div>
                        <div class="d-grid my-5">
                            <button class="btn btn-outline-secondary btn-lg" type="button">결제하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- 푸터 (footer.html) -->
        <jsp:include page="include/footer.jsp" />
        <!-- include.js 자바스크립트 -->
        <script src="include/include.js"></script>
        <script>
            includeHTML();
        </script>
    </body>

    <!-- Bootstrap core JS-->
    <script src="js/bootstrap.bundle.js"></script>
    
</html>
