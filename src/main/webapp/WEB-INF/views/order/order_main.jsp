<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  <!-- 카카오페이 결제를 위한 아임포트 라이브러리 -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
    body{
        background:#eee;
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

    .card-body {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        padding: 1.5rem 1.5rem;
    }
</style>
<body>
<!-- 네비게이션(nav.html) 로드 -->
<jsp:include page="../include/nav.jsp" />
<!-- 배너(header.html) 로드 -->
<jsp:include page="../include/header.jsp" />
<section class="py-5">
  <div class="container">
    <h1 class="h3 mb-5">상품결제</h1>
    <div class="row">
      <!-- 좌측 창 -->
      <div class="col-lg-9">
        <div class="accordion" id="accordionPayment">
          
          <!-- 카카오페이 -->
          <div class="accordion-item mb-3 border">
            <h2 class="h5 px-4 py-3 accordion-header d-flex justify-content-between align-items-center">
              <div class="form-check w-100 collapsed" data-bs-toggle="collapse" data-bs-target="#collapsePP" aria-expanded="false">
                <input class="form-check-input" type="radio" name="payment" id="payment2" checked="true">
                <label class="form-check-label pt-1" for="payment2">
                  카카오페이
                </label>
              </div>
              <span>
                <img src="/images/order/payment_kakao.png" alt="kakaopay">
              </span>
            </h2>
            <div id="collapsePP" class="accordion-collapse collapse show" data-bs-parent="#accordionPayment" style="">
              <div class="accordion-body">
                <div class="px-2 col-lg-6 mb-3 row">
                  <label for="coupon" class="form-label">할인쿠폰</label>
                  <input id="coupon" type="email" class="form-control">
                  <button class="btn btn-outline-secondary mt-2">적용</button>
                </div>
              </div>
            </div>
          </div>
          
          
          <!-- 마일리지결제 -->
          <div class="accordion-item mb-3">
            <h2 class="h5 px-4 py-3 accordion-header d-flex justify-content-between align-items-center">
              <div class="form-check w-100 collapsed" data-bs-toggle="collapse" data-bs-target="#collapseCC" aria-expanded="false">
                <input class="form-check-input" type="radio" name="payment" id="payment1">
                <label class="form-check-label pt-1" for="payment1">
                  카드 결제
                </label>
              </div>
              <span>
                <svg width="34" height="25" xmlns="http://www.w3.org/2000/svg">
                  <g fill-rule="nonzero" fill="#333840">
                    <path d="M29.418 2.083c1.16 0 2.101.933 2.101 2.084v16.666c0 1.15-.94 2.084-2.1 2.084H4.202A2.092 2.092 0 0 1 2.1 20.833V4.167c0-1.15.941-2.084 2.102-2.084h25.215ZM4.203 0C1.882 0 0 1.865 0 4.167v16.666C0 23.135 1.882 25 4.203 25h25.215c2.321 0 4.203-1.865 4.203-4.167V4.167C33.62 1.865 31.739 0 29.418 0H4.203Z"></path>
                    <path d="M4.203 7.292c0-.576.47-1.042 1.05-1.042h4.203c.58 0 1.05.466 1.05 1.042v2.083c0 .575-.47 1.042-1.05 1.042H5.253c-.58 0-1.05-.467-1.05-1.042V7.292Zm0 6.25c0-.576.47-1.042 1.05-1.042H15.76c.58 0 1.05.466 1.05 1.042 0 .575-.47 1.041-1.05 1.041H5.253c-.58 0-1.05-.466-1.05-1.041Zm0 4.166c0-.575.47-1.041 1.05-1.041h2.102c.58 0 1.05.466 1.05 1.041 0 .576-.47 1.042-1.05 1.042H5.253c-.58 0-1.05-.466-1.05-1.042Zm6.303 0c0-.575.47-1.041 1.051-1.041h2.101c.58 0 1.051.466 1.051 1.041 0 .576-.47 1.042-1.05 1.042h-2.102c-.58 0-1.05-.466-1.05-1.042Zm6.304 0c0-.575.47-1.041 1.051-1.041h2.101c.58 0 1.05.466 1.05 1.041 0 .576-.47 1.042-1.05 1.042h-2.101c-.58 0-1.05-.466-1.05-1.042Zm6.304 0c0-.575.47-1.041 1.05-1.041h2.102c.58 0 1.05.466 1.05 1.041 0 .576-.47 1.042-1.05 1.042h-2.101c-.58 0-1.05-.466-1.05-1.042Z"></path>
                  </g>
                </svg>
              </span>
            </h2>
            <div id="collapseCC" class="accordion-collapse collapse" data-bs-parent="#accordionPayment" style="">
              <div class="accordion-body">
                <div class="mb-3">
                  <label class="form-label">카드번호</label>
                  <input type="text" class="form-control" placeholder="">
                </div>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="mb-3">
                      <label class="form-label">카드별칭</label>
                      <input type="text" class="form-control" placeholder="">
                    </div>
                  </div>
                  <div class="col-lg-3">
                    <div class="mb-3">
                      <label class="form-label">만료일자</label>
                      <input type="text" class="form-control" placeholder="MM/YY">
                    </div>
                  </div>
                  <div class="col-lg-3">
                    <div class="mb-3">
                      <label class="form-label">CVV</label>
                      <input type="password" class="form-control">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 우측 결제정보 -->
      <div class="col-lg-3">
        <div class="card position-sticky top-0">
          <div class="p-3 bg-light bg-opacity-10">
            <h6 class="card-title mb-3">주문정보</h6>
            <div class="d-flex justify-content-between mb-1 small">
              <span>주문금액</span>
              <span>
                <fmt:formatNumber maxFractionDigits="3" type="number" value="${totalPrice}" />원
              </span>
            </div>
            <div class="d-flex justify-content-between mb-1 small">
              <span>배송비</span> <span>0원</span>
            </div>
            <div class="d-flex justify-content-between mb-1 small">
              <span>할인</span> <span class="text-danger">-원</span>
            </div>
            <hr>
            <div class="d-flex justify-content-between mb-4 small">
              <span>총 결제금액</span>
              <strong class="text-dark">
                <fmt:formatNumber maxFractionDigits="3" type="number" value="${totalPrice}" />원
              </strong>
            </div>
            <div class="form-check mb-1 small">
              <input class="form-check-input" type="checkbox" value="" id="tnc">
              <label class="form-check-label" for="tnc">
                <a href="#">구매조건 확인</a> 및 <a href="#">결제대행 서비스 약관</a>에 동의합니다.
              </label>
            </div>
            <button class="btn btn-secondary w-100 mt-4" id="proc_payment" disabled="disabled">주문하기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<jsp:include page="../include/footer.jsp" />
</body>
<script>
    //약관 동의시 주문버튼 활성화
  $('#tnc').click(function(){
      if($('#tnc').is(':checked') === true){
          $('#proc_payment').prop('disabled', false);
      } else {
          $('#proc_payment').prop('disabled', true);
      }
  })
    
    //카카오페이 결제
  $('#proc_payment').click(function(){
      var IMP = window.IMP;
      IMP.init('imp48012763');
      var totalPrice = ${totalPrice};
      
      IMP.request_pay({
          pg: 'kakaopay',
          pay_method: 'card',
          //우리서버에서 사용할 주문식별번호
          merchant_uid: 'merchant' + new Date().getTime(),
          
          name: '404Store 상품결제',
          amount: totalPrice, //총결제금액
          buyer_email: 'jominkyu@gmail.com',
          buyer_name: '조민규',
          buyer_tel: '010-3678-6474',
          buyer_addr: '서울특별시 강남구 삼성동',
          buy_postcode: '123-456'
          }, function (rsp){
            if(rsp.success){
                alert('주문이 완료되었습니다.');
                //결제완료 후 주문정보를 DB에 저장하고, 주문완료 페이지로 이동
                
                if(${singleItem}){ //단품결제일경우

                    $.ajax(
                        {
                            url: '/order',
                            type: 'post',
                            data: {
                                merchant_uid: rsp.merchant_uid,
                                orderQuantity: ${orderQuantity},
                                item_id: ${itemVO.item_id}
                            }
                        }
                    ).done(function(msg){
                        if(msg == 'SUCCESS'){
                            location.href = '/user/orders';
                        } else {
                            alert('주문에 실패하였습니다.');
                        }
                    }).fail(function(){
                        alert('결제에 실패하였습니다.');
                    });
                    
                } else { //장바구니결제일경우

                    $.ajax(
                        {
                            url: '/order/${cart_id}',
                            type: 'post',
                            data: {
                                imp_uid: rsp.imp_uid,
                                merchant_uid: rsp.merchant_uid,
                                paid_amount: rsp.paid_amount,
                                apply_num: rsp.apply_num,
                                buyer_email: rsp.buyer_email,
                                buyer_name: rsp.buyer_name,
                                buyer_tel: rsp.buyer_tel,
                                buyer_addr: rsp.buyer_addr,
                                buyer_postcode: rsp.buyer_postcode,
                                total_price: totalPrice
                            }
                        }
                    ).done(function(msg){
                        if(msg == 'SUCCESS'){
                            location.href = '/user/orders';
                        } else {
                            alert('주문에 실패하였습니다.');
                        }
                    }).fail(function(){
                        alert('결제에 실패하였습니다.');
                    });
                }
            } else {
                alert(rsp.error_msg);
            }
          }
          
          )
  })
</script>

<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>