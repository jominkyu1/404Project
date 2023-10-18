<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.store.project.vo.user.form.UserRegisterForm" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
  <title></title>
  <!-- jQuery CDN -->
  <script src="https://code.jquery.com/jquery-latest.min.js" ></script>
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
      // 비밀번호 입력창 활성화
      var passwordInput = document.getElementById('password');
      document.getElementById('passwordChanged').value = true;
      passwordInput.readOnly = false;
      passwordInput.value = '';
      passwordInput.focus();
  }
  
  function idCheck(){
      // 아이디 중복 검사
      var checkUser = document.getElementById('username');
      if(checkUser.value === ''){
          alert('아이디를 입력해주세요!');
          checkUser.focus();
      }
      else{
          // ajax로 아이디 중복 검사
          $.ajax({
              url: '/user/idCheck',
              type: 'get',
              contentType: 'application/json; charset=utf-8',
              data: {username: checkUser.value},
              success: function(data){
                  if(data === true){
                      alert('이미 사용중인 아이디입니다.');
                      checkUser.focus();
                      document.getElementById('idChanged').value = false;
                  }
                  else{
                      alert('사용 가능한 아이디입니다.');
                      checkUser.focus();
                      document.getElementById('idChanged').value = true;
                  }
              },
              error: function(){
                  alert('아이디 중복 검사 실패');
              }
          });
      }
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
          <sec:authentication property="principal.user" var="user" />
          <c:if test="${!empty user.providerId}">
            <script>
              $(document).ready(function(){
                  // 소셜 로그인사용자는 비밀번호 변경 불가
                  $('#password').attr('disabled', true);
                  $('#pwChangeBtn').attr('disabled', true);
              })
            </script>
          </c:if>
          
          <form:form modelAttribute="userRegisterForm"
                     method="post">
            
            <!-- 에러처리 -->
            <spring:hasBindErrors name="userRegisterForm">
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <c:forEach var="error" items="${errors.allErrors}">
                  <strong>${error.defaultMessage}</strong><br><br>
                  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </c:forEach>
              </div>
            </spring:hasBindErrors>
            
          <table class="table table-hover">
            <tr>
              <th>아이디</th>
              <td>
                <div class="input-group">
                  <form:input path="username" type="text" cssClass="input-group-text" />
                  <input type="hidden" name="idChanged" id="idChanged" value="false">
                <input type="button" class="btn btn-outline-secondary mx-2" value="중복확인"
                       onclick="idCheck()">
                </div>
              </td>
            </tr>
            <tr>
              <th>비밀번호</th>
              <td>
                <div class="input-group">
                  <form:input path="password" type="password" cssClass="input-group-text" readonly="true" />
                  <input type="hidden" name="passwordChanged" id="passwordChanged" value="false">
                <input type="button" class="btn btn-outline-secondary mx-2" value="비밀번호 변경" id="pwChangeBtn"
                       onclick="enablePasswordInput()">
                </div>
              </td>
            </tr>
            <tr>
              <th>전화번호</th>
              <td>
                <form:input path="userphone" cssClass="input-group-text" />
              </td>
            </tr>
            <tr>
              <th>이메일</th>
              <td><form:input path="email" cssClass="input-group-text"/></td>
            </tr>
            <tr>
              <th>주소</th>
              <td>
                <div class="input-group">
                  <form:input path="postcode" cssClass="input-group-text w-25" />
                  <form:input path="address1" cssClass="input-group-text w-50" />
                  <input type="button" class="btn btn-outline-secondary mx-2" value="주소찾기"
                    onclick="daumPostcodeFinder()">
                </div>
              </td>
            </tr>
            <tr>
              <th>상세주소</th>
              <td>
                <div class="input-group">
                  <form:input path="address2" cssClass="input-group-text w-25" />
                  <form:input path="address_detail" cssClass="input-group-text w-50" />
                </div>
              </td>
            </tr>
            <tr>
              <%
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh시 mm분");
                UserRegisterForm user = (UserRegisterForm) request.getAttribute("userRegisterForm");
              %>
              <form:hidden path="regdate" />
              <form:hidden path="moddate" />
              
              <th>가입날짜</th>
              <td><%=sdf.format(user.getRegdate())%></td>
            </tr>
            <tr>
              <th>정보수정날짜</th>
              <td><%=sdf.format(user.getModdate())%></td>
            </tr>
          </table>
          
          <!-- 하단요소 -->
          <div class="mt-2 w-100">
            <input type="button" class="btn btn-outline-secondary" value="취소" onclick="history.back()">
            <input type="submit" class="btn btn-outline-secondary" value="수정완료">
          </div>
          </form:form>
          
        </div>
      </div>
    </div>
  </section>
  <jsp:include page="../include/footer.jsp" />
</body>
<!-- 카카오 주소찾기 API-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/postcode_finder.js"></script>
<!-- Bootstrap core JS-->
<script src="/js/bootstrap.bundle.js"></script>
</html>