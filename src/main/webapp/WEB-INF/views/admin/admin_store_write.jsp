<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<!-- 네비게이션 로드 -->
<jsp:include page="../include/nav.jsp" />

<!-- 매인 섹션 -->
<section class="row mx-auto">
  <!-- 어드민 네비게이션 로드 -->
  <jsp:include page="../include/admin_nav.jsp" />
  <div class="col p-3 bg-body-tertiary">
    <h2 class="lead text-center fw-bold">특가스토어</h2><hr>
    
    <form:form modelAttribute="itemUploadForm" method="post" enctype="multipart/form-data">
      <!-- 에러처리 -->
      <spring:hasBindErrors name="itemUploadForm">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
          <c:forEach var="error" items="${errors.allErrors}">
            <strong>${error.defaultMessage}</strong><br><br>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </c:forEach>
        </div>
      </spring:hasBindErrors>
      
      <div class="mb-3">
        <label for="name" class="form-label">상품명</label>
        <form:input path="name" class="form-control" />
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">상품설명</label>
        <form:textarea path="description" class="form-control" rows="3" />
      </div>
      <div class="mb-3">
        <label for="price" class="form-label">상품가격</label>
        <form:input path="price" class="form-control" />
      </div>
      <div class="mb-3">
        <label for="stockQuantity" class="form-label">상품재고</label>
        <form:input path="stockQuantity" class="form-control" />
      </div>
      <div class="mb-3">
        <label for="image" class="form-label">상품이미지</label>
        <form:input path="image" type="file" class="form-control" required="required"/>
      </div>
      
      <button type="submit" class="btn btn-outline-secondary">등록</button>
    </form:form>
    
  </div>
</section>
<!-- 푸터 (footer.html) -->
<jsp:include page="../include/footer.jsp" />
</body>

<script src="/js/bootstrap.bundle.js"></script>
</html>