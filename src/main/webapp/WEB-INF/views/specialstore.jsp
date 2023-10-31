<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>404 Store</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet" />
	<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
	function searchValid(){
		var searchInput = $('#searchInput').val().trim();
		if(searchInput === ""){
			alert("검색어를 입력해주세요!");
			$('#searchInput').focus();
			return false;
		}
	}
</script>
</head>
<style>
.carousel-inner {
	width: 80%;
	height: 35vh;
}

.carousel-item, .carousel-item img {
	width: 100%;
	height: 100%;
}
 .custom-btn {
        background-color: #007BFF; /* 배경색을 원하는 색상으로 변경 */
        color: #FFF; /* 텍스트 색상을 흰색으로 변경 */
        border: none; /* 외곽선 제거 */
        border-radius: 5px; /* 버튼 모서리를 둥글게 만듭니다 */
        padding: 10px 20px; /* 내부 여백 조정 */
    }
</style>
<body>
	<!-- 네비게이션(nav.html) 로드 -->
	<jsp:include page="include/nav.jsp" />
	<!-- 배너(header.html) 로드 -->
	<jsp:include page="include/header.jsp" />
	<!-- 매인 섹션 -->
	<section class="py-5">
		<div class="text-center">
			<h2 class="mb-3">404스토어만의 특별한 상품</h2>
			<!-- 제품 검색 폼 -->
			<form onsubmit="return searchValid()">
			<!-- 제품 카테고리-->
			<select class="form-select mb-4 mx-auto" name="category"
				style="width: 50vw">
				<option value="">모든 제품</option>
				<option value="FRUITS">과일</option>
				<option value="ELECTRONICS">전자제품</option>
			</select>
			
			<!-- 제품 검색 -->
			<span class="input-group mb-4 mx-auto" style="width: 50vw">
				<input name="search" id="searchInput" class="form-control" placeholder="제품 검색" />
				<button class="btn btn-outline-secondary" type="submit">
					<i class="bi bi-search"></i>
				</button>
			</span>
			</form>

			<!-- 카테고리별 버튼 추가 -->
			<div class="btn-group" role="group" aria-label="카테고리 필터">
				<button type="button" class="btn btn-outline-dark"
					onclick="location.href='/specialstore'">전체</button>
				<button type="button" class="btn btn-outline-dark"
					onclick="location.href='/specialstore?category=FRUITS'">과일</button>
				<button type="button" class="btn btn-outline-dark"
					onclick="location.href='/specialstore?category=ELECTRONICS'">전자제품</button>
			</div>
		</div>
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				
				<c:forEach items="${itemlist}" var="item">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Sale badge
                <div
                  class="badge bg-dark text-white position-absolute"
                  style="top: 0.5rem; right: 0.5rem">
                  세일
                </div>
                -->
							<!-- Product image-->
							<img class="card-img-top" src="/itemimages/${item.image_path}"
								alt="${item.name}" style="height: 200px; width: auto;" />

							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">
										<a href="/item/${item.item_id}" class="text-decoration-none">
											${item.name} </a>
									</h5>
									<!-- Product price-->
									<span class="fw-bolder"> <!-- 1,000,000원같이 쉼표를 넣어 표기함-->
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${item.price}" />원
									</span>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<form method="get" action="/cart/add/${item.item_id}">
										<input type="hidden" value="1" name="quantity">
										<input type="submit" class="btn btn-outline-dark mt-auto mb-1" value="장바구니">
									</form>
								</div>
								<div class="text-center">
									<form method="get" action="/order">
										<input type="hidden" name="item_id" value="${item.item_id}">
										<input type="hidden" name="orderQuantity" value="1">
										<input type="button" class="btn btn-secondary"
													 onclick="orderItem()" value="구매하기">
									</form>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 페이징 -->
			<div class="d-flex justify-content-center">
			<jsp:include page="paging/paging.jsp">
				<jsp:param name="paging" value="${paging}" />
				<jsp:param name="search" value="${search}" />
			</jsp:include>
			</div>
		</div>
	</section>
	<!-- 푸터 (footer.html) -->
	<jsp:include page="include/footer.jsp" />
</body>
<script>
	function orderItem(){
		var quantity = prompt("구매할 수량을 입력하세요", "1");
		//취소버튼을 눌렀을경우
		if(quantity === null){
			return;
		}
		
		var form = $(event.target).closest("form");
		form.find("input[name='orderQuantity']").val(quantity);
		form.submit();
	}
</script>
<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>
