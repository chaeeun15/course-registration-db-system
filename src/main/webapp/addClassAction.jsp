<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-29
  Time: 오후 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="classTable.ClassDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="room.RoomDAO" %>
<%@ page import="time.TimeDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="classTable" class="classTable.Class" scope="page" />
<jsp:setProperty name="classTable" property="class_id" />
<jsp:setProperty name="classTable" property="course_id" />
<jsp:setProperty name="classTable" property="class_no" />
<jsp:setProperty name="classTable" property="class_name" />
<jsp:setProperty name="classTable" property="person_max" />
<jsp:setProperty name="classTable" property="room_id" />
<jsp:useBean id="room" class="room.Room" scope="page" />
<jsp:setProperty name="room" property="room_id" />
<jsp:setProperty name="room" property="occupancy" />
<jsp:useBean id="time" class="time.Time" scope="page" />
<jsp:setProperty name="time" property="begin" />
<jsp:setProperty name="time" property="end" />

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
  <title>과목추가 액션</title>
</head>
<body>
<%
  String lecturer_id = null;
  String student_id = null;
  if(session.getAttribute("lecturer_id") != null) {
    lecturer_id = (String) session.getAttribute("lecturer_id");
    student_id = (String) session.getAttribute("student_id");
  }
  if(lecturer_id == null && student_id == null) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인 하세요.')");
    script.println("location.href = 'login.jsp'");
    script.println("</script>");
  } else if (student_id != null && student_id == null) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('관리자 계정으로 로그인 하세요.')");
    script.println("location.href = 'login.jsp'");
    script.println("</script>");
  } else {
      if(classTable.getClass_id() == null ||
              classTable.getCourse_id() == null ||
              classTable.getClass_no() == null ||
              classTable.getClass_name() == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('번호, 과목번호, 학수번호, 과목이름을 필수로 채워주세요.')");
        script.println("history.back()");
        script.println("</script>");
      } else {
        ClassDAO classDAO = new ClassDAO();
        RoomDAO roomDAO = new RoomDAO();
        TimeDAO timeDAO = new TimeDAO();
        int result = classDAO.addClass(classTable.getClass_id(), classTable.getCourse_id(),
              classTable.getClass_no(), classTable.getClass_name(), classTable.getPerson_max(), classTable.getRoom_id());
        int timeResult = timeDAO.addClassTime(classTable.getClass_id(), request.getParameter("dayOfWeek"), time.getBegin(), time.getEnd());
        if(result == -1 || classTable.getPerson_max() < 0 || timeResult == -1) {
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('과목 개설에 실패했습니다. 수강 가능 인원이 0 이상인지 확인해주십시오')");
          script.println("history.back()");
          script.println("</script>");
          classDAO.delete(classTable.getClass_id());
        } else if (classTable.getPerson_max() > roomDAO.roomOccupancy(room.getRoom_id())) {
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('수강 정원이 강의실 수용 인원보다 초과할 경우 과목 개설이 불가능합니다.')");
          script.println("history.back()");
          script.println("</script>");
          classDAO.delete(classTable.getClass_id());
        } else if (timeDAO.getDayOfWeek(request.getParameter("dayOfWeek")) == "일요일") {
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('일요일에는 과목 개설이 불가능합니다.')");
          script.println("history.back()");
          script.println("</script>");
          classDAO.delete(classTable.getClass_id());
        } else if (timeDAO.getDayOfWeek(request.getParameter("dayOfWeek")) == "토요일") {
          //TODO: 토요일이거나 18시 이후의 수업은 E러닝 강좌
        } else {
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('과목이 추가되었습니다.')");
          script.println("location.href = 'searchCourse.jsp'");
          script.println("</script>");
        }
      }
  }
%>

</body>
</html>
