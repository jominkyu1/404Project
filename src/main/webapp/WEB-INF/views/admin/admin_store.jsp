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
            <!-- 상품명, 상품개수, 상품가격, 등록일자-->
            <div class="table-responsive">
              <table class="table table-striped-columns
              table-hover	
              table-bordered
              table-light
              align-middle">
                <thead class="table-light">
                  <tr>
                    <th>상품명</th>
                    <th>상품가격</th>
                    <th>남은개수</th>
                    <th>등록일자</th>
                    <th>카테고리</th>
                    <th>수정</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${itemlist}" var="item">
                    <tr class="table-light">
                      <td>${item.name}</td>
                      <td>${item.price}</td>
                      <td>${item.stockQuantity}</td>
                      <td>${item.regdate}</td>
                      <td>${item.category}</td>
                      <td><a href="/admin/item/${item.item_id}/edit" class="btn btn-outline-dark btn-sm">수정</a></td>
                    </tr>
                  </c:forEach>
                  </tbody>
                  <tfooter>
                    <a href="/admin/store/write" class="btn btn-dark my-2">제품등록</a>
                    <select class="form-select-sm" id="category"
                            onchange="updateCategory(this)">
                      <option value="ALL">전체</option>
                      <option value="FRUITS">과일</option>
                      <option value="ELECTRONICS">전자제품</option>
                    </select>
                  </tfooter>
              </table>
              
              <!-- 페이징 -->
              <jsp:include page="../paging/paging.jsp"/>
              
            </div>
            
        </div>
    </section>
    <!-- 푸터 (footer.html) -->
    <jsp:include page="../include/footer.jsp" />
    </body>
    <script>
      $(document).ready(function(){
          if(${param.category != null}){
          $('#category').val('${param.category}');
          }
      })
      
      function updateCategory(selectElement){
        var selectedValue = selectElement.value;
        location.href = "/admin/store?category="+selectedValue;
      }
    </script>
    <!-- Bootstrap core JS-->
    <script src="/js/bootstrap.bundle.js"></script>
</html>
