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

    <!--Main 네비게이션바 시작-->
    <style>
      #navbarColor02 ul li {
        margin: 0 30px;
        /* 원하는 간격으로 조정 */
      }
    </style>

    <nav class="navbar navbar-expand-lg bg-light" id="guidenav">
      <div class="container ">
        <div class="d-flex align-items-center">
          <a class="navbar-brand" href="#" data-abc="true"> <strong>구매 GUIDE</strong></a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02"
          aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarColor02">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="guide.html" data-abc="true">전체 <span
                  class="visually-hidden">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="digital_IT.html" data-abc="true">디지털 IT</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" data-abc="true">생활가전</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" data-abc="true">주방가전</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                aria-expanded="false">
                Dropdown
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!--Main 네비게이션바 끝-->



    <div class="container px-4 px-lg-5 my-5">

      <!-- 이미지 -->
      <style>
        .radius {
          border-radius: 30px;
        }
      </style>
      <div class="md-6">
        <img class="card-img-top mb-5 mb-md-0 radius" src="images/guide/bluetooth_earphones.jpg" alt="..." />
      </div>

      <!-- 텍스트 요소 -->
      <div class="md-6">
        <div class="d-flex flex-column justify-content-center h-100">
          <div id="explanation">
            <br>
            <h1 class="display-5 fw-bolder">블루투스 이어폰</h1>

            <br>
            <p class="lead">
              어느새 지하철이나 버스를 둘러보면 유선 이어폰을 찾아보기 힘들게 되었습니다.<br>
              금세 일상으로 들어온 무선 이어폰, 그런데 브랜드도 너무 많고 가격도 천차만별입니다.<br>
              어떤 기준으로 무선 이어폰을 골라야 할지 함께 알아보겠습니다.
            </p>

          </div>

          <br>
          <br>




          <!-- Recommand item start -->
          <div class="container px-4 px-lg-5 mt-5">
            <h1 class="fw-bolder text-center">추천 아이템</h1>
            <br>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
              <div class="col mb-5">
                <h2 class="text-center">10만원대 추천</h2>
                <div class="card h-100">
                  <!-- Product image-->
                  <img class="card-img-top" src="images/buds2.png" alt="버즈2" />
                  <!-- Product details-->
                  <div class="card-body p-4">
                    <div class="text-center">
                      <!-- Product name-->
                      <h5 class="fw-bolder">
                        <a href="iteminfo.html" class="text-decoration-none">Galaxy Buds 2</a>
                      </h5>
                      <!-- Product price-->
                      <span class="fw-bolder">87,000원</span>
                    </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                    <div class="text-center">
                      <a class="btn btn-outline-dark mt-auto mb-1" href="#">장바구니</a>
                    </div>
                    <div class="text-center">
                      <a class="btn btn-primary mt-auto" href="iteminfo.html">구매하기</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col mb-5">
                <h2 class="text-center">20만원대 추천</h2>
                <div class="card h-100">
                  <!-- Sale badge-->
                  <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
                    세일
                  </div>
                  <!-- Product image-->
                  <img class="card-img-top" src="https://placehold.it/400x500" alt="버즈2프로" />
                  <!-- Product details-->
                  <div class="card-body p-4">
                    <div class="text-center">
                      <!-- Product name-->
                      <h5 class="fw-bolder">Airpod Pro 2</h5>
                      <!-- Product price-->
                      <span class="text-muted text-decoration-line-through">200,000원</span>
                      230,000원
                    </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                    <div class="text-center">
                      <a class="btn btn-outline-dark mt-auto mb-1" href="#">장바구니</a>
                    </div>
                    <div class="text-center">
                      <a class="btn btn-primary mt-auto" href="#">구매하기</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col mb-5">
                <h2 class="text-center">30만원대 추천</h2>
                <div class="card h-100">
                  <!-- Sale badge-->
                  <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
                    인기
                  </div>
                  <!-- Product image-->
                  <img class="card-img-top" src="https://placehold.it/400x500" alt="폴드5" />
                  <!-- Product details-->
                  <div class="card-body p-4">
                    <div class="text-center">
                      <!-- Product name-->
                      <h5 class="fw-bolder">BOSE QC EarBuds 2</h5>
                      <!-- Product reviews-->
                      <div class="d-flex justify-content-center small text-warning mb-2">
                        <div class="bi-star-fill"></div>
                        <div class="bi-star-fill"></div>
                        <div class="bi-star-fill"></div>
                        <div class="bi-star-fill"></div>
                        <div class="bi-star-fill"></div>
                      </div>
                      <!-- Product price-->
                      320,000원
                    </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                    <div class="text-center">
                      <a class="btn btn-outline-dark mt-auto mb-1" href="#">장바구니</a>
                    </div>
                    <div class="text-center">
                      <a class="btn btn-primary mt-auto" href="#">구매하기</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Recommand item end -->




          <br>






          <!--nav bar 2 start-->

          <style>
            .nav-item:hover {
              font-weight: bold;
            }
          </style>

          <nav id="navbar-example2" class="navbar bg-body-tertiary px-3 mb-3 justify-content-center">
            <ul class="nav nav-pills">
              <li class="nav-item" style="margin-right: 30px;">
                <a class="nav-link" href="#section1">고가vs저가</a>
              </li>
              <li class="nav-item" style="margin-right: 30px;">
                <a class="nav-link" href="#section2">음질</a>
              </li>
              <li class="nav-item" style="margin-right: 30px;">
                <a class="nav-link" href="#section3">통화품질</a>
              </li>
              <li class="nav-item" style="margin-right: 30px;">
                <a class="nav-link" href="#section4">소리 전달방식</a>
              </li>


            </ul>
          </nav>

          <!-- 스크롤 대상이 되는 섹션 -->
          <div id="section1" class="scrollspy-section bg-body-tertiary p-3 rounded-2">
            <h4 class="fw-bolder">고가 vs 저가</h4>
            <br>
            <p>저가형의 수준이 올라오면서<br>
              음질은 상향 평준화됨</p>
            <p>무선 이어폰 초창기에는 애플, 삼성 등 일부 브랜드를 중심으로 20만 원이 넘는 고가 무선 이어폰만 출시되었지만, 최근에는 시장이 커지면서 1만 원부터 40만 원까지 이어폰 가격이
              천차만별이
              되었습니다.</p>

            <p>이에 따라, 긍정적인 효과도 나타났는데, 저가형 제품들도 제조사들의 기술력이 높아져 저가형 무선 이어폰의 단점으로 꼽혔던 음질 문제나 연결 끊김 문제가 보완되었다는 것입니다.</p>

            <p>지금은 저가형 이어폰을 구입해도 일정 수준 이상의 음질이나 연결 성능을 보장받을 수 있게 되었으며, 실제로 저렴한 제품도 생각보다 괜찮은 음질을 나타낸다는 리뷰도 쉽게 찾아볼 수 있습니다.
            </p>

          </div>
          <div id="section2" class="scrollspy-section bg-body-tertiary p-3 rounded-2">
            <h4 class="fw-bolder">음질</h4>
            <br>
            <p>음질을 결정하는 드라이버와 사운드 튜닝</p>
            <p>다만, 스펙만으로 평가하기 어려움</p>
            <p>구매 전 직접 들어보는 것을 추천</p>

            <p>*풍부한 음 표현과 정확도 높은 소리를 내는<br>
              이어폰이 음질이 좋음</p>
            <p>이어폰은 신호를 전달받아 드라이버라고 하는 얇은 판이 진동하면서 소리를 내는 구조이기 때문에, 본래의 소리대비 왜곡이 발생하고, 표현할 수 있는 음의 범위에도 차이가 발생합니다.</p>

            <p>이 왜곡이 적은 이어폰이 정확한 소리를 낼 수 있으며, 표현할 수 있는 음의 범위가 넓은 이어폰이 음질이 좋은 이어폰이라고 할 수 있습니다.</p>

            <p>왜곡과 음의 범위는 소리를 내는 부품인 드라이버와 드라이버가 소리를 내는 형태를 조절하는 사운드 튜닝의 영향을 받습니다.</p>


          </div>
          <div id="section3" class="scrollspy-section bg-body-tertiary p-3 rounded-2">
            <h4 class="fw-bolder">통화품질</h4>
            <br>
            <p>마이크 개수 & 기능</p>
            <p>통화 품질이 중요하다면 마이크 기능 확인</p>

            <p>단일 마이크는 노이즈를 걸러내지 못함</p>
            <p>2개 이상 마이크가 있는 제품을 선택</p>
            <p>마이크가 하나라면 외부의 소음과 사람의 말소리를 한 마이크로 듣기 때문에 모든 소리가 통화 상대방에게 전달됩니다.</p>

            <p>반면, 마이크가 2개 이상 있다면 각각의 마이크가 외부 소음과 사람 목소리를 구분하여 외부 소음은 거르고 목소리만 상대방에게 전달할 수 있기 때문에 최근 출시되는 대부분의 무선 이어폰은
              기본적으로 2개 이상의 마이크를 갖고 있습니다.</p>

            <p>더 높은 통화 품질을 원하신다면 마이크 개수뿐만 아니라 빔포밍 마이크, 골전도 마이크 등의 기능도 함께 확인하시는 것이 좋습니다.</p>

          </div>
          <div id="section4" class="scrollspy-section bg-body-tertiary p-3 rounded-2">
            <h4 class="fw-bolder">소리 전달방식</h4>
            <br>
            <p class="fw-bolder">노이즈 캔슬링</p>
            <p>입에서 나는 소리와 외부 소음이 이어폰 마이크에 인식되는 시간 차이를 계산하여 외부 소음을 차단해 주는 기술이 노이즈 캔슬링 마이크입니다.</p>

            <p>2개의 마이크가 사용자 입에서 나는 소리와 외부 소리를 구분하고, 사용자 입에서 나는 소리만 남겨서 상대방에게 전달하기 때문에 더 선명한 목소리로 통화할 수 있습니다.</p>
            <p class="fw-bolder">골전도 마이크</p>
            <p>외부 소음이 너무 시끄러운 경우 사용자의 입에서 나는 소리만 잡아내는 것에 한계가 있는데, 이를 극복하기 위해 사용하는 마이크가 골전도 마이크입니다.</p>

            <p>양쪽 귀를 막고 '아~'하는 소리를 내면 머리 안쪽에서 소리가 나는 느낌이 드는데, 이 소리가 뼈를 타고 움직이는 골전도 소리입니다. 골전도 마이크는 이 뼈를 타고 움직이는 말소리를
              전달하여 시끄러운 상황에서도 사용자의 음성을 또렷하게 전달할 수 있어 통화 품질을 높여 줍니다.</p>

            <p>골전도 마이크 역시 통화 품질을 강조하는 고가형 이어폰이 주로 채택하는 마이크 기능입니다.</p>


            <p class="fw-bolder">윈드 실드 메시</p>
            <p>이어폰 내부에 착용자의 턱 움직임을 감지하는 센서를 탑재하여, 말할 때만 소리를 전달하는 기능도 있습니다.
              주로 가속센서, VPU(Voice Pickup Unit)이라는 이름을 사용합니다.</p>

            <p>또, 통화할 때 바람이 마이크를 통해 들어가 '윙윙'하는 소리가 나기도 하는데, 마이크 겉 부분에 바람 소리를 차단해 주는 메시(그물망)을 씌워 통화할 때 바람 소리가 들어가지 않도록 하는
              제품도 있습니다.</p>

          </div>


          <script>
            window.addEventListener("scroll", function () {
              var navbar = document.getElementById("navbar-example2");
              if (window.pageYOffset >= 2000) { // 스크롤 위치 조건을 원하는 위치로 조정
                navbar.classList.add("fixed-top");
              } else {
                navbar.classList.remove("fixed-top");
              }
            });
          </script>

          <!--nav bar 2 end-->

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

<!-- Bootstrap core JS-->
<script src="js/bootstrap.bundle.js"></script>

</html>