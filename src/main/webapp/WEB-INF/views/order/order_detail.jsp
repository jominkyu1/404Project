<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title></title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  
  <title>404 Store</title>
  <!--부트스트랩 아이콘 CSS
      https://icons.getbootstrap.com/ 이곳에서 아이콘 확인! 클래스명에 아이콘 적으면됨!
  -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- font awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
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
    body{margin-top:20px;
        background-color:#eee;
    }

    .card {
        box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
    }
    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0,0,0,.125);
        border-radius: 1rem;
    }
</style>
<body>
<!-- 네비게이션(nav.html) 로드 -->
<jsp:include page="../include/nav.jsp" />
<!-- 배너(header.html) 로드 -->
<jsp:include page="../include/header.jsp" />
<section class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <div class="invoice-title">
              <h4 class="float-end font-size-15">
                주문번호 #1
                <span class="badge bg-success font-size-12 ms-2">
                결제완료
                </span>
              </h4>
              <div class="mb-4">
                <h2 class="mb-1 text-muted">주문정보</h2>
              </div>
              <div class="text-muted">
                <h5 class="font-size-16 mb-3 fw-bold">주문자</h5>
                <p>${order.user.username}</p>
                <p class="mb-1">${order.user.userphone}</p>
                <p>${order.user.email}</p>
              </div>
            </div>
            
            <hr class="my-4">
            
            <div class="row">
              <div class="col-sm-6">
                <div class="text-muted">
                  <h5 class="font-size-16 mb-3 fw-bold">배송지 정보</h5>
                  <p class="mb-1">${order.user.address1} ( ${order.user.address2} )</p>
                  <p class="mb-1">${order.user.address_detail}</p>
                </div>
              </div>
              
            </div>
            <!-- end row -->
            <hr>
            <div class="py-2 mt-2">
              <h5 class="font-size-15">주문 상세정보</h5>
              
              <div class="table-responsive">
                <table class="table align-middle table-nowrap table-centered mb-0 table-striped table-secondary">
                  <thead>
                  <tr >
                    <th style="width: 70px;">#</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th class="text-end" style="width: 120px;">합계</th>
                  </tr>
                  </thead><!-- end thead -->
                  <tbody>
                  
                  <c:set var="totalPrice" value="0"/>
                  <!-- for each -->
                  <c:forEach var="orderItem" items="${order.orderItems}" varStatus="status">
                    <c:set var="orderItemTotal" value="0"/>
                  <tr>
                    <th scope="row">${status.count}</th>
                    <td>
                        <h5 class="text-truncate font-size-14 mb-1">${orderItem.itemVO.name}</h5>
                    </td>
                    <fmt:formatNumber value="${orderItem.price}" type="number" var="price"/>
                    <td>${price}원</td>
                    <td>${orderItem.quantity}</td>
                    
                    <c:set var="orderItemTotal" value="${orderItemTotal + (orderItem.price * orderItem.quantity)}"/>
                    <c:set var="totalPrice" value="${totalPrice + orderItemTotal}"/>
                    
                    <fmt:formatNumber value="${orderItemTotal}" type="number" var="orderItemTotal"/>
                    <td class="text-end">${orderItemTotal}원</td>
                  </tr>
                  <!-- for each -->
                  </c:forEach>
                  <tr>
                    <th scope="row" colspan="4" class="text-end">총 가격 :</th>
                    <fmt:formatNumber value="${totalPrice}" type="number" var="totalPrice" />
                    <td class="text-end">${totalPrice}원</td>
                  </tr>
                  <!-- end tr -->
                  <tr>
                    <th scope="row" colspan="4" class="border-0 text-end">
                      할인금액 :</th>
                    <td class="border-0 text-end">- 0원</td>
                  </tr>
                  <!-- end tr -->
                  <tr>
                    <th scope="row" colspan="4" class="border-0 text-end">
                      배송비 :</th>
                    <td class="border-0 text-end">0원</td>
                  </tr>
                  <!-- end tr -->
                  <tr>
                    <th scope="row" colspan="4" class="border-0 text-end">합계</th>
                    <td class="border-0 text-end fw-bold">${totalPrice}원</td>
                  </tr>
                  <!-- end tr -->
                  </tbody><!-- end tbody -->
                </table><!-- end table -->
              </div><!-- end table responsive -->
              <div class="d-print-none mt-4">
                <div class="float-end">
                  <a href="/user/orders" class="btn btn-secondary">목록으로</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div><!-- end col -->
    </div>
  </div>
</section>
<jsp:include page="../include/footer.jsp" />
</body>
<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>