<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  
</head>
<script>
  function changeStatus(){
    $('#delStatus option:selected').each(function(){
      location.href = '/admin/orders?status=' + $(this).val();
    })
  }
</script>
<body>
<!-- 네비게이션 로드 -->
<jsp:include page="../include/nav.jsp" />

<!-- 매인 섹션 -->
<section class="row mx-auto">
  <!-- 어드민 네비게이션 로드 -->
  <jsp:include page="../include/admin_nav.jsp" />
  
  <div class="col p-3 bg-body-tertiary">
    <h2 class="lead text-center fw-bold"> 주문관리 </h2>
    <hr>
    <div class="row">
      <div class="col-md-10 offset-md-1">
        <div class="card">
          <div class="card-header">
            <div class="row">
              <div class="col-6">
                <h3 class="card-title">${status} 상품: ${orders.size()}건</h3>
              </div>
              <div class="col-6 text-end">
                <!-- 주문완료, 배송중, 배송완료 -->
                  <select name="status" class="form-select form-select-sm" id="delStatus" onchange="changeStatus()">
                    <option>=====</option>
                    <option value="ALL">전체</option>
                    <option value="ORDER">주문완료</option>
                    <option value="DELIVERY">배송중</option>
                    <option value="COMPLETE">배송완료</option>
                    <option value="CANCEL">주문취소</option>
                  </select>
              </div>
            </div>
          </div>
          <div class="card-body">
            <table class="table table-striped table-bordered table-list">
              <thead>
              <tr>
                <th class="col-3">주문번호</th>
                <th style="width: 100px;">ID</th>
                <th style="width: 150px;">주문 상품</th>
                <th style="width: 130px;">주문 금액</th>
                <th>배송지</th>
                <th class="text-center" style="width: 200px;">주문처리</th>
              </tr>
              </thead>
              <tbody>
                <!-- 주문 반복문 -->
                <c:forEach items="${orders}" var="order">
                <tr>
                  <td>
                    <fmt:formatDate value="${order.order_date}" pattern="yyyyMMdd_HHmm" />
                     #${order.order_id}
                    <a href="/user/orders/${order.order_id}" id="orderDetail">주문상세</a>
                  </td>
                  <td>${order.user.username}</td>
                  <td>
                    ${order.orderItems[0].itemVO.name}
                    <c:set var="moreCount" value="${fn:length(order.orderItems) -1}" />
                    <c:if test="${moreCount > 0}">
                      외 ${moreCount}개
                    </c:if>
                  </td>
                  <!-- 주문금액 -->
                  <c:set var="totalPrice" value="0" />
                  <c:forEach items="${order.orderItems}" var="orderItem">
                    <c:set var="totalPrice" value="${totalPrice + (orderItem.price * orderItem.quantity)}" />
                  </c:forEach>
                  <td>${totalPrice} 원</td>
                  <!-- 배송지 -->
                  <td>${order.user.address1} ${order.user.address2} ${order.user.address_detail}</td>
                  <!-- 주문처리 -->
                  <td class="text-center">
                    <c:choose>
                      <c:when test="${order.status == 'ORDER'}">
                        <form method="post" class="btn-group">
                          <input type="hidden" name="order_id" value="${order.order_id}" />
                          <button class="btn btn-default" type="submit" onclick="return confirm('배송처리 하시겠습니까?')">
                            <em class="fa fa-paper-plane"></em>
                          </button>
                        </form>
                        <a class="btn btn-danger"
                           onclick="return confirm('주문취소 처리하시겠습니까?')"
                           href="/admin/orders/cancel/${order.order_id}">
                          <em class="fa fa-trash"></em>
                        </a>
                      </c:when>
                      <c:when test="${order.status == 'CANCEL'}">
                        <b class="text-danger">${order.status.value}</b>
                      </c:when>
                      <c:otherwise>
                        <b> <!-- 주문 현황 Enum의 Value값 -->
                            ${order.status.value}
                        </b>
                        <br>
                        송장: ${order.tracking}
                      </c:otherwise>
                    </c:choose>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          
          <!-- 페이징 -->
          <jsp:include page="../paging/paging.jsp">
            <jsp:param name="paging" value="${paging}"/>
          </jsp:include>
        </div>
      </div>
    </div>
  </div>
  
  
</section>
<!-- 푸터 (footer.html) -->
<jsp:include page="../include/footer.jsp" />
</body>

<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>
