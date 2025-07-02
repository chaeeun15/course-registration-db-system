<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-26
  Time: 오후 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="classTable.Class"%>
<%@ page import="classTable.ClassDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="lecturer.Lecturer" %>
<%@ page import="lecturer.LecturerDAO" %>
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
    int pageNumber = 1; //기본 페이지
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
            <li class="nav-item">
                <a class="nav-link" href="main.jsp">메인페이지</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row">
        <form method="post" name="search" action="searchClass.jsp">
            <table class="pull-right">
                <tr>
                    <td><select class="form-control" name="searchField">
                        <option value="0">선택</option>
                        <option value="course_id">학수번호</option>
                        <option value="class_no">과목번호</option>
                        <option value="class_name">교과목명</option>
                    </select> </td>
                    <td>
                        <input type="text" class="form-control" placeholder="검색어 입력" name="searchText" maxlength="50">
                    </td>
                    <td><button type="submit" class="btn btn-success">검색</button> </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<div class="container">
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
                <tr>
                    <th style="background-color: #eeeeee; text-align: center;">번호</th>
                    <th style="background-color: #eeeeee; text-align: center;">학수번호</th>
                    <th style="background-color: #eeeeee; text-align: center;">과목번호</th>
                    <th style="background-color: #eeeeee; text-align: center;">교과목명</th>
                    <th style="background-color: #eeeeee; text-align: center;">수강신청</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ClassDAO classDAO = new ClassDAO();
                    ArrayList<Class> list = classDAO.getList(pageNumber);
                    for (int i = 0; i < list.size(); i++) {
                %>
                <tr>
                    <td><a href="classInfo.jsp?class_id=<%= list.get(i).getClass_id()%>"><%= list.get(i).getClass_id()%></a></td>
                    <td><%= list.get(i).getCourse_id()%></td>
                    <td><%= list.get(i).getClass_no()%></td>
                    <td><%= list.get(i).getClass_name()%></td>
                    <td><button type="enrolment" class="btn btn-primary">신청</button> </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            if (pageNumber != 1) {
        %>
            <a href="searchCourse.jsp?pageNumber=<%=pageNumber - 1%>">◀ 이전</a>
        <%
            } if (classDAO.nextPage(pageNumber + 1)) {
        %>
            <a href="searchCourse.jsp?pageNumber=<%=pageNumber + 1%>">다음 ▶</a>
        <%
            }
        %>
        <%
            LecturerDAO lecturerDAO = new LecturerDAO();
            String lecturer_id = (String) session.getAttribute("lecturer_id");
            int admin = lecturerDAO.administrator(lecturer_id, 1);
            if (admin == 1) {
        %>
            <div style="text-align: right; width: 100%; padding: 0;">
                <a href="addClass.jsp" class="btn btn-primary">과목추가</a>
            </div>
        <%
            }
        %>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


</body>
</html>

