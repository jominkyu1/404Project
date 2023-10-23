<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비번찾기 결과</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="text-center"> <!-- 모든 텍스트를 중앙 정렬 -->
<div id="pOK_wrap" class="container" style="margin-top: 70px;">
    <h2 class="pOK_title">비번검색 결과</h2>
    <div class="row justify-content-center">
    <div class="col-md-8">
    <table id="pOK_t" class="table table-bordered" style="margin-top: 30px;"> <!-- Bootstrap 테이블 스타일 적용 -->
        <tr>
            <th>임시비번</th>
            <td>${pwd_ran}</td>
        </tr>
        <tr>
            <th colspan="2">(*임시비번은 로그인 후 수정하세요!)</th>
        </tr>
    </table>
    <div id="pOK_menu" style="margin-top: 20px;">
        <a href="../login" class="btn btn-primary">닫기</a> <!-- 부트스트랩 버튼 스타일 적용 -->
        <%-- login창으로 이동--%>
    </div>
</div>
    </div>
</div>
</body>
</html>
