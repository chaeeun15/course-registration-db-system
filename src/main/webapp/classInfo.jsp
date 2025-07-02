<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-11-02
  Time: 오후 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="classTable.Class" %>
<%@ page import="classTable.ClassDAO" %>
<%@ page import="lecturer.LecturerDAO" %>
<%@ page import="time.Time" %>
<%@ page import="time.TimeDAO" %>
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
    String userID = (String)session.getAttribute("userID");

    String  class_id = request.getParameter("class_id");
    Class classTable = new ClassDAO().getClass(class_id);
    TimeDAO timeDAO = new TimeDAO();
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
        <table class="table table-outer" style="text-align: center; border: 1px solid #dddddd; width: 100%">
            <thead>
            <tr>
                <th colspan="4" style="background-color: #eeeeee; text-align: center;">과목 정보</th>
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
                    <td colspan="2"><%= classTable.getPerson_max()%></td>
                </tr>
                <tr>
                    <td>교강사</td>
                    <td colspan="2"><%= classTable.getLecturer_id()%></td>
                </tr>
                <tr>
                    <td>강의실</td>
                    <td colspan="2"><%= classTable.getRoom_id()%></td>
                </tr>
                <%
                    if (Integer.parseInt(class_id) < 10000 && timeDAO.classStartTime(class_id).length() > 15) {
                %>
                <tr>
                    <td>수업 시간</td>
                    <td colspan="2"><%= timeDAO.classStartTime(class_id).substring(0, 4) + "년 "
                            + timeDAO.classStartTime(class_id).substring(5, 7) + "월 "
                            + timeDAO.classStartTime(class_id).substring(8, 10) + "일 "
                            + timeDAO.classStartTime(class_id).substring(11, 13) + "시 "
                            + timeDAO.classStartTime(class_id).substring(14, 16) + "분 ~ "
                            + timeDAO.classEndTime(class_id).substring(11, 13) + "시 "
                            + timeDAO.classEndTime(class_id).substring(14, 16) + "분" %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="searchCourse.jsp" style="text-align: left; width: auto;" class="btn btn-primary">목록</a>
        <%
            LecturerDAO lecturerDAO = new LecturerDAO();
            String lecturerID = (String) session.getAttribute("lecturer_id");
            int admin = lecturerDAO.administrator(lecturerID, 1);
            if (admin == 1) {
        %>
                <a href="updatePerson.jsp?class_id=<%= class_id %>" style="text-align: left; width: auto;" class="btn btn-primary">증원</a>
                <a onclick="return confirm('해당 과목을 삭제하시겠습니까?')" href="deleteCourseAction.jsp?class_id=<%= class_id %>" style="text-align: left; width: auto;" class="btn btn-primary">삭제</a>
        <%
            }
        %>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


</body>
</html>
