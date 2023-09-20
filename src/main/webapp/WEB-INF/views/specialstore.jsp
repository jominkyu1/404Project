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
      <div class="text-center">
        <h2 class="mb-3">이번주 한정 특가</h2>
       
        <select
          class="form-select mb-4 mx-auto"
          id="categoryFilter"
          style="width: 50vw"
        >
          <option value="all">모든 제품</option>
          <option value="electronics">전자제품</option>
          <option value="clothing">의류</option>
        </select>

        <span class="input-group mb-4 mx-auto" style="width: 50vw">
          <input type="text" class="form-control" placeholder="제품 검색" />
          <button
            class="btn btn-outline-secondary"
            type="button"
            id="searchButton"
          >
            <i class="bi bi-search"></i>
          </button>
        </span>

        <!-- 카테고리별 버튼 추가 -->
        <div class="btn-group" role="group" aria-label="카테고리 필터">
          <button
            type="button"
            class="btn btn-outline-dark"
            data-category="all"
          >
            전체
          </button>
          <button
            type="button"
            class="btn btn-outline-dark"
            data-category="electronics"
          >
            전자제품
          </button>
          <button
            type="button"
            class="btn btn-outline-dark"
            data-category="clothing"
          >
            의류
          </button>
        </div>
      </div>
      <div class="container px-4 px-lg-5 mt-5">
        <div
          class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"
        >
          <div class="col mb-5">
            <div class="card h-100">
              <!-- Product image-->
              <img class="card-img-top" src="images/buds2.png" alt="버즈2" />
              <!-- Product details-->
              <div class="card-body p-4">
                <div class="text-center">
                  <!-- Product name-->
                  <h5 class="fw-bolder">
                    <a href="/item" class="text-decoration-none">Galaxy Buds 2</a>
                  </h5>
                  <!-- Product price-->
                  <span class="fw-bolder">87,000원</span>
                </div>
              </div>
              <!-- Product actions-->
              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center">
                  <a class="btn btn-outline-dark mt-auto mb-1" href="#"
                    >장바구니</a
                  >
                </div>
                <div class="text-center">
                  <a class="btn btn-primary mt-auto" href="iteminfo.html">구매하기</a>
                </div>
              </div>
            </div>
          </div>
          <div class="col mb-5">
            <div class="card h-100">
              <!-- Sale badge-->
              <div
                class="badge bg-dark text-white position-absolute"
                style="top: 0.5rem; right: 0.5rem"
              >
                세일
              </div>
              <!-- Product image-->
              <img
                class="card-img-top"
                src="https://placehold.it/400x500"
                alt="버즈2프로"
              />
              <!-- Product details-->
              <div class="card-body p-4">
                <div class="text-center">
                  <!-- Product name-->
                  <h5 class="fw-bolder">Galaxy Buds 2 Pro</h5>
                  <!-- Product price-->
                  <span class="text-muted text-decoration-line-through"
                    >200,000원</span
                  >
                  175,000원
                </div>
              </div>
              <!-- Product actions-->
              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center">
                  <a class="btn btn-outline-dark mt-auto mb-1" href="#"
                    >장바구니</a
                  >
                </div>
                <div class="text-center">
                  <a class="btn btn-primary mt-auto" href="#">구매하기</a>
                </div>
              </div>
            </div>
          </div>
          <div class="col mb-5">
            <div class="card h-100">
              <!-- Product image-->
              <img
                class="card-img-top"
                src="https://placehold.it/400x500"
                alt="인덕션"
              />
              <!-- Product details-->
              <div class="card-body p-4">
                <div class="text-center">
                  <!-- Product name-->
                  <h5 class="fw-bolder">삼성 빌트인 인덕션</h5>
                  <!-- Product price-->
                  870,000원
                </div>
              </div>
              <!-- Product actions-->
              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center">
                  <a class="btn btn-outline-dark mt-auto mb-1" href="#"
                    >장바구니</a
                  >
                </div>
                <div class="text-center">
                  <a class="btn btn-primary mt-auto" href="#">구매하기</a>
                </div>
              </div>
            </div>
          </div>
          <div class="col mb-5">
            <div class="card h-100">
              <!-- Sale badge-->
              <div
                class="badge bg-dark text-white position-absolute"
                style="top: 0.5rem; right: 0.5rem"
              >
                인기
              </div>
              <!-- Product image-->
              <img class="card-img-top" src="https://placehold.it/400x500" alt="폴드5" />
              <!-- Product details-->
              <div class="card-body p-4">
                <div class="text-center">
                  <!-- Product name-->
                  <h5 class="fw-bolder">갤럭시Z 폴드 5</h5>
                  <!-- Product reviews-->
                  <div
                    class="d-flex justify-content-center small text-warning mb-2"
                  >
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                  </div>
                  <!-- Product price-->
                  1,250,000원
                </div>
              </div>
              <!-- Product actions-->
              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center">
                  <a class="btn btn-outline-dark mt-auto mb-1" href="#"
                    >장바구니</a
                  >
                </div>
                <div class="text-center">
                  <a class="btn btn-primary mt-auto" href="#">구매하기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- 푸터 (footer.html) -->
    <jsp:include page="include/footer.jsp" />
    <!-- include.js 자바스크립트 -->
    <script src="/include/include.js"></script>
    <script>
      includeHTML();
    </script>
  </body>

  <!-- Bootstrap core JS-->
  <script src="js/bootstrap.bundle.js"></script>
</html>
