<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비번검색</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="text-center"> <!-- Added 'text-center' class to center-align all text -->
<div id="pFind_wrap" class="container"  style="margin-top: 70px;">
    <h2 class="pFind_title">비번찾기</h2>
    <form method="post" action="pwd_find_ok" onsubmit="return pwd_check();">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-group" style="margin-top: 30px;">
                    <label for="pwdId">회원아이디</label>
                    <input type="text" name="pwdId" id="pwdId" class="form-control" />
                </div>
                <div class="form-group" style="margin-top: 30px;">
                    <label for="pwdEmail">회원 이메일주소</label>
                    <input type="text" name="pwdEmail" id="pwdEmail" class="form-control" />
                </div>
                <button type="submit" class="btn btn-primary">찾기</button>
                <button type="reset" class="btn btn-secondary" onclick="$('#pwdId').focus();">취소</button>
            </div>
        </div>
    </form>
</div>


</body>
</html>
