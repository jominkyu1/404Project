<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
        <!-- jQuery -->
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
    <jsp:include page="../include/nav.jsp" />
    
        <!-- 매인 섹션 -->
    <section class="row mx-auto">
        <!-- 어드민 네비게이션 로드 -->
        <jsp:include page="../include/admin_nav.jsp" />

        <div class="col p-3 bg-body-tertiary"> 
            <h2 class="lead text-center fw-bold">메인화면</h2><hr>
                <div class="table-responsive-sm">
                    <table class="table table-striped-columns
                    table-borderless
                    table-light
                    mx-auto">
                    <caption class="caption-top text-center fw-bold mb-3">회원현황</caption>
                        <thead class="text-center">
                            <tr>
                                <th>전체회원</th>
                                <th>일반회원</th>
                                <th>VIP회원</th>
                                <th>관리자</th>
                            </tr>
                            </thead>
                            <tbody class="table-group-divider text-center">
                                <tr class="table-light" >
                                    <td scope="row">${count.allUsers}</td>
                                    <td>${count.normalUsers}</td>
                                    <td>0</td>
                                    <td>${count.adminUsers}</td>
                                </tr>
                            </tbody>
                    </table>
                </div>
            
            <!-- 주문 현황 -->
            <table class="table table-striped text-center table-hover mb-2" style="table-layout: fixed;">
                <caption class="caption-top fw-bold text-center mb-3">
                    배송대기 주문: ${orders.size()}건
                </caption>
                <thead>
                <tr>
                    <th class="w-25">주문 번호</th>
                    <th class="w-25">상품명</th>
                    <th class="w-25">주문금액</th>
                    <th class="w-25">주문일자</th>
                    <th class="w-25">주문현황</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders}" var="order">
                    <tr>
                        <td>${order.order_id}</td>
                        <td>
                            ${order.orderItems[0].itemVO.name}
                            <c:set var="moreCount" value="${fn:length(order.orderItems) -1}" />
                            <c:if test="${moreCount > 0}">
                            외 ${moreCount}개
                            </c:if>
                        </td>
                        <!-- 주문 총 금액 -->
                        <c:set var="totalPrice" value="0" />
                        <c:forEach items="${order.orderItems}" var="orderItem">
                            <c:set var="totalPrice" value="${totalPrice + (orderItem.price * orderItem.quantity)}" />
                        </c:forEach>
                        <fmt:formatNumber value="${totalPrice}" type="number" var="totalPrice"/>
                        <td>${totalPrice}원</td>
                        <td>${order.order_date}</td>
                        <td>${order.status.value}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- 주문 현황 -->

            <hr>

            <table class="table table-striped text-center table-hover" style="table-layout: fixed;">
                <caption class="caption-top fw-bold text-center mb-3">
                    미답변 상품문의: ${notAnsweredQnaList.size()}건
                </caption>
                <thead>
                    <tr>
                        <th class="w-25">상품명</th>
                        <th class="w-75">문의내용</th>
                        <th class="w-25">아이디</th>
                        <th class="w-25">날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="doneLoop" value="false"/>
                    <c:forEach items="${notAnsweredQnaList}" var="qna" varStatus="status">
                        <c:if test="${status.index > 4}">
                            <c:set var="doneLoop" value="true"/>
                            <c:set var="qnaMore" value="true" />
                        </c:if>
                        <c:if test="${doneLoop == false}">
                        <tr>
                            <td>${qna.itemVO.name}</td>
                            <td class="overflow-hidden text-nowrap">
                                <a href="#" data-bs-toggle="modal" data-bs-target="#answerModal" data-qna-id="${qna.item_qna_id}">
                                    ${qna.contents}
                                </a>
                            </td>
                            <td class="overflow-hidden text-nowrap">${qna.userVO.username}</td>
                            <td class="overflow-hidden text-nowrap">
                                <fmt:formatDate value="${qna.regdate}" pattern="yyyy-MM-dd a hh:mm" var="qnaDate"/>
                                    ${qnaDate}
                            </td>
                        </tr>
                        </c:if>
                    </c:forEach>
                    <c:if test="${qnaMore == true}">
                        <tr>
                            <td colspan="4" class="overflow-hidden text-nowrap">
                                <a href="/admin/item" class="btn btn-outline-secondary">더보기</a>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            <table class="table table-striped text-center mx-auto table-hover" style="table-layout: fixed;">
                <caption class="caption-top fw-bold text-center mb-3">
                    미답변 Q&A: 0건
                </caption>
                <thead>
                    <tr>
                        <th class="w-75">제목</th>
                        <th class="w-25">이름</th>
                        <th class="w-25">날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="overflow-hidden text-nowrap">안녕하세요. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다.</td>
                        <td class="overflow-hidden text-nowrap">홍길동</td>
                        <td class="overflow-hidden text-nowrap">2023/09/03</td>
                    </tr>
                    <tr>
                        <td class="overflow-hidden text-nowrap">안녕하세요. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다.</td>
                        <td class="overflow-hidden text-nowrap">홍길동</td>
                        <td class="overflow-hidden text-nowrap">2023/09/03</td>
                    </tr>
                    <tr>
                        <td class="overflow-hidden text-nowrap">안녕하세요. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다. 상품문의 드립니다.</td>
                        <td class="overflow-hidden text-nowrap">홍길동</td>
                        <td class="overflow-hidden text-nowrap">2023/09/03</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- 푸터 (footer.html) -->
    <jsp:include page="../include/footer.jsp" />
    
    
    <!-- 미답변 상품문의 모달 -->
    <div class="modal fade" id="answerModal" tabindex="-1" aria-labelledby="answerModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="answerModalLabel">답변 작성</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    
                    <form method="post" action="/admin/answer?type=item">
                        <div class="mb-3">
                            <label for="answerText" class="form-label">답변 내용</label>
                            <textarea class="form-control" id="answerText" rows="6" name="answered_text"></textarea>
                            <!-- ItemQnaVO PK값 -->
                            <input type="hidden" id="selectedQnaId" name="item_qna_id" value="">
                            
                        </div>
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary" >답변 작성</button>
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>
    </body>
    <script>
        $(document).on('show.bs.modal', '#answerModal',function(event){
            var triggerElement = $(event.relatedTarget);
            var qnaId = triggerElement.data('qna-id');
            $('#selectedQnaId').val(qnaId);
            
            $('#answerText').focus();
        });
    </script>
    
    <!-- Bootstrap core JS-->
    <script src="/js/bootstrap.bundle.js"></script>
</html>
