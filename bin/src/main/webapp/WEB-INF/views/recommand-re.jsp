<%@ page contentType="text/html; charset=UTF-8" %>
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
        .border-5 {
            padding: 20px; /* 내부 여백을 조정하세요. */
        }

        .border1, .border2, .border3 {
            margin-bottom: 20px; /* 간격을 조정하세요. */
        }
        </style>
    <body>
        <!-- 네비게이션(nav.html) 로드 -->
        <jsp:include page="include/nav.jsp" />
        <!-- 배너(header.html) 로드 -->
        <jsp:include page="include/header.jsp" />
        <!-- 매인 섹션 -->
        <section>
          <div class="border border-5 border-secondary">
            <div class="row">
              <div class="col-3 border border-5 border-primary">
                <div class="card" style="width: 100%;">
                  <img src="https://placehold.it/700x500" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">제품 이름</h5>
                    <p class="card-text"></p>
                    <a href="#" class="btn btn-primary">404 픽</a>
                    <a href="#" class="btn btn-primary">다른 사이트 픽</a>
                  </div>
                </div>
              </div>
              <div class="col-9 border border-5 border-danger">
                <div class="border border-5">
                <span class="text-start mb-5 ">
                  상품 설명을 적으면 됩니다.상품 설명을 적으면 됩니다.상품 설명을 적으면 됩니다.상품 설명을 적으면 됩니다.
                  상품 설명을 적으면 됩니다.상품 설명을 적으면 됩니다.상품 설명을 적으면 됩니다.상품 설명을 적으면 됩니다.
                  상품 설명을 적으면 됩니다.상품 설명을 적으면 됩니다.상품 설명을 적으면 됩니다.상품 설명을 적으면 됩니다.
                </span>
                </div>
                <div>
                  <div>
                    <div class="border border-5 border-black my-2">
                      <h2>장점</h2>
                      <ul>
                        <li>
                          싸다
                        </li>
                        <li>
                          좋다
                        </li>
                      </ul>
                      <hr class=""><br>
                      <h2 class="">단점</h2>
                      <ul>
                        <li>
                          비싸다
                        </li>
                        <li>
                          안좋다
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              
              </div>
            </div>
          </div>
          
        </section>
        <!-- 푸터 (footer.html) -->
        <jsp:include page="include/footer.jsp" />
    </body>

    <!-- Bootstrap core JS-->
    <script src="/js/bootstrap.bundle.js"></script>
</html>
