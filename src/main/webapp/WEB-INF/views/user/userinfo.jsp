<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body>
  <jsp:include page="../include/nav.jsp" />
  <jsp:include page="../include/header.jsp" />
  <section class="py-5 mx-auto">
    <div class="text-center "><h2>회원정보</h2></div>
    <div class="container mt-2">
      <div class="row">
        <div class="col-4">
          <div class="text-center">
            <img src="https://placehold.it/300x300" class="rounded" width="100%">
          </div>
        </div>
        <div class="col-8">
          <table class="table table-hover ">
            <tr>
              <th>아이디</th>
              <td>${user.username}</td>
            </tr>
            <tr>
              <th>이름</th>
              <td>사용자${user.user_id}</td>
            </tr>
            <tr>
              <th>전화번호</th>
              <td>${user.userphone}</td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>${user.email}</td>
            </tr>
            <tr>
              <th>주소</th>
              <td>${user.address1}  ${user.address2}</td>
            </tr>
            <tr>
              <th>상세주소</th>
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
            <a href="" class="btn btn-outline-secondary">프로필사진 업로드</a>
            <a href="" class="btn btn-outline-secondary">정보수정</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <jsp:include page="../include/footer.jsp" />
</body>
</html>