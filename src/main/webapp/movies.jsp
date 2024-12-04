<%@ page import="java.sql.*, java.util.*" %>
<%
  // Database connection setup
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdb", "username", "password");
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery("SELECT * FROM films");

  while (rs.next()) {
%>
<div class="bg-gray-800 rounded-lg overflow-hidden shadow-md">
  <img src="<%= rs.getString("image_url") %>" alt="<%= rs.getString("title") %>" class="w-full h-60 object-cover">
  <div class="p-4">
    <h3 class="text-lg font-semibold text-white"><%= rs.getString("title") %></h3>
    <p class="text-gray-400 text-sm mt-2"><%= rs.getString("description") %></p>
    <p class="text-gray-400 text-sm mt-2"><strong>Cast:</strong> <%= rs.getString("cast") %></p>
    <p class="text-gray-400 text-sm mt-2"><strong>Release Date:</strong> <%= rs.getDate("release_date") %></p>
    <p class="text-gray-400 text-sm mt-2"><strong>Categories:</strong> <%= rs.getString("categories") %></p>
    <p class="text-gray-400 text-sm mt-2"><strong>Language:</strong> <%= rs.getString("language") %></p>
  </div>
</div>
<%
  }
  rs.close();
  stmt.close();
  conn.close();
%>
