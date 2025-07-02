<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-26
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=devoce-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css"> <%--meta, link는 bootstrap을 위한 코드--%>
    <title>회원가입</title>
</head>

<body>
<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="joinAction.jsp">
                <h3 style="test-align: center;">회원가입</h3>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" name="student_id" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="student_pwd" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="이름" name="student_name" maxlength="20">
                </div>
                <div class="form-group" style="test-align: center;">
                    <div class="btn-group" data-roggle="buttons">
                        <label class="btn">
                            <input type="radio" name="student_gender" autocomplete="off" value="male" checked> 남자
                        </label>
                        <label class="btn">
                            <input type="radio" name="student_gender" autocomplete="off" value="female" checked> 여자
                        </label>
                    </div>
                </div>
                <input type="submit" class="btn btn-primary form-control" value="가입하기">
            </form>
        </div>
    </div>
    <div class="col-lg-4"></div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<%-- 위의 script 두 줄은 애니메이션을 위한 코드 --%>
</body>
</html>
