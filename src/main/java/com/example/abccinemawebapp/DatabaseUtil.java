package com.example.abccinemawebapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DatabaseUtil {

    public static List<String> getMovieNames() {
        List<String> movieNames = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            String url = "jdbc:mariadb://localhost:3306/nowshowing";
            String user = "user";
            String password = "user";
            conn = DriverManager.getConnection(url, user, password);

            stmt = conn.createStatement();
            String sql = "SELECT title FROM films";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                movieNames.add(rs.getString("title"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return movieNames;
    }
}