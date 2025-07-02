<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-11-08
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="classTable.ClassDAO" %>
<%@ page import="classTable.Class" %>
<%@ page import="time.Time" %>
<%@ page import="time.TimeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

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
    }

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
    } else if (student_id != null && student_id == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('관리자 계정으로 로그인 하세요.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
    } else {
        ClassDAO classDAO = new ClassDAO();
        TimeDAO timeDAO = new TimeDAO();
        int result = classDAO.delete(classTable.getClass_id());
        int resultClassTime = timeDAO.delete(classTable.getClass_id());
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('과목 폐강에 실패했습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('과목이 폐강되었습니다.')");
            script.println("location.href = 'searchCourse.jsp'");
            script.println("</script>");
        }
    }
%>

</body>
</html>
