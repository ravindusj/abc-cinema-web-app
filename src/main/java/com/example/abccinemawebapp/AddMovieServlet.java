package com.example.abccinemawebapp;

import java.io.*;
import java.sql.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "addMovieServlet", value = "/addMovieServlet")
public class AddMovieServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/nowshowing";
    private static final String DB_USERNAME = "user";
    private static final String DB_PASSWORD = "user";

    private static final String INSERT_MOVIE_SQL = "INSERT INTO films (title, description, image_url, cast, release_date, categories, film_language) VALUES (?, ?, ?, ?, ?, ?, ?)";

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load JDBC driver: " + ex.getMessage());
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");
        String cast = request.getParameter("cast");
        String releaseDate = request.getParameter("releaseDate");
        String categories = request.getParameter("categories");
        String filmLanguage = request.getParameter("filmLanguage");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MOVIE_SQL)) {

            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, imageUrl);
            preparedStatement.setString(4, cast);
            preparedStatement.setString(5, releaseDate);
            preparedStatement.setString(6, categories);
            preparedStatement.setString(7, filmLanguage);

            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                out.println("<html><body>");
                out.println("<h1>Movie Added Successfully!</h1>");
                out.println("<p><a href='movies.jsp'>Go to Movie List</a></p>");
                out.println("</body></html>");
            } else {
                out.println("<html><body>");
                out.println("<h1>Failed to Add Movie!</h1>");
                out.println("<p><a href='addMovie.jsp'>Try Again</a></p>");
                out.println("</body></html>");
            }

        } catch (SQLException e) {
            out.println("<html><body>");
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
            out.println("<p><a href='addMovie.jsp'>Try Again</a></p>");
            out.println("</body></html>");
        }
    }
}