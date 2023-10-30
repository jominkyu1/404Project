<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title></title>
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

.carousel-inner {
	width: 80%;
	height: 35vh;
}

.carousel-item, .carousel-item img {
	width: 100%;
	height: 100%;
}

/* Reduce the card size further and align content */
.card {
	width: 50%;
	margin: 10px auto;
	text-align: center;
}

.card-body {
	text-align: left;
}

.btn-primary, .btn-danger {
	margin: 5px;
}

.nav-link {
	color: black;
}

.menu {
	display: flex;
	list-style: none;
	padding: 0;
}

.menu li {
	flex: 1;
	text-align: center;
}

p {
	margin-left: 20px;
}

.menu strong {
	font-weight: bold;
}

.styled-button {absolute;
	top: 50%;
	background-color: #0a0a23;
	color: #fff;
	border: none;
	border-radius: 10px;
	box-shadow: 0px 0px 2px 2px rgb(0, 0, 0);
	font-size: 13px;
}

.menu a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<jsp:include page="../include/nav.jsp" />
	<jsp:include page="../include/header.jsp" />
	<section class="py-3 mx-auto">
		<h2 style="text-align: center;">ORDER LIST</h2>



		<div style="text-align: center;">
			<ul class="menu">
				<li class="tab_class selected"><a href="#"><strong>주문내역조회</strong></a></li>
				<li class="tab_class_cs"><a href="#"><strong>취소/반품/교환내역</strong></a></li>
			</ul>
		</div>
		<hr>
		<h3 style="text-align: center; font-size: 15px;">
			<strong>배송기간조회</strong>
		</h3>
		<form style="text-align: center;">
			<p>
				<input type="date" id="startDate"> ~ <input type="date"
					id="endDate"> <input type="submit" value="조회"
					class="styled-button">
			</p>

			<ul style="font-size: 10px; text-align: center;">
				<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
				<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
				<li class="">취소/교환/반품 신청은 배송완료일 기준 30일까지 가능합니다.</li>
			</ul>
		</form>


		<c:forEach var="order" items="${orders}">
			<div class="card mt-2">
				<div class="card-body">
					<h5 class="card-title text-center mb-2">주문번호
						#${order.order_id}</h5>
					<fmt:formatDate value="${order.order_date}"
						pattern="yyyy년 MM월 dd일 aa hh시 mm분" var="orderDate" />
					<p class="card-text">주문시각: ${orderDate}</p>
					<p class="card-text">
						<c:choose>
							<c:when test="${order.status == 'ORDER'}">
              주문상태: <span style="color: #0a53be">주문완료! 곧 배송이
									시작됩니다.</span>
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
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>주문하신 상품</th>
								<th>주문가격</th>
								<th>주문수량</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="totalPrice" value="0" />
							<c:forEach var="orderItem" items="${order.orderItems}">
								<tr>
									<td>${orderItem.itemVO.name}</td>
									<fmt:formatNumber value="${orderItem.price}" type="number"
										var="price" />
									<td>${price}원</td>
									<td>${orderItem.quantity}</td>
								</tr>
								<c:set var="totalPrice"
									value="${totalPrice + (orderItem.price * orderItem.quantity)}" />
							</c:forEach>
							<tr>
								<td class="fw-bold">합계</td>
								<fmt:formatNumber value="${totalPrice}" type="number"
									var="totalPrice" />
								<td colspan="2" class="fw-bold">${totalPrice}원</td>
							</tr>
						</tbody>
					</table>
					<a href="/user/orders/${order.order_id}"
						class="btn btn-outline-secondary">주문상세</a>
					<c:if test="${order.status == 'ORDER'}">
						<button class="btn btn-danger">주문취소</button>
					</c:if>
					<c:if test="${order.status == 'DELIVERY'}">
						<button class="btn btn-primary" onclick="confirm('구매 확정 하시겠습니까?')">구매확정</button>
					</c:if>
				</div>
			</div>
		</c:forEach>

	</section>
	<jsp:include page="../include/footer.jsp" />
</body>
<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>
