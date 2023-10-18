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
        <h2 class="lead text-center fw-bold"> 상품문의 </h2><hr>


        <div>
            <table class="table">
                <caption class="caption-top mb-3 text-center"><b>상품문의: ${qnaCount}개</b></caption>
                <thead class="table-light ">
                <tr>
                    <th class="col-1">문의일자</th>
                    <th class="col-1" width="10%">아이디</th>
                    <th class="col-1">상품명</th>
                    <th class="col-9">문의내용</th>
                    <th class="col-1" width="5%">답변</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${item}" var="qna">
                    <tr>
                        <td>
                            <fmt:formatDate value="${qna.regdate}" pattern="yy-MM-dd" />
                        </td>
                        <td>${qna.userVO.username}</td>
                        <td>${qna.itemVO.name}</td>
                        <td class="overflow-hidden text-nowrap">



                            <a href="#" data-bs-toggle="modal" data-bs-target="#answerModal" data-qna-id="${qna.item_qna_id}">
                                    ${qna.contents}
                            </a>


                            <button
                                    class="btn btn-outline-secondary btn-sm dropdown-toggle float-end"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#reply${qna.item_qna_id}"
                                    aria-expanded="false"
                                    <c:if test="${qna.answered == 0}">
                                        disabled="disabled"
                                    </c:if>
                            >
                                답변보기
                            </button>
                            <div class="collapse" id="reply${qna.item_qna_id}">
                                <hr>
                                <p class="m-auto fw-bolder" >
                                        ${qna.answered_text}
                                </p>
                            </div>
                        </td>
                        <c:choose>
                            <c:when test="${qna.answered == 0}">
                                <td align="center" style="color: red">X</td>
                            </c:when>
                            <c:otherwise>
                                <td align="center" style="color: green">O</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

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
