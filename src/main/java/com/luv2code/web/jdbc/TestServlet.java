package com.luv2code.web.jdbc;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "TestServlet", value = "/TestServlet")
public class TestServlet extends HttpServlet {
    @Resource(name="jdbc/web_student_tracker")
    private DataSource dataSource;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Set up the printwriter
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");
        // 2. get a connection to the database
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        try {
            myConn = dataSource.getConnection();
            // 3. Create a SQL statements
            String sql = "select * from student";
            myStmt = myConn.createStatement();
            // 4. Execute SQL query
            myRs = myStmt.executeQuery(sql);
            // 5. Process the result set
            while(myRs.next()) {
                String email = myRs.getString("email");
                out.println(email);
            }
        }
        catch (Exception exc) {
            exc.printStackTrace();
        }

    }
}