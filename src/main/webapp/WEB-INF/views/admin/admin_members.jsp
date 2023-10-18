<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h2 class="lead text-center fw-bold"> 회원관리 </h2><hr>
        <!--아이디 이름 휴대폰 가입일 권한 개인정보 가입현황(탈퇴, 활성)-->

        <caption class="caption-top mb-3 text-center"><b>회원수: ${memberCount}명</b></caption>

        <div class="table-responsive">
            <table class="table table-striped-columns
              table-hover
              table-bordered
              table-light
              align-middle">
                <thead class="table-light">
                <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>휴대폰</th>
                    <th>가입일</th>
                    <th>권한</th>
                    <th>개인정보</th>
                    <th>탈퇴현황</th>
                    <th>탈퇴시키기</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr class="table-light">
                        <td>${user.user_id}</td>
                        <td>${user.username}</td>
                        <td>${user.userphone}</td>
                        <td>${user.regdate}</td>
                        <td>${user.usergrade}</td>
                        <td>${user.address1}</td>
                        <td></td>
                        <td></td>

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

<%--페이징 즉 쪽나누기 추가 --%>
<div id="bList_paging">
    <%-- 검색전 페이징 --%>
    <c:if test="${(empty find_field) && (empty find_name)}">
        <c:if test="${page<=1}">
            [이전]&nbsp;
        </c:if>
        <c:if test="${page>1}">
            <a href="admin_bbs_list?page=${page-1}">[이전]</a>&nbsp;
        </c:if>

        <%--현재 쪽번호 출력--%>
        <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
            <c:if test="${a == page}">
                <%--현재 페이지가 선택되었다면--%>
                <${a}>
            </c:if>
            <c:if test="${a != page}">
                <%--현재 페이지가 선택되지 않았
다면 --%>
                <a href="admin_bbs_list?page=${a}">[${a}]</a>&nbsp;
            </c:if>
        </c:forEach>

        <c:if test="${page >= maxpage}">
            [다음]
        </c:if>
        <c:if test="${page<maxpage}">
            <a href="admin_bbs_list?page=${page+1}">[다음]</a>
        </c:if>
    </c:if>

    <%-- 검색후 페이징 --%>
    <c:if test="${(!empty find_field) || (!empty find_name)}">
        <c:if test="${page<=1}">
            [이전]&nbsp;
        </c:if>
        <c:if test="${page>1}">
            <a
                    href="admin_bbs_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
        </c:if>

        <%--현재 쪽번호 출력--%>
        <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
            <c:if test="${a == page}">
                <%--현재 페이지가 선택되었다면--%>
                <${a}>
            </c:if>
            <c:if test="${a != page}">
                <%--현재 페이지가 선택되지 않았
다면 --%>
                <a
                        href="admin_bbs_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
            </c:if>
        </c:forEach>

        <c:if test="${page >= maxpage}">
            [다음]
        </c:if>
        <c:if test="${page<maxpage}">
            <a
                    href="admin_bbs_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
        </c:if>
    </c:if>
</div>

<div id="bList_menu">
    <input type="button" value="글쓰기"
           onclick="location='admin_bbs_write?page=${page}';" />
    <c:if test="${(!empty find_field) &&
   (!empty find_name)}">
        <input type="button" value="전체목록"
               onclick="location='admin_bbs_list?page=${page}';" />
    </c:if>
</div>
<!-- 페이징 쪽수 나누기 END-->

<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>
