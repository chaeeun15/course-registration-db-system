<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-29
  Time: 오후 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <form method="post" action="addClassAction.jsp">
      <table class="table table-outer" style="text-align: center; border: 1px solid #dddddd; width: 100%">
        <thead>
        <tr>
          <th colspan="4" style="background-color: #eeeeee; text-align: center;">과목 추가 양식</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td><input type="text" class="form-control" placeholder="번호" name="class_id" maxlength="20"></td>
          <td><input type="text" class="form-control" placeholder="학수번호" name="course_id" maxlength="20"></td>
          <td><input type="text" class="form-control" placeholder="과목번호" name="class_no" maxlength="20"></td>
          <td><input type="text" class="form-control" placeholder="교과목명" name="class_name" maxlength="40"></td>
        </tr>
        <tr>
          <td><input type="text" class="form-control" placeholder="수강 가능 인원" name="person_max" maxlength="20"></td>
          <td><input type="text" class="form-control" placeholder="강의실 번호" name="room_id" maxlength="20"></td>
          <td><input type="text" class="form-control" placeholder="날짜(yyyy-mm-dd)" name="dayOfWeek" maxlength="20"></td>
        </tr>
        <tr>
          <td><input type="text" class="form-control" placeholder="시작 시간(hh:mm)" name="begin" maxlength="20"></td>
          <td><input type="text" class="form-control" placeholder="종료 시간(hh:mm)" name="end" maxlength="20"></td>
        </tr>
        </tbody>
      </table>
      <div style="text-align: right; width: 100%; padding: 0;">
        <input type="submit" class="btn btn-primary" value="과목 추가">
      </div>
    </form>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


</body>
</html>

