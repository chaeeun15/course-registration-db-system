<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-26
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="student.StudentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="student" class="student.Student" scope="page" />
<jsp:setProperty name="student" property="student_id" />
<jsp:setProperty name="student" property="student_pwd" />
<jsp:setProperty name="student" property="student_name" />
<jsp:setProperty name="student" property="student_gender" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>회원가입 액션</title>
</head>
<body>
<%
    String student_id = null;
    if(session.getAttribute("student_id") != null)
    {
        student_id = (String) session.getAttribute("student_id");
    }
    if(student_id != null)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어있습니다.')");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    }

    if(student.getStudent_id() == null ||
            student.getStudent_pwd() == null ||
            student.getStudent_name() == null ||
            student.getStudent_gender() == null)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('모든 칸을 채워주세요.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else
    {
        StudentDAO studentDAO = new StudentDAO();
        int result = studentDAO.join(student);

        if(result == -1)
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else
        {
            session.setAttribute("student_id", student.getStudent_id());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인페이지로 이동합니다.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        }
    }
%>

</body>
</html>
