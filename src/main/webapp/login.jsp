<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-26
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
  <meta name="viewport" content="width=devoce-width", initial-scale="1">
  <link rel="stylesheet" href="css/bootstrap.css">
  <title>로그인</title>
</head>

<body>
<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="jumbotron" style="padding-top: 20px;">
      <form method="post" action="loginAction.jsp">
        <h3 style="test-align: center;">로그인</h3>
        <div class="form-group">
          <input type="text" class="form-control" placeholder="아이디" name="student_id" maxlength="20">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" placeholder="비밀번호" name="student_pwd" maxlength="20">
        </div>
        <input type="submit" class="btn btn-primary form-control" value="로그인">
      </form>
    </div>
  </div>
  <div class="col-lg-4"></div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
