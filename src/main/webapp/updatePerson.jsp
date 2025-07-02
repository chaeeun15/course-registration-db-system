<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-11-08
  Time: 오전 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="classTable.Class" %>
<%@ page import="classTable.ClassDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<body>
<%
    String class_id = null;

    if (request.getParameter("class_id") != null) {
        class_id = request.getParameter("class_id");
    } Class classTable = new ClassDAO().getClass(class_id);
    if (class_id == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert(유효하지 않은 과목입니다.)");
        script.println("location.href = searchCourse.jsp");
        script.println("</script>");
    }
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="enrolment.jsp">수강신청</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="searchCourse.jsp">과목검색</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="enrolmentResult.jsp">신청결과</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="desiredClass.jsp">희망수업</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="schedule.jsp">시간표</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row">
        <form method="post" action="updatePersonAction.jsp?class_id=<%= class_id%>">
            <table class="table table-outer" style="text-align: center; border: 1px solid #dddddd; width: 100%">
                <thead>
                <tr>
                    <th colspan="4" style="background-color: #eeeeee; text-align: center;">과목 증원</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>과목명</td>
                    <td colspan="2"><%= classTable.getClass_name().replaceAll(" ", "&nbsp;")%></td>
                </tr>
                <tr>
                    <td>학수번호</td>
                    <td colspan="2"><%= classTable.getCourse_id()%></td>
                </tr>
                <tr>
                    <td>과목번호</td>
                    <td colspan="2"><%= classTable.getClass_no()%></td>
                </tr>
                <tr>
                    <td>수강 가능 인원</td>
                    <td><input type="text" class="form-control" placeholder="수강 가능 인원" name="person_max" maxlength="20" value="<%= classTable.getPerson_max()%>"></td>
                </tr>
                <tr>
                    <td>교강사</td>
                    <td colspan="2"><%= classTable.getLecturer_id()%></td>
                </tr>
                <tr>
                    <td>강의실</td>
                    <td colspan="2"><%= classTable.getRoom_id()%></td>
                </tr>
                </tbody>
            </table>
            <div style="text-align: right; width: 100%; padding: 0;">
                <input type="submit" class="btn btn-primary" value="과목 인원 증원">
            </div>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


</body>
</html>
