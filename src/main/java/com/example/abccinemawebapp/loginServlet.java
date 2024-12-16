package com.example.abccinemawebapp;

import java.io.*;
import java.sql.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mariadb://localhost:3306/nowshowing";
    private static final String DB_USERNAME = "user";
    private static final String DB_PASSWORD = "user";

    private static final String LOGIN_SQL = "SELECT password FROM user WHERE username = ?";

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Class.forName("org.mariadb.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load JDBC driver: " + ex.getMessage());
            return;
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_SQL)) {

            preparedStatement.setString(1, username);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String storedPassword = rs.getString("password");

                if (storedPassword.equals(password)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);

                    response.sendRedirect("/abc_cinema_web_app_war_exploded/admin/add-movie.jsp");
                } else {
                    out.println("<html><body>");
                    out.println("<p>Invalid username or password. Please try again.</p>");
                    out.println("</body></html>");
                }

            } else {
                out.println("<html><body>");
                out.println("<p>User not found. Please try again.</p>");
                out.println("</body></html>");
            }

        } catch (SQLException e) {
            out.println("<html><body>");
            out.println("<p>Database error. Please try again later.</p>");
            out.println("</body></html>");
        }
    }
}
