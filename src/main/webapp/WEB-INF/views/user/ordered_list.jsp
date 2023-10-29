<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title></title>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <style>
      .carousel-inner {
          width: 80%;
          height: 35vh;
      }

      .carousel-item, . carousel-item img {
          width: 100%;
          height: 100%;
      }

      /* Reduce the card size further and align content */
      .card {
          width: 50%; /* Adjust the width as needed */
          margin: 10px auto; /* Center-align the card and add a margin */
          text-align: center; /* Center-align the card's content */
      }

      .card-body {
          text-align: left; /* Left-align the content within the card */
      }

      .btn-primary, .btn-danger {
          margin: 5px; /* Adjust the margin as needed */
      }
  </style>
</head>
<body>
<jsp:include page="../include/nav.jsp" />
<jsp:include page="../include/header.jsp" />
<section class="py-3 mx-auto">
  <div class="text-center">
    <h2>주문정보</h2>
  </div>
  
  <c:forEach var="order" items="${orders}">
    <div class="card mt-2">
      <div class="card-body">
        <h5 class="card-title text-center mb-2">주문번호 #${order.order_id}</h5>
        <fmt:formatDate value="${order.order_date}" pattern="yyyy년 MM월 dd일 aa hh시 mm분" var="orderDate"/>
        <p class="card-text">주문시각: ${orderDate}</p>
        <p class="card-text">
          <c:choose>
            <c:when test="${order.status == 'ORDER'}">
              주문상태: <span style="color: #0a53be">주문완료! 곧 배송이 시작됩니다.</span>
            </c:when>
            <c:when test="${order.status == 'CANCEL'}">
              주문상태: <span style="color: red">주문취소</span>
            </c:when>
            <c:when test="${order.status == 'DELIVERY'}">
              주문상태: <span style="color: #13653f">배송이 진행중입니다.</span>
            </c:when>
            <c:when test="${order.status == 'COMPLETE'}">
              주문상태: <span class="fw-bold">배송이 완료되었습니다.</span>
            </c:when>
          </c:choose>
        </p>
        <c:if test="${!empty order.tracking}">
          <p class="card-text">운송장번호: ${order.tracking}</p>
        </c:if>
        <table class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>주문하신 상품</th>
            <th>주문가격</th>
            <th>주문수량</th>
          </tr>
          </thead>
          <tbody>
          <c:set var="totalPrice" value="0"/>
          <c:forEach var="orderItem" items="${order.orderItems}">
            <tr>
              <td>${orderItem.itemVO.name}</td>
              <fmt:formatNumber value="${orderItem.price}" type="number" var="price"/>
              <td>${price}원</td>
              <td>${orderItem.quantity}</td>
            </tr>
            <c:set var="totalPrice" value="${totalPrice + (orderItem.price * orderItem.quantity)}"/>
          </c:forEach>
          <tr>
            <td class="fw-bold">합계</td>
            <fmt:formatNumber value="${totalPrice}" type="number" var="totalPrice"/>
            <td colspan="2" class="fw-bold">${totalPrice}원</td>
          </tr>
          </tbody>
        </table>
        <a href="/user/orders/${order.order_id}" class="btn btn-outline-secondary">주문상세</a>
        <c:if test="${order.status == 'ORDER'}">
        <button class="btn btn-danger" onclick="cancelOrder(${order.order_id})">주문취소</button>
        </c:if>
        <c:if test="${order.status == 'DELIVERY'}">
        <a href="/user/orders/${order.order_id}/complete"
           class="btn btn-primary" onclick="confirm('구매 확정 하시겠습니까?')">구매확정</a>
        </c:if>
      </div>
    </div>
  </c:forEach>
</section>
<jsp:include page="../include/footer.jsp" />
</body>
<script>
  function cancelOrder(orderId){
      if(confirm('정말로 주문을 취소하시겠습니까?')){
        $.ajax({
            url: '/order/' + orderId,
            type: 'PATCH',
            success: function (){
                alert('주문이 취소되었습니다!');
                location.href = '/user/orders';
            },
            error: function (){
                alert('주문을 취소할 수 없습니다. 취소는 발송이전에만 가능합니다!');
                location.href = '/user/orders';
            }
        })
      }
  }
</script>
<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>
