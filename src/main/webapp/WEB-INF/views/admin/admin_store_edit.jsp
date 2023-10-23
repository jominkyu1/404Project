<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        function storeEdit_check(){
            if($.trim($("#name").val()) == ""){
                alert("상품명을 입력하세요!");
                $("#name").val("").focus();
                return false;
            }

            if($.trim($("#description").val())==""){
                alert("상품설명을 입력하세요!");
                $("#description").val("").focus();
                return false;
            }

            if($.trim($("#price").val())==""){
                alert("상품가격을 입력하세요!");
                $("#price").val("").focus();
                return false;
            }
            if($.trim($("#stockQuantity").val())==""){
                alert("상품재고를 입력하세요!");
                $("#stockQuantity").val("").focus();
                return false;
            }
        }
    </script>
</head>
<body>
<!-- 네비게이션 로드 -->
<jsp:include page="../include/nav.jsp" />

<!-- 매인 섹션 -->
<section class="row mx-auto">
    <!-- 어드민 네비게이션 로드 -->
    <jsp:include page="../include/admin_nav.jsp" />
    <div class="col p-3 bg-body-tertiary">
        <h2 class="lead text-center fw-bold">특가스토어</h2><hr>

        <form method="post" onsubmit="return storeEdit_check();">

            <div class="mb-3">
                <label for="name" class="form-label">상품명</label>
                <input type="text" id="name" name="name" class="form-control" value="${item.name}" />
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">상품설명</label>
                <textarea name="description" id="description" class="form-control" rows="3" >${item.description}</textarea>
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">상품가격</label>
                <input type="number" id="price" name="price" class="form-control" value="${item.price}"/>
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">상품재고</label>
                <input type="number" id="stockQuantity" name="stockQuantity" class="form-control" value="${item.stockQuantity}"/>
            </div>



            <button type="submit" class="btn btn-outline-secondary">등록</button>
            <a href="/admin/store" class="btn btn-outline-secondary">목록으로</a>


        </form>

    </div>
</section>
<!-- 푸터 (footer.html) -->
<jsp:include page="../include/footer.jsp" />
</body>

<script src="/js/bootstrap.bundle.js"></script>
</html>