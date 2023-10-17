<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script>
        function alertUpdated(){
            alert("회원정보가 수정되었습니다. 다시 로그인하세요!");
        }
    </script>
    <body>
    <c:if test="${!empty param.updated}">
        <script>
            alertUpdated();
        </script>
    </c:if>
    <!-- 네비게이션(nav.html) 로드 -->
    <jsp:include page="include/nav.jsp" />
    <!-- 배너(header.html) 로드 -->
    <jsp:include page="include/header.jsp" />
        <!-- 매인 섹션 -->
        <section class="py-5 mx-auto">
            <div class="text-center"><h2>로그인</h2></div>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row justify-content-center">
                    <div class="mb-5 col-md-6 col-lg-6">
                        <!-- 로그인 실패시 오류 메세지 -->
                        <c:if test="${!empty param.exception}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>${param.exception}</strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        <form method="post" class="col-auto p-3 border border2">
                            <label for="form-id" class="fw-bolder" >아이디</label>
                            <input type="text" class="form-control mb-4" id="form-id" name="username" required>
                            <label for="form-pw" class="fw-bolder ">비밀번호</label>
                            <input type="password" class="form-control mb-4" id="form-pw" name="password" required>
                            <!-- remember-me -->
                            <input type="checkbox" name="remember-me" id="remember-me" class="form-check-input">
                            <label for="remember-me">자동 로그인</label>
                            
                            <hr>
                            
                            <div class="p-2">
                                <input type="submit" class="btn btn-outline-secondary" value="로그인">
                                <input type="button" class="btn btn-outline-secondary" value="아이디/비밀번호 찾기">
                                <a href="/register" class="btn btn-secondary float-end">회원가입</a>
                            </div>
                        </form>
                        <a href="/oauth2/authorization/google">
                            <img src="/images/login/googlebtn.png" class="img-fluid m-2" style="width:150px;">
                        </a>
                        <a href="#">네이버</a>
                        <a href="#">카카오</a>
                        <!-- 소셜 로그인 TODO
                        <img src="/images/login/naverbtn.png" class="img-fluid my-4 d-block mx-auto " style="width:150px;">
                        <img src="/images/login/kakaobtn.png" class="img-fluid my-4 d-block mx-auto " style="width:150px;">
                        -->
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
