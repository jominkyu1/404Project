<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  .page-wrap{
      min-height: 70vh;
  }
</style>
<body>

<jsp:include page="../include/nav.jsp" />

<div class="page-wrap d-flex flex-row align-items-center">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-12 text-center">
        <span class="display-1 d-block">${pageContext.response.status}</span>
        <div class="mb-4 lead">페이지를 찾을 수 없습니다! </div>
        <c:if test="${not empty message}">
          <hr>
          <div class="mb-4 lead">내용: <b>${message}</b></div>
        </c:if>
        <button class="btn btn-lg btn-outline-secondary" onclick="history.back()">이전 페이지</button>
      </div>
    </div>
  </div>
</div>
</body>
<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>