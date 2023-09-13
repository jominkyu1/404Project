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
        <section class="py-5 mx-auto">
            <div class="text-center"><h2>회원 로그인</h2></div>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row justify-content-center">
                    <div class="mb-5 col-md-6 col-lg-6">
                        <form method="post" class="col-auto p-3 border border2">
                            <label for="form-id" class="fw-bolder">아이디</label> 
                            <input type="text" class="form-control mb-4" id="form-id" required>
                            <label for="form-pw" class="fw-bolder ">비밀번호</label>
                            <input type="password" class="form-control mb-4" id="form-pw" required><hr>
                            <div class="p-2">
                                <input type="submit" class="btn btn-outline-secondary" value="로그인">
                                <input type="button" class="btn btn-outline-secondary" value="아이디/비밀번호 찾기">
                                <a href="register.html" class="btn btn-secondary float-end">회원가입</a>
                            </div>
                        </form>
                        <img src="/images/login/naverbtn.png" class="img-fluid my-4 d-block mx-auto " style="width:150px;">
                        <img src="/images/login/kakaobtn.png" class="img-fluid my-4 d-block mx-auto " style="width:150px;">
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
