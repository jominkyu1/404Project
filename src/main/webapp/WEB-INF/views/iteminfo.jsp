<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>404 Store</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
  </head>
  <style>
    .carousel-inner {
      width: 80%;
      height: 35vh;
    }
    .carousel-item,
    .carousel-item img {
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
    <c:if test="${empty item}">
      <script>
        alert("상품을 확인할 수 없습니다.");
        location.href = "/specialstore";
      </script>
    </c:if>
    <section class="py-5">
      <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
          <!-- 이미지 -->
          <div class="col-md-6">
            <img
              class="card-img-top mb-5 mb-md-0"
              src="/itemimages/${item.image_path}"
              alt="..."
            />
          </div>

          <div class="col-md-6">
            <h1 class="display-5 fw-bolder text-center">${item.name}</h1>
            <div class="fs-5 mb-5">
              <!-- <span class="text-decoration-line-through">500,000원</span> -->
              <span>
                가격: <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" var="price"/>
                ${price}원
              </span> <br> <hr>
              <span>재고:
                <c:if test="${item.stockQuantity > 0}">
                  <b>${item.stockQuantity}</b>개
                </c:if>
                <c:if test="${item.stockQuantity == 0}">
                  <b>품절</b>
                </c:if>
              </span>
            </div>
            
            <p class="lead">
              ${item.description}
            </p>
            <form method="get" action="/cart/add/${item.item_id}" style="white-space: nowrap;">
            <div class="d-flex">
              <!--  -->
              <input
                class="form-control text-center me-3"
                id="quantity"
                name="quantity"
                type="num"
                value="1"
                style="max-width: 3rem"
              />
              <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                <i class="bi-cart-fill me-1"></i>
                장바구니
              </button>
              <!-- -->


              <a class="btn btn-outline-dark mx-2 " href="/specialstore">
                <i class="bi-arrow-return-right me-1"></i>
                목록으로
              </a>




            <div class="border border-5" style="flex-direction: row; ">

              <button
                type="button"
                class="btn btn-outline-dark ms-auto"
                data-bs-toggle="modal"
                data-bs-target="#productInquiryModal"
                <sec:authorize access="isAnonymous()">
                  onclick="alert('로그인이 필요합니다.'); location.href='/login';"
                </sec:authorize>
              >
                <i class="bi-question-circle me-1"></i>
                상품 문의
              </button>




              <!--상품 리뷰 버튼 -->


              <button
                      type="button"
                      class="btn btn-outline-dark ms-auto"
                      data-bs-toggle="modal"
                      data-bs-target="#productReviewInquiryModal"
                      <sec:authorize access="isAnonymous()">
                        onclick="alert('로그인이 필요합니다.'); location.href='/login';"
                      </sec:authorize>
              >
                <i class="bi-exclamation-circle-fill me-1"></i>
                상품 리뷰
              </button>

            </div>



              <!-- -->

            </div>
            </form>
          </div>
        </div>
        <hr class="my-5">
        <!-- 상품 문의-->
        <div>
          <table class="table" style="white-space: nowrap;">
            <caption class="caption-top mb-3 text-center"><b>상품문의: ${qnaCount}개</b></caption>
            <thead class="table-light ">
              <tr>
                <th class="col-1">문의일자</th>
                <th class="col-1" width="10%">아이디</th>
                <th class="col-9">문의내용</th>
                <th class="col-1" width="5%">답변</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${qnaList}" var="qna">
                <tr>
                  <td>
                    <fmt:formatDate value="${qna.regdate}" pattern="yy-MM-dd" />
                  </td>
                  <td>${qna.userVO.username}</td>
                  <td>
                    ${qna.contents}

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

        <!--상품 리뷰-->


        <div>
          <table class="table" style="white-space: nowrap;">
            <caption class="caption-top mb-3 text-center"><b>상품리뷰: ${reviewCount}개</b></caption>
            <thead class="table-light ">
            <tr>
              <th class="col-1">리뷰일자</th>
              <th class="col-1" width="10%">아이디</th>
              <th class="col-9">리뷰내용</th>
<%--              <th class="col-1" width="5%">답변</th>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${reviewList}" var="review">
              <tr>
                <td>
                  <fmt:formatDate value="${review.regdate}" pattern="yy-MM-dd" />
                </td>
                <td>${review.userVO.username}</td>
                <td>
                    ${review.contents}

<%--                  <button--%>
<%--                          class="btn btn-outline-secondary btn-sm dropdown-toggle float-end"--%>
<%--                          type="button"--%>
<%--                          data-bs-toggle="collapse"--%>
<%--                          data-bs-target="#reply${review.review_id}"--%>
<%--                          aria-expanded="false"--%>
<%--                          <c:if test="${review.review_id == 0}">--%>
<%--                            disabled="disabled"--%>
<%--                          </c:if>--%>
<%--                  >--%>
<%--                    답변보기--%>
<%--                  </button>--%>
<%--                  <div class="collapse" id="reply${review.review_id}">--%>
<%--                    <hr>--%>
<%--                    <p class="m-auto fw-bolder" >--%>
<%--                        ${review.answered_text}--%>
<%--                    </p>--%>
<%--                  </div>--%>
                </td>
<%--                <c:choose>--%>
<%--                  <c:when test="${review.answered == 0}">--%>
<%--                    <td align="center" style="color: red">X</td>--%>
<%--                  </c:when>--%>
<%--                  <c:otherwise>--%>
<%--                    <td align="center" style="color: green">O</td>--%>
<%--                  </c:otherwise>--%>
<%--                </c:choose>--%>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>



      </div>


    <!--</section>-->
    <!-- 푸터 (footer.html) -->
    <jsp:include page="include/footer.jsp" />
  <!--</body>-->
 <sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.user" var="user" />
  <!-- 모달 창 -->
  <div
    class="modal fade"
    id="productInquiryModal"
    tabindex="-1"
    aria-labelledby="productInquiryModalLabel"
    aria-hidden="true"
  >
    <form method="post" action="/item/${item.item_id}/applyQna">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="productInquiryModalLabel">상품 문의</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="닫기"
          ></button>
        </div>
        
        <div class="modal-body">
          <!-- 상품 문의 폼 -->
            <div class="mb-3">
              <label for="username" class="form-label">아이디</label>
              <input
                type="text"
                class="form-control bg-dark-subtle"
                id="username"
                name="username"
                value="${user.username}"
                readonly
              />
            </div>
            <div class="mb-3">
              <label for="contents" class="form-label">문의 내용</label>
              <textarea
                class="form-control"
                id="contents"
                name="contents"
                rows="4"
                required
              ></textarea>
            </div>
          
        </div>




        <div class="modal-footer">
          <button type="submit" class="btn btn-outline-secondary">문의하기</button>
          <button
            type="button"
            class="btn btn-secondary"
            data-bs-dismiss="modal"
          >
            닫기
          </button>
        </div>


      </div>
    </div>
    </form>
  </div>
 </sec:authorize>



   <hr class="my-5">
   <!--상품리뷰 -->


   </section>
   <!-- 푸터 (footer.html) -->
   <jsp:include page="include/footer.jsp" />
   </body>
   <sec:authorize access="isAuthenticated()">
     <sec:authentication property="principal.user" var="reviewUser" />
     <!-- 모달 창 -->
     <div
             class="modal fade"
             id="productReviewInquiryModal"
             tabindex="-1"
             aria-labelledby="productReviewInquiryModalLabel"
             aria-hidden="true"
     >
       <form method="post" action="/item/${item.item_id}/applyReview">
         <div class="modal-dialog">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title" id="productReviewInquiryModalLabel">상품 리뷰</h5>
               <button
                       type="button"
                       class="btn-close"
                       data-bs-dismiss="modal"
                       aria-label="닫기"
               ></button>
             </div>

             <div class="modal-body">
               <!-- 상품 리뷰 폼 -->
               <div class="mb-3">
                 <label for="reviewUsername" class="form-label">아이디</label>
                 <input
                         type="text"
                         class="form-control bg-dark-subtle"
                         id="reviewUsername"
                         name="reviewUsername"
                         value="${user.username}"
                         readonly
                 />
               </div>
               <div class="mb-3">
                 <label for="reviewContents" class="form-label">리뷰 내용</label>
                 <textarea
                         class="form-control"
                         id="reviewContents"
                         name="reviewContents"
                         rows="4"
                         required
                 ></textarea>
               </div>

             </div>




             <div class="modal-footer">
               <button type="submit" class="btn btn-outline-secondary">상품리뷰 쓰기</button>
               <button
                       type="button"
                       class="btn btn-secondary"
                       data-bs-dismiss="modal"
               >
                 닫기
               </button>
             </div>


           </div>
         </div>
       </form>

    <!--상품리뷰 끝 -->






  </div>
 </sec:authorize>
  <!-- Bootstrap core JS-->
  <script src="/js/bootstrap.bundle.js"></script>
</html>


