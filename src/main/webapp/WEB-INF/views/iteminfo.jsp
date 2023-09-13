<%@ page contentType="text/html; charset=UTF-8" %>
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
    <section class="py-5">
      <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
          <!-- 더미 이미지 -->
          <div class="col-md-6">
            <img
              class="card-img-top mb-5 mb-md-0"
              src="https://placehold.it/600x700"
              alt="..."
            />
          </div>

          <div class="col-md-6">
            <div class="small mb-1">Samsung Galaxy Buds2</div>
            <h1 class="display-5 fw-bolder">갤럭시 버즈2</h1>
            <div class="fs-5 mb-5">
              <span class="text-decoration-line-through">500,000원</span>
              <span>190,000원</span>
            </div>

            <p class="lead">
              갤럭시 버즈2에 대한 설명입니다. 갤럭시 버즈2에 대한 설명입니다.
              갤럭시 버즈2에 대한 설명입니다. 갤럭시 버즈2에 대한 설명입니다.
              갤럭시 버즈2에 대한 설명입니다. 갤럭시 버즈2에 대한 설명입니다.
            </p>
            <div class="d-flex">
              <input
                class="form-control text-center me-3"
                id="inputQuantity"
                type="num"
                value="1"
                style="max-width: 3rem"
              />
              <button class="btn btn-outline-dark flex-shrink-0" type="button">
                <i class="bi-cart-fill me-1"></i>
                장바구니
              </button>
              <a class="btn btn-outline-dark mx-2" href="weeksale.html">
                <i class="bi-arrow-return-right me-1"></i>
                목록으로
              </a>
              <button
                class="btn btn-outline-dark ms-auto"
                data-bs-toggle="modal"
                data-bs-target="#productInquiryModal"
              >
                <i class="bi-question-circle me-1"></i>
                상품 문의
              </button>
            </div>
          </div>
        </div>
        <hr class="my-5">
        <!-- 상품 문의-->
        <div>
          <table class="table">
            <caption class="caption-top mb-3"><b>상품문의: 2개</b></caption>
            <thead class="table-light ">
              <tr>
                <th scope="col" width="10%">이름</th>
                <th scope="col">문의내용</th>
                <th scope="col" width="5%">답변</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>홍길동</td>
                <td>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Consectetur, dolorum laudantium, eveniet reiciendis autem
                  eligendi iure veniam deleniti earum nihil rerum aliquam
                  cupiditate ipsa animi nulla voluptate ea aut culpa.

                  <button
                    class="btn btn-outline-secondary btn-sm dropdown-toggle float-end"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#reply1"
                    aria-expanded="false"
                    disabled = "true"
                  >
                    답변보기
                  </button>
                  <div class="collapse" id="reply1">
                    <p class="m-auto fw-bolder "><hr>비활성화된 답변</p>
                  </div>
                </td>
                <td style="color: red">X</td>
              </tr>
              <tr>
                <td>거북이</td>
                <td>
                  상품이 마음에 드네요. 재입고 예정일은 언제인가요?

                  <!-- 답변 내용-->
                  <button
                    class="btn btn-outline-secondary btn-sm dropdown-toggle float-end"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#reply2"
                    aria-expanded="false"
                    
                  >
                    답변보기
                  </button>
                  <div class="collapse" id="reply2">
                    <p class="m-auto fw-bolder "><hr>관심을 가져 주셔서 감사합니다. 10월 중순에 입고될 예정입니다.</p>
                  </div>
                </td>
                <td style="color:blue">O</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>
    <!-- 푸터 (footer.html) -->
    <jsp:include page="include/footer.jsp" />
    <!-- include.js 자바스크립트 -->
    <script src="include/include.js"></script>
    <script>
      includeHTML();
    </script>
  </body>

  <!-- 모달 창 -->
  <div
    class="modal fade"
    id="productInquiryModal"
    tabindex="-1"
    aria-labelledby="productInquiryModalLabel"
    aria-hidden="true"
  >
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
          <form>
            <div class="mb-3">
              <label for="inquiryName" class="form-label">이름</label>
              <input
                type="text"
                class="form-control"
                id="inquiryName"
                required
              />
            </div>
            <div class="mb-3">
              <label for="inquiryMessage" class="form-label">문의 내용</label>
              <textarea
                class="form-control"
                id="inquiryMessage"
                rows="4"
                required
              ></textarea>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-secondary"
            data-bs-dismiss="modal"
          >
            닫기
          </button>
          <button type="button" class="btn btn-primary">문의</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JS-->
  <script src="js/bootstrap.bundle.js"></script>
</html>
