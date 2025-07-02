<%--
  Created by IntelliJ IDEA.
  User: rlaco
  Date: 2022-10-26
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="student.StudentDAO" %>
<%@ page import="student.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>show all</title>
</head>
<body>
<h3 style="test-align: center;">모든 사용자 정보</h3>
<div class="container">
    <div class="row">
        <table class="table" width ="750" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="text-align: center;">         </th>
                <th style="text-align: center;">  아이디  </th>
                <th style="text-align: center;">  비밀번호  </th>
                <th style="text-align: center;">  이름  </th>
                <th style="text-align: center;">  성별  </th>
                <th style="text-align: center;">  </th>
            </tr>

            </thead>
            <tbody>
            <%
                StudentDAO studentDAO = new StudentDAO();
                ArrayList<Student> list = studentDAO.showAll();

                for(int i = 0; i < list.size(); i++) {
            %>

            <tr>
                <td><%= (i + 1)%></td>
                <td><%= list.get(i).getStudent_id()%></td>
                <td><%= list.get(i).getStudent_pwd()%></td>
                <td><%= list.get(i).getStudent_name()%></td>
                <td><%= list.get(i).getStudent_gender()%></td>
                <td>
                    <input type="checkbox">
                </td>
            </tr>

            <%
                }
            %>

            </tbody>
        </table>
    </div>
</div>


</body>
</html>
