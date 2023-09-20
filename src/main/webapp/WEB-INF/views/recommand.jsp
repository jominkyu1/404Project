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
        .grid {
            display: grid;
            grid-template-columns: repeat(5, minmax(0px, 1fr));
        }
        .bg-gray-3 {
            --tw-bg-opacity: 1;
            background-color: rgb(223 223 223/var(--tw-bg-opacity));
            
        }
        .bg-white{
            --tw-bg-opacity: 1;
            background-color: rgb(223 223 223/var(--tw-bg-opacity));
            
        }
        .grid-cols-2 {
            grid-template-columns: repeat(2,minmax(0,1fr));
            
        }
        .gap-\[1px\] {
            gap: 1px;
        }
        .px-\[1\.2rem\] {
            padding-left: 1.2rem;
            padding-right: 1.2rem;
        }
        
        #id1 li a, #id2 li a, #id3 li a, #id4 li a{
          color: black;
        }

        #id1 li a:link, #id2 li a:link, #id3 li a:link, #id4 li a:link{
          color:black;
          text-decoration: none;
        }
        
        /* 방문한 후 링크 색상 (회색) */
        /*#id1 li a:visited, #id2 li a:visited, #id3 li a:visited, #id4 li a:visited {
        color: gainsboro; 
        text-decoration: none;
        }*/
        
        #id1 li a:hover, #id2 li a:hover, #id3 li a:hover, #id4 li a:hover{
          text-decoration:underline;
          color:rgb(127, 129, 255);
        }
        
        #id1 li a:active, #id2 li a:active, #id3 li a:active, #id4 li a:active{
          color:wheat;
        }

    </style>
    <body>
    <!-- 네비게이션(nav.html) 로드 -->
    <jsp:include page="include/nav.jsp" />
    <!-- 배너(header.html) 로드 -->
    <jsp:include page="include/header.jsp" />
    <section>
      <div class="accordion" id="accordionExample">
        <div class="accordion-item">
          <h2 class="accordion-header">
            <button class="accordion-button fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="font-size:1.7rem;">
              생활가전 <img src="/images/vaccum.jpg" width="40" height="30" >
            </button>
          </h2>
          <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="container text-center">
                <div class="row justify-content-center " id="id1">
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="/recommand/item" >세탁기</a>
                        <a href="/recommand/item" >세탁기</a>
                      </li>
                      <li>
                        <a href="#">세탁기</a>
                      </li>
                      <li>
                        <a href="#">세탁기</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">세탁기</a>
                      </li>
                      <li>
                        <a href="#">세탁기</a>
                      </li>
                      <li>
                        <a href="#">세탁기</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-6 5 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">세탁기</a>
                      </li>
                      <li>
                        <a href="#">세탁기</a>
                      </li>
                      <li>
                        <a href="#">세탁기</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header">
            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="font-size:1.7rem;">
              계절가전 <img src="/images/aircon1.png" width="30" height="30">
            </button>
          </h2>
          <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="container text-center">
                <div class="row justify-content-center "id="id2">
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">에어컨</a>
                      </li>
                      <li>
                        <a href="#">에어컨</a>
                      </li>
                      <li>
                        <a href="#">에어컨</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">에어컨</a>
                      </li>
                      <li>
                        <a href="#">에어컨</a>
                      </li>
                      <li>
                        <a href="#">에어컨</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">에어컨</a>
                      </li>
                      <li>
                        <a href="#">에어컨</a>
                      </li>
                      <li>
                        <a href="#">에어컨</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header">
            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="font-size:1.7rem;">
              주방가전 <img src="/images/fridge.jpg" width="25" height="30">
            </button>
          </h2>
          <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="container text-center">
                <div class="row justify-content-center "id="id3">
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">냉장고</a>
                      </li>
                      <li>
                        <a href="#">냉장고</a>
                      </li>
                      <li>
                        <a href="#">냉장고</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">냉장고</a>
                      </li>
                      <li>
                        <a href="#">냉장고</a>
                      </li>
                      <li>
                        <a href="#">냉장고</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">냉장고</a>
                      </li>
                      <li>
                        <a href="#">냉장고</a>
                      </li>
                      <li>
                        <a href="#">냉장고</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header">
            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" style="font-size:1.7rem;">
              디지털/IT <img src="/images/monitor.jpg" width="25" height="25" class="mx-1">
            </button>
          </h2>
          <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="container text-center">
                <div class="row justify-content-center "id="id4">
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">모니터</a>
                      </li>
                      <li>
                        <a href="#">모니터</a>
                      </li>
                      <li>
                        <a href="#">모니터</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">모니터</a>
                      </li>
                      <li>
                        <a href="#">모니터</a>
                      </li>
                      <li>
                        <a href="#">모니터</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-6 ">
                    <ul class="list-unstyled" style="font-size: 150%;">
                      <li>               
                        <a href="#">모니터</a>
                      </li>
                      <li>
                        <a href="#">모니터</a>
                      </li>
                      <li>
                        <a href="#">모니터</a>
                      </li>
                    </ul>
                  </div>
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
        <script src="include/include.js"></script>
        <script>
            includeHTML();
        </script>
    </body>

    <!-- Bootstrap core JS-->
    <script src="js/bootstrap.bundle.js"></script>
</html>
