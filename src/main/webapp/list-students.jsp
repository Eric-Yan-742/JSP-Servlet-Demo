<%--
  Created by IntelliJ IDEA.
  User: yyq20
  Date: 2023/9/8
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.luv2code.web.jdbc.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Students Tracker App</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<body>
<div id="wrapper">
    <div id="header">
        <h2>FooBar University</h2>
    </div>
    <div id="container">
        <!-- put new button: Add Student, class is CSS style -->
        <input type="button" value="Add Student"
            onclick="window.location.href='add-student-form.jsp'; return false"
            class="add-student-button"
        />
        <div id="content">
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="tempStudent" items="${STUDENT_LIST}">
                    <!-- set up a link for each student -->
                    <c:url var="tempLink" value="StudentControllerServlet">
                        <c:param name="command" value="LOAD"/>
                        <c:param name="studentID" value="${tempStudent.id}"/>
                    </c:url>
                    <!-- set up a link to delete a student -->
                    <c:url var="deleteLink" value="StudentControllerServlet">
                        <c:param name="command" value="DELETE"/>
                        <c:param name="studentID" value="${tempStudent.id}"/>
                    </c:url>
                    <tr>
                        <td>${tempStudent.firstName}</td>
                        <td>${tempStudent.lastName}</td>
                        <td>${tempStudent.email}</td>
                        <td>
                            <a href="${tempLink}">Update</a>
                            |
                            <a href="${deleteLink}"
                            onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
