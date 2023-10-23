<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- jQuery CDN -->
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>

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
    </style>
    <body>
    <!-- 네비게이션(nav.html) 로드 -->
    <jsp:include page="include/nav.jsp" />
    <!-- 배너(header.html) 로드 -->
    <jsp:include page="include/header.jsp" />
        <!-- 매인 섹션 -->
        <section class="py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="p-2 text-center">
                            <h2>장바구니</h2>
                        </div>
                        <!-- 총 가격 -->
                        <c:set var="totalPrice" value="0" />
                        <c:forEach items="${cartItems}" var="item">
                            <c:set var="totalPrice" value="${totalPrice + (item.price * item.order_quantity)}" />
                        </c:forEach>
                        
                        <c:forEach items="${cartItems}" var="item">
                        <!-- 아이템 -->
                        <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                            <div class="mr-1"><img class="rounded" src="/itemimages/${item.image_path}" width="70"></div>
                            <div class="d-flex flex-column align-items-start product-details w-25">
                                <a href="item/${item.item_id}" class="text-decoration-none fw-bold text-black">
                                  ${item.name}
                                </a>
                            </div>
                            <!-- 주문 수량 -->
                            <div class="d-flex flex-row justify-content-center w-25" id="itemQuantity">
                                    <i class="bi bi-dash-square-fill fs-4 mt-2 decrementQuantity"></i>
                                <h5 class="mt-1 mx-auto" id="quantity" data-item-id="${item.item_id}">
                                    ${item.order_quantity}
                                </h5>
                                    <i class="bi bi-plus-square-fill fs-4 mt-2 incrementQuantity"></i>
                            </div>
                            
                            <!-- 아이템 가격 * 주문수량 -->
                            <div class="w-25 text-end" id="itemPrice">
                                <h5 data-item-id="${item.item_id}" data-item-id-price="${item.price}">
                                    <fmt:formatNumber maxFractionDigits="3" type="number" value="${item.price * item.order_quantity}" />원
                                </h5>
                            </div>
                            <!-- 삭제 버튼 -->
                            <div class="d-flex align-items-center" onclick="deleteItem(${item.item_id})">
                                <i class="bi bi-trash fs-5"></i>
                            </div>
                        </div>
                        </c:forEach>
                        <hr class="my-3">

                        <!-- 할인 코드 입력 부분 -->
                        <div class="d-flex align-items-center my-3">
                            <input type="text" class="form-control" placeholder="할인코드/쿠폰 입력">
                            <button class="btn btn-secondary w-25">적용</button>
                        </div>
                        
                        <!-- 총 금액 -->
                        <div class="text-end fw-bolder">
                            <span id="totalP">
                                합계: <fmt:formatNumber maxFractionDigits="3" type="number" value="${totalPrice}" />원
                            </span> <br>
                            <span class="text-black-50">할인: 0원</span> <br><br>

                            <span id="calcTotalP">
                                총 가격: <fmt:formatNumber maxFractionDigits="3" type="number" value="${totalPrice}" />원
                            </span>
                        </div>
                        
                        <!-- 결제처리 폼 -->
                        <div class="d-grid my-5">
                            <a href="/order/${cart_id}" class="btn btn-outline-secondary btn-lg" >결제하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- 푸터 (footer.html) -->
        <jsp:include page="include/footer.jsp" />
    </body>
    
    <!-- 주문수량 증감처리 스크립트 -->
    <script>
        //카트번호
        var cart_id = '${cart_id}';
        
        $(document).ready(function(){
            //장바구니 수량증가 스크립트
           $(".incrementQuantity").click(function(){
               //siblings() -> 형제요소찾기
                var quantityElement = $(this).siblings("#quantity");
                var quantity = quantityElement.text();
                var itemId = quantityElement.data("item-id"); //아이템ID
                quantity++;
               
                quantityElement.text(quantity);
                updateQuantity(itemId, quantity);
           });
           
           
           //장바구니 수량감소 스크립트
            $(".decrementQuantity").click(function(){
                var quantityElement = $(this).siblings("#quantity");
                var quantity = quantityElement.text();
                var itemId = quantityElement.data("item-id"); //아이템ID
                
                if(quantity > 1) quantity--;
                
                quantityElement.text(quantity);
                updateQuantity(itemId, quantity);
            });
        });
        
        //수량이 변경된 아이템 DB에 업데이트
        function updateQuantity(itemId, quantity){
            $.ajax({
                url: "/cart/modifyQuantity",
                type: "PATCH",
                data: {
                    "cart_id" : cart_id,
                    "item_id" : itemId,
                    "order_quantity" : quantity
                },
                //아이템수량 변경 성공시 data에 변경된 수량이 담겨옴!
                success: function(data){
                    var itemPriceResult = $("#itemPrice h5[data-item-id='" + itemId + "']");
                    
                    //해당 아이템의 가격
                    var itemPrice = itemPriceResult.data("item-id-price");
                    
                    //총가격 = 아이템가격 * 수량
                    var totalPrice = itemPrice * data;
                    //총가격을 세자릿 수 단위로 콤마
                    itemPriceResult.text(totalPrice.toLocaleString() + "원");
                    
                    updateTotalPrice();
                },
                error: function(data){
                    alert('수량 변경 중 오류가 발생했습니다!');
                }
            });
        }
        
        //합계, 총 가격 새로고침
        function updateTotalPrice(){
            $.ajax({
                url: "/cart/totalPrice",
                type: "GET",
                data: {
                    "cart_id" : cart_id
                },
                success: function(data){
                    $("#totalP").text("합계: " + data.toLocaleString() + "원");
                    $("#calcTotalP").text("총 가격: " + data.toLocaleString() + "원");
                },
                error: function(data){
                    alert('총 가격 새로고침 중 오류가 발생했습니다!');
                }
            });
        }
        
        function deleteItem(itemId){
            if(!confirm("정말 삭제하시겠습니까?")) return;
            
            $.ajax({
                url: "/cart/delete",
                type: "DELETE",
                data: {
                    "cart_id" : cart_id,
                    "item_id" : itemId
                },
                success: function(data){
                    alert('삭제되었습니다!');
                    location.reload();
                },
                error: function(data){
                    alert('삭제 중 오류가 발생했습니다!');
                }
            });
        }
    </script>

    <!-- Bootstrap core JS-->
    <script src="/js/bootstrap.bundle.js"></script>
    
</html>
