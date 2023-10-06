<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
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
<script>
  function enablePasswordInput(){
      var passwordInput = document.getElementById('password');
      passwordInput.disabled = false;
      passwordInput.value = '';
      passwordInput.focus();
  }
</script>
<body>
  <jsp:include page="../include/nav.jsp" />
  <jsp:include page="../include/header.jsp" />
  <section class="py-5 mx-auto">
    <div class="text-center "><h2>회원정보 수정</h2></div>
    <div class="container mt-2">
      <div class="row">
        <div class="col-4">
          <div class="text-center">
            <img src="https://placehold.it/300x300" class="rounded" width="100%" alt="sample">
          </div>
        </div>
        <div class="col-8">
          <table class="table table-hover">
            <tr>
              <th>아이디</th>
              <td><input type="text" class="input-group-text" name="username" value="${user.username}"></td>
            </tr>
            <tr>
              <th>비밀번호</th>
              <td>
                <div class="input-group">
                <input type="password" class="input-group-text" id="password" name="password" value="${user.password}" disabled>
                <input type="button" class="btn btn-outline-secondary mx-2" value="비밀번호 변경"
                       onclick="enablePasswordInput()">
                </div>
              </td>
            </tr>
            <tr>
              <th>전화번호</th>
              <td><input type="text" class="input-group-text" name="userphone" value="${user.userphone}"></td>
            </tr>
            <tr>
              <th>이메일</th>
              <td><input type="text" class="input-group-text" name="email" value="${user.email}"></td>
            </tr>
            <tr>
              <th rowspan="2">주소</th>
              <td>${user.address1}  ${user.address2}</td>
            </tr>
            <tr>
              <td>${user.address_detail}</td>
            </tr>
            <tr>
              <th>가입날짜</th>
              <td>${user.regdate}</td>
            </tr>
            <tr>
              <th>정보수정날짜</th>
              <td>${user.moddate}</td>
            </tr>
          </table>
          
          <!-- 하단요소 -->
          <div class="mt-2 w-100">
            <a href="" class="btn btn-outline-secondary">수정완료</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <jsp:include page="../include/footer.jsp" />
</body>
<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>