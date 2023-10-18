<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
          <div class="text-center">
            <h3 class="mb-3 badge bg-secondary-subtle d-block w-25 mx-auto text-black ">
                SNS계정으로 간편하게 가입하세요!</h3>
            <img src="/images/login/icon_kakao.webp" style="width: 4rem;">
            <img src="/images/login/icon_naver.webp" style="width: 4rem;">
          </div>
          <div class="container px-4 px-lg-5 mt-5">
              <div class="row justify-content-center">
                  <div class="mb-5 col-md-6 col-lg-6">
                      <form:form modelAttribute="userRegisterForm"
                                 method="post"
                                 class="col-auto p-3 border border2">
                        
                        <!-- 에러처리 -->
                        <spring:hasBindErrors name="userRegisterForm">
                          <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <c:forEach var="error" items="${errors.allErrors}">
                                    <strong>${error.defaultMessage}</strong><br><br>
                              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </c:forEach>
                          </div>
                        </spring:hasBindErrors>
                        
                          <label for="username" class="fw-bolder">아이디</label>
                          <form:input path="username" type="text" class="form-control mb-4"
                                 required="required" />
                          
                          <label for="password" class="fw-bolder ">비밀번호</label>
                          <form:input path="password" type="password" class="form-control mb-4"
                                 required="required" />
                          
                          <label for="password2" class="fw-bolder ">비밀번호 확인</label>
                          <input type="password" class="form-control mb-4"
                                 required="required" id="password2" name="password2">
                          
                          <label for="email" class="fw-bolder">이메일</label>
                          <form:input path="email" type="email" class="form-control mb-4"
                                 placeholder="ex) example@gmail.com" required="required" />
                          
                          <label for="userphone" class="fw-bolder">전화번호</label>
                          <form:input path="userphone" type="tel" class="form-control"
                                 placeholder="ex) 01012345678" required="required"/>
                          <hr>

                          <!-- 주소찾기 API폼 -->
                          <label for="addFinder" class="d-block fw-bolder mb-2">주소</label>
                          <form:input path="postcode" type="text"
                                      class="form-control d-inline w-25 text-sm-start"
                                      placeholder="우편번호" />
                          <input type="button" class="btn btn-outline-secondary"
                                 onclick="daumPostcodeFinder()" id="addFinder" value="우편번호 찾기"> <br>

                          <form:input path="address1" type="text"
                                 class="form-control mb-1" placeholder="주소" />
                          <form:input path="address2" type="text"
                                 class="form-control mb-1" placeholder="참고항목" />
                          <form:input path="address_detail" type="text"
                                 class="form-control mb-1" placeholder="상세주소" required="required" />
                          <!-- 주소찾기 API폼 -->

                          <hr>
                          <input type="submit" class="btn btn-secondary m-2" value="회원가입">
                      </form:form>
                  </div>
              </div>
          </div>
      </section>
        <!-- 푸터 (footer.html) -->
        <jsp:include page="include/footer.jsp" />
    </body>

    <!-- 카카오 주소찾기 API-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/js/postcode_finder.js"></script>
    <!-- Bootstrap core JS-->
    <script src="/js/bootstrap.bundle.js"></script>

</html>