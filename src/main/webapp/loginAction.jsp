<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-26
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="student.StudentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="lecturer.LecturerDAO" %>
<%@ page import="lecturer.Lecturer" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="student" class="student.Student" scope="page" />
<jsp:setProperty name="student" property="student_id" />
<jsp:setProperty name="student" property="student_pwd" />
<jsp:useBean id="lecturer" class="lecturer.Lecturer" scope="page" />
<jsp:setProperty name="lecturer" property="lecturer_id" />
<jsp:setProperty name="lecturer" property="lecturer_pwd" />
<jsp:setProperty name="lecturer" property="administrator" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>로그인 액션</title>
</head>
<body>
<%
    String student_id = null;
    String lecturer_id = null;

    if(session.getAttribute("student_id") != null) {
        student_id = (String) session.getAttribute("student_id");
    }

    if(student_id != null || lecturer_id != null) //이미 로그인되어 있는 회원은 다시 로그인 할 수 없음.
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어있습니다.')");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    }

    LecturerDAO lecturerDAO = new LecturerDAO();
    int lecturer_result = lecturerDAO.login(student.getStudent_id(), student.getStudent_pwd());

    StudentDAO studentDAO = new StudentDAO();
    int student_result = studentDAO.login(student.getStudent_id(), student.getStudent_pwd());

    if (student_result == 1) { // 학생으로 로그인
        session.setAttribute("student_id", student.getStudent_id()); //학생 계정의 세션값
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    } else if (lecturer_result == 1) { // 교강사(관리자)로 로그인
        session.setAttribute("lecturer_id", student.getStudent_id()); //관리자 계정의 세션값
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    } else if (student_result == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else if (lecturer_result == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else if (student_result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디입니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else if (lecturer_result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디입니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else if (student_result == -2) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else if (lecturer_result == -2) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }

%>

</body>
</html>