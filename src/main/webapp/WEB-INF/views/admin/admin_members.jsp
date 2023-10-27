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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

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
        <h2 class="lead text-center fw-bold"> 회원관리 </h2><hr>
        <!--아이디 이름 휴대폰 가입일 권한 개인정보 가입현황(탈퇴, 활성)-->

        <caption class="caption-top mb-3 text-center"><b>회원수: ${memberCount}명</b></caption>

        <div class="table-responsive">
            <table class="table table-striped-columns
              table-hover
              table-bordered
              table-light
              align-middle">
                <thead class="table-light">
                <tr>
                    <th>#</th>
                    <th>아이디</th>
                    <th>휴대폰</th>
                    <th>가입일</th>
                    <th>권한</th>
                    <th>개인정보</th>
                    <th>탈퇴시키기</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr class="table-light">
                        <td>${user.user_id}</td>
                        <td>${user.username}</td>
                        <td>${user.userphone}</td>
                        <td>${user.regdate}</td>
                        <td>${user.usergrade}</td>
                        <td>${user.address1}</td>
                        <td>
                            <a href="/admin/members/delete/${user.user_id}"
                               class="btn btn-danger mx-auto"
                               onclick="return confirm('정말 탈퇴시키시겠습니까? 정보는 즉시삭제되며 복구될 수 없습니다.')">탈퇴</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <jsp:include page="../paging/paging.jsp">
                <jsp:param name="paging" value="${paging}"/>
            </jsp:include>
            
            <form class="mb-3">
                    <input type="text" id="search" name="search" placeholder="ID 검색">
                    <button type="submit" class="btn btn-outline-secondary btn-sm">검색</button>
            </form>
        </div>
    </div>
</section>
<!-- 푸터 (footer.html) -->
<jsp:include page="../include/footer.jsp" />
</body>

<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>
