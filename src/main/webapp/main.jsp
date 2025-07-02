<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-26
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="lecturer.Lecturer" %>
<%@ page import="lecturer.LecturerDAO" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
  <title>메인페이지</title>
</head>
<body>
<% //로그인 한 사람은 userID 변수에 id가 저장됨.
  String student_id = null;
  String lecturer_id = null;
  if (session.getAttribute("student_id") != null) {
    student_id = (String) session.getAttribute("student_id");
  } else if (session.getAttribute("lecturer_id") != null) {
    lecturer_id = (String) session.getAttribute("lecturer_id");
  }
%>
<h3 style="test-align: center;">메인페이지</h3>
<%
  if(student_id == null && lecturer_id == null)
  {
%>
<button type="button" class="navyBtn" onClick="location.href='login.jsp'">로그인</button>
<button type="button" class="navyBtn" onClick="location.href='join.jsp'">회원가입</button>

<%
}
else
{
%>
<button type="button" class="navyBtn" onClick="location.href='logoutAction.jsp'">로그아웃</button>
<%
  LecturerDAO lecturerDAO = new LecturerDAO();
  String lecturerID = (String) session.getAttribute("lecturer_id");
  int admin = lecturerDAO.administrator(lecturerID, 1);
  if (admin == 1) {
%>
<button type="button" class="navyBtn" onClick="location.href='showAll.jsp'">모든 사용자 정보</button>
<%
  }
%>
<button type="button" class="navyBtn" onClick="location.href='enrolment.jsp'">수강신청</button>

<%
  }
%>
</body>
</html>
