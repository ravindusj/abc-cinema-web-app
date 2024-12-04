package com.example.abccinemawebapp;

import java.io.*;
import java.sql.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "addMovieServlet", value = "/addMovieServlet")
public class AddMovieServlet extends HttpServlet {

    // JDBC Connection settings
    private static final String DB_URL = "jdbc:mysql://localhost:3306/nowshowing"; // Change the database name
    private static final String DB_USERNAME = "user"; // Update your username
    private static final String DB_PASSWORD = "user"; // Update your password

    // SQL query to insert a new movie
    private static final String INSERT_MOVIE_SQL = "INSERT INTO films (title, description, image_url, cast, release_date, categories, film_language) VALUES (?, ?, ?, ?, ?, ?, ?)";

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Load the JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();  // Load MySQL driver
        } catch (Exception ex) {
            // Handle error if the driver fails to load
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load JDBC driver: " + ex.getMessage());
            return;
        }

        // Get movie data from the form submitted by the user
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");
        String cast = request.getParameter("cast");
        String releaseDate = request.getParameter("releaseDate");
        String categories = request.getParameter("categories");
        String filmLanguage = request.getParameter("filmLanguage");

        // Response output
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        // Database connection and insertion
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MOVIE_SQL)) {

            // Set the parameters in the SQL query
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, imageUrl);
            preparedStatement.setString(4, cast);
            preparedStatement.setString(5, releaseDate); // Ensure the date format is valid
            preparedStatement.setString(6, categories);
            preparedStatement.setString(7, filmLanguage);

            // Execute the update
            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                // If movie is added successfully, send a success message
                out.println("<html><body>");
                out.println("<h1>Movie Added Successfully!</h1>");
                out.println("<p><a href='movies.jsp'>Go to Movie List</a></p>");
                out.println("</body></html>");
            } else {
                // If insertion fails, send an error message
                out.println("<html><body>");
                out.println("<h1>Failed to Add Movie!</h1>");
                out.println("<p><a href='addMovie.jsp'>Try Again</a></p>");
                out.println("</body></html>");
            }

        } catch (SQLException e) {
            // Handle database errors
            out.println("<html><body>");
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
            out.println("<p><a href='addMovie.jsp'>Try Again</a></p>");
            out.println("</body></html>");
        }
    }
}
