<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!--부트스트랩 아이콘 CSS
    https://icons.getbootstrap.com/ 이곳에서 아이콘 확인! 클래스명에 아이콘 적으면됨!
-->
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
    rel="stylesheet"
/>








<nav class="navbar navbar-expand-lg" style="background-color: rgba(211, 211, 211, 0.38);">
    <div class="container px-2" id="navbarjs">
        <a class="navbar-brand fw-bolder" href="/">
            <i class="bi-bookmark-heart-fill mx-2"></i>404 STORE
        </a>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse fw-bold" id="navbarSupportedContent">
            <ul class="navbar-nav mx-2">
                <li class="nav-item"><a class="nav-link" href="/">홈</a></li>
                <!-- <li class="nav-item"><a class="nav-link" href="/recommand">추천</a></li> -->
                <li class="nav-item"><a class="nav-link" href="/guide">구매가이드</a></li>
                <li class="nav-item"><a class="nav-link" href="/specialstore">특가스토어</a></li>
                <li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
            </ul>
            <!-- 오른쪽 위 네비게이션 링크 추가 -->
            <ul class="navbar-nav mx-2 ms-auto">
                <sec:authorize access="isAnonymous()">
                    <li class="nav-item"><a class="nav-link" href="/register">회원가입</a></li>
                    <li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_USER')" >
                    <sec:authentication property="principal.user" var="user"/>
                    <li class="nav-link" style="color: lightseagreen">${user.username}</li>
                    <li class="nav-item"><a class="nav-link" href="/user/${user.user_id}">회원정보</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')" >
                    <sec:authentication property="principal.user" var="user"/>
                    <li class="nav-link" style="color: lightseagreen">${user.username}</li>
                    <li class="nav-item"><a class="nav-link" href="/admin">관리자</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/${user.user_id}">회원정보</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                </sec:authorize>
            </ul>
            <!-- 검색 기능-->
            <form class="navbar-nav mx-2">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" required tabindex="1">
                <input class="btn btn-outline-dark text-bg-dark" type="submit" value="검색">
            </form>
            <!-- 장바구니 -->
            <form class="nav-item d-flex m-1 ms-auto" action="/cart">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    장바구니
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
            </form>
        </div>
    </div>
</nav>

