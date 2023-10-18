<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>

<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>500 Error</title>
  
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
        <div class="mb-4 lead">일시적인 서버 오류입니다.</div>
        <hr>
        <c:choose>
          <c:when test="${not empty message}">
            <div class="mb-4 lead">내용: <b>${message}</b></div>
          </c:when>
          <c:when test="${exception != null}">
            <div class="mb-4 lead">
              <%
                String errorMessage = exception.getMessage();
                int index = errorMessage.lastIndexOf(": ")+1;
              %>
              내용: <b><%=errorMessage.substring(index)%></b>
            </div>
          </c:when>
          <c:otherwise />
        </c:choose>
        <button class="btn btn-lg btn-outline-secondary" onclick="history.back()">이전 페이지</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>