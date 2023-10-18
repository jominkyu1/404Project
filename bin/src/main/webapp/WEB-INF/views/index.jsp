<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 더미이미지(데모이미지) 사용시
    <img src="https://placehold.it/가로x세로">
    로 적용 후 확인해보면 자동으로 그 사이즈에 맞게 불러옴
-->
<html>
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
        <link href="/css/bootstrap.min.css" rel="stylesheet" />
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
    <!-- 네비게이션(nav.jsp) 로드 -->
    <jsp:include page="include/nav.jsp" />
    <!-- 배너(header.jsp) 로드 -->
    <jsp:include page="include/header.jsp" />
        <!-- 매인 섹션 -->
        <section class="py-5">
            <div class="text-center"><h3>추천 받고싶은 제품을 선택해 보세요!</h3></div> <br>

            <div class="container mt-5">
                <h4>인기 404스토어픽 📌</h4>
                <p>404스토어가 엄선한 최고의 추천 제품</p>
            
                <div class="row">
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card" style="width: 100%;">
                             <img src="images/index/bbb.png" class="card-img-top" alt="버즈">
                             <div class="card-body">
                                <h5 class="card-title">최고의 커널형 이어폰</h5>
                                <p class="card-text">Samsung Galaxy Buds2</p>
                                <a href="iteminfo.jsp" class="btn btn-outline-danger ">제품 확인하러가기!</a>
                             </div>
                        </div>
                    </div>
            
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card" style="width: 100%;">
                             <img src="images/index/su.png" class="card-img-top" alt="냉장고">
                             <div class="card-body">
                                <h5 class="card-title">최고의 4도어 냉장고</h5>
                                <p class="card-text">Refrigerator</p>
                                <a href="#" class="btn btn-outline-danger ">제품 확인하러가기!</a>
                             </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card" style="width: 100%;">
                            <img src="images/index/game.png" class="card-img-top " alt="모니터">
                            <div class="card-body ">
                                <h5 class="card-title">최고의 게임용 모니터</h5>
                                <p class="card-text">Monitor</p>
                                <a href="#" class="btn btn-outline-danger">제품 확인하러가기!</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card" style="width: 100%;">
                             <img src="images/index/vacuum.png" class="card-img-top" alt="청소기">
                             <div class="card-body">
                                <h5 class="card-title">최고의 가성비 무선청소기</h5>
                                <p class="card-text">Vacuum</p>
                                <a href="#" class="btn btn-outline-danger ">제품 확인하러가기!</a>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
            
              
                    
                    <div class="container mt-5"> <!-- 열 크기를 조절합니다 -->
                        <h4>404스토어가 추천해 드려요<i class="bi bi-check-lg"></i></h4>
                        
                        <div class="container mt-5">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center">
                                                <p class="text-body-5 font-bold pc:text-heading-4 pc:font-extrabold">랭킹</p>
                                                <div class="ml-auto">
                                                    <img src="images/index/gold.png" style="max-width: 30px; max-height: 30px;">
                                                </div>
                                            </div>
                                            <h4 class="text-body-7 pc:text-body-1">다양한 기준의 제품 순위를 확인해보세요</h4>
                                            <a href="recommand.html" class="btn btn-outline-danger">랭킹확인!</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center">
                                                <p class="text-body-5 font-bold pc:text-heading-4 pc:font-extrabold">맞춤추천</p>
                                                <img src="images/index/t.png" style="max-width: 30px; max-height: 30px;">
                                            </div>
                                            <h4 class="text-body-7 pc:text-body-1">내 라이프 스타일에 딱 맞는 제품 추천</h4>
                                            <a href="recommand.html" class="btn btn-outline-danger">맞춤추천!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                

                

                <div class="container mt-5">
                    <div class="text-left">
                        <h4>인기 구매가이드📖</h4>
                    </div>
                    <div class="container mt-5">
                        <div class="row justify-content-center">
                            <div class="col-md-6 col-lg-3 mb-3">
                                <div class="card text-center" style="width: 100%;">
                                    <div class="card-body">
                                        <img src="images/index/b.png" class="card-img-top mx-auto" alt="분유제조기" style="max-width: 150px; max-height: 150px; display: block;">
                                        <h5 class="card-title">분유제조기</h5>
                                        <p class="card-text">버튼 하나면 분유 제조 끝! 분유제조기 고르는 법</p>
                                        <a href="#" class="btn btn-outline-primary">구매가이드 보러가기!</a>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="col-md-6 col-lg-3 mb-3">
                                <div class="card text-center" style="width: 100%;">
                                    <div class="card-body">
                                        <img src="images/index/c.png" class="card-img-top mx-auto" alt="체온계" style="max-width: 150px; max-height: 150px; display: block;">
                                        <h5 class="card-title">체온계</h5>
                                        <p class="card-text">열나는 아이의 상태 확인을 위한 체온계 고르는 법</p>
                                        <a href="#" class="btn btn-outline-primary">구매가이드 보러가기!</a>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="col-md-6 col-lg-3 mb-3">
                                <div class="card text-center" style="width: 100%;">
                                    <div class="card-body">
                                        <img src="images/index/d.png" class="card-img-top mx-auto" alt="젖병" style="max-width: 150px; max-height: 150px; display: block;">
                                        <h5 class="card-title">젖병</h5>
                                        <p class="card-text">우리 아기 입에 닿으니까 신중하게! 젖병 고르는 법</p>
                                        <a href="#" class="btn btn-outline-primary">구매가이드 보러가기!</a>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="col-md-6 col-lg-3 mb-3">
                                <div class="card text-center" style="width: 100%;">
                                    <div class="card-body">
                                        <img src="images/index/h.png" class="card-img-top mx-auto" alt="홈카메라" style="max-width: 150px; max-height: 150px; display: block;">
                                        <h5 class="card-title">홈카메라</h5>
                                        <p class="card-text">누구나 쉽게 쓰는 가정용 CCTV, 홈카메라 고르는 법</p>
                                        <a href="#" class="btn btn-outline-primary">구매가이드 보러가기!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        
    <div class="container mt-5">
            <!-- 제목과 링크 -->
        <div class="text-left">
            <h4>생생한 성능테스트 <i class="bi bi-caret-right-square-fill"></i></h4>
        </div>
                    

                    <!-- 상단 이미지와 링크 -->
           <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card" style="width: 100%;">
                        <img src="images/index/baby_bottle1.png" class="card-img-top" alt="이미지">
                        <div class="card-body">
                            <h5 class="card-title">젖병</h5>
                            <p class="card-text">젖병/젖꼭지 고민 중이라면 꼭 봐야하는 영상!</p>
                            <a href="https://www.youtube.com/watch?v=GtGNB0f324Y&feature=youtu.be" class="btn btn-primary">영상 보러가기!</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card" style="width: 100%;">
                        <img src="images/index/LG.png" class="card-img-top" alt="이미지">
                        <div class="card-body">
                            <h5 class="card-title">LG 냉장고</h5>
                            <p class="card-text">LG 냉장고 사실 분들은 꼭 봐야하는 영상!</p>
                            <a href="https://www.youtube.com/watch?v=v8wrONAgD_Q&feature=youtu.be" class="btn btn-primary">영상 보러가기!</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card" style="width: 100%;">
                        <img src="images/index/fir.png" class="card-img-top" alt="이미지">
                        <div class="card-body">
                            <h5 class="card-title">비스포크 냉장고</h5>
                            <p class="card-text">비스포크 냉장고 사려면 두번 봐야 하는 영상!</p>
                            <a href="https://www.youtube.com/watch?v=ZDymMcgG5nA&feature=youtu.be" class="btn btn-primary">영상 보러가기!</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card" style="width: 100%;">
                        <img src="images/index/beam_projector.png" class="card-img-top" alt="이미지">
                        <div class="card-body">
                            <h5 class="card-title">빔프로젝트</h5>
                            <p class="card-text">100인치를 만드는데 9.8cm면 충분한 빔프로젝터 영상!</p>
                            <a href="https://www.youtube.com/watch?v=zloTy4rSBKM&feature=youtu.be" class="btn btn-primary">영상 보러가기!</a>
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
                            <a href="https://www.youtube.com/watch?v=NUg-sHm9PtM&feature=youtu.be" class="btn btn-primary">영상 보러가기!</a>
                         </div>
                    </div>
                </div>
                            
                <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card" style="width: 100%;">
                        <img src="images/index/home.png" class="card-img-top" alt="이미지">
                        <div class="card-body">
                            <h5 class="card-title">홈 카메라</h5>
                            <p class="card-text">홈 카메라 8종 성능테스트!</p>
                            <a href="https://www.youtube.com/watch?v=-qQADVHVrIs" class="btn btn-primary">영상 보러가기!</a>
                        </div>
                    </div>
                </div>
                            
                <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card" style="width: 100%;">
                        <img src="images/index/wet tissue.png" class="card-img-top" alt="이미지">
                        <div class="card-body">
                            <h5 class="card-title">물티슈</h5>
                            <p class="card-text">물티슈 30종비교 영상!</p>
                            <a href="https://www.youtube.com/watch?v=a0CmLgx1ZBw" class="btn btn-primary">영상 보러가기!</a>
                        </div>
                    </div>
                </div>
                            
                <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card" style="width: 100%;">
                        <img src="images/index/nasal_aspirator.png" class="card-img-top" alt="이미지">
                        <div class="card-body">
                            <h5 class="card-title">무선 콧물흡입기</h5>
                            <p class="card-text">무선 콧물흡입기, 3종비교 영상!</p>
                            <a href="https://www.youtube.com/watch?v=Zp4llU1RALY&feature=youtu.be" class="btn btn-primary">영상 보러가기!</a>
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
    <script src="js/bootstrap.bundle.js"></script>
</html>


