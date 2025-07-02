<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-26
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>로그인 액션</title>
</head>
<body>
<%
    session.invalidate(); //회원의 세션 빼앗음
%>
<script>
    location.href = 'main.jsp';
</script>
</body>
</html>
