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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />

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
    <jsp:include page="../include/nav.jsp" />
    
        <!-- 매인 섹션 -->
    <section class="row mx-auto">
        <!-- 어드민 네비게이션 로드 -->
        <jsp:include page="../include/admin_nav.jsp" />


        <div class="col p-3 bg-body-tertiary"> 
            <h2 class="lead text-center fw-bold">메인화면</h2><hr>
                <div class="table-responsive-sm">
                    <table class="table table-striped-columns
                    table-borderless
                    table-light
                    mx-auto">
                    <caption class="caption-top text-center fw-bold mb-3">회원현황</caption>
                        <thead class="text-center">
                            <tr>
                                <th>전체회원</th>
                                <th>일반회원</th>
                                <th>VIP회원</th>
                                <th>Admin</th>
                            </tr>
                            </thead>
                            <tbody class="table-group-divider text-center">
                                <tr class="table-light" >
                                    <td scope="row">150</td>
                                    <td>100</td>
                                    <td>40</td>
                                    <td>10</td>
                                </tr>
                            </tbody>
                    </table>
                </div>

            <hr>

            <table class="table table-striped text-center table-hover" style="table-layout: fixed;">
                <caption class="caption-top fw-bold text-center mb-3">미답변 상품문의</caption>
                <thead>
                    <tr>
                        <th class="w-25">상품명</th>
                        <th class="w-75">제목</th>
                        <th class="w-25">이름</th>
                        <th class="w-25">날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>버즈2 프로</td>
                        <td class="overflow-hidden text-nowrap">
                            <a href="#">
                            안녕하세요. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다.
                            </a>
                        </td>
                        <td class="overflow-hidden text-nowrap">홍길동</td>
                        <td class="overflow-hidden text-nowrap">2023/09/03</td>
                    </tr>
                    <tr>
                        <td>아이템2</td>
                        <td class="overflow-hidden text-nowrap">
                            안녕하세요. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다.
                        </td>
                        <td class="overflow-hidden text-nowrap">홍길동</td>
                        <td class="overflow-hidden text-nowrap">2023/09/03</td>
                    </tr>
                    <tr>
                        <td>아이템3</td>
                        <td class="overflow-hidden text-nowrap">
                            안녕하세요. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다.
                        </td>
                        <td class="overflow-hidden text-nowrap">홍길동</td>
                        <td class="overflow-hidden text-nowrap">2023/09/03</td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-striped text-center mx-auto table-hover" style="table-layout: fixed;">
                <caption class="caption-top fw-bold text-center mb-3">미답변 Q&A</caption>
                <thead>
                    <tr>
                        <th class="w-75">제목</th>
                        <th class="w-25">이름</th>
                        <th class="w-25">날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="overflow-hidden text-nowrap">안녕하세요. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다.</td>
                        <td class="overflow-hidden text-nowrap">홍길동</td>
                        <td class="overflow-hidden text-nowrap">2023/09/03</td>
                    </tr>
                    <tr>
                        <td class="overflow-hidden text-nowrap">안녕하세요. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다.</td>
                        <td class="overflow-hidden text-nowrap">홍길동</td>
                        <td class="overflow-hidden text-nowrap">2023/09/03</td>
                    </tr>
                    <tr>
                        <td class="overflow-hidden text-nowrap">안녕하세요. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다.</td>
                        <td class="overflow-hidden text-nowrap">홍길동</td>
                        <td class="overflow-hidden text-nowrap">2023/09/03</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- 푸터 (footer.html) -->
    <jsp:include page="../include/footer.jsp" />
    <!-- include.js 자바스크립트 -->
    <script src="include/include.js"></script>
    <script>
            includeHTML();
    </script>
    </body>

    <!-- Bootstrap core JS-->
    <script src="js/bootstrap.bundle.js"></script>
</html>
