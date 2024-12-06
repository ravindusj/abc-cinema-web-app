<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Movie</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    function openModal(title, description, cast) {
      document.getElementById('modal-title').innerText = title;
      document.getElementById('modal-description').innerHTML = "<strong>Synopsis</strong><br/>" + description;
      document.getElementById('modal-cast').innerHTML = "<strong>Cast</strong><br/>" + cast;
      document.getElementById('modal').classList.remove('hidden');
    }

    function closeModal() {
      document.getElementById('modal').classList.add('hidden');
    }
  </script>
</head>
<body class="bg-gray-900 text-gray-200">

<h2 class="text-2xl font-bold text-center mb-6 pt-9">Now Showing</h2>

<%
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;

  try {
    Class.forName("org.mariadb.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/nowshowing", "user", "user");
    stmt = conn.createStatement();
    String sql = "SELECT * FROM films";
    rs = stmt.executeQuery(sql);
    int count = 0;

%>

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4" style="width: 80vw; margin: auto">

  <%
  while (rs.next()) {
  count++;
  %>
  <div class="bg-gray-800 rounded-lg overflow-hidden shadow-md m-4 w-full cursor-pointer"
       onclick="openModal('<%= rs.getString("title") %>',
               '<%= rs.getString("description").replace("'", "\\'") %>',
               '<%= rs.getString("cast").replace("'", "\\'") %>')">
  <img src="<%= rs.getString("image_url") != null ? rs.getString("image_url") : "default.jpg" %>" alt="<%= rs.getString("title") %>" class="w-full h-60 object-cover">
  <div class="p-4">
    <h3 class="text-lg font-semibold text-yellow-500"><%= rs.getString("title") %></h3>
    <p class="text-gray-400 text-sm mt-2"><strong>Release Date:</strong> <%= rs.getDate("release_date") %></p>
    <p class="text-gray-400 text-sm mt-2"><strong>Categories:</strong> <%= rs.getString("categories") %></p>
    <p class="text-gray-400 text-sm mt-2"><strong>Language:</strong> <%= rs.getString("film_language") %></p>
  </div>
</div>

<%
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } catch (Exception e) {
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
%>

</div>

<div id="modal" class="bg-black bg-opacity-50 hidden flex justify-center items-center">
  <div class="bg-gray-900 p-8 rounded-lg w-96">
    <h3 id="modal-title" class="text-xl font-semibold text-yellow-500 mb-4"></h3>
    <p id="modal-description" class="text-gray-400 mb-4 text-sm"></p>
    <p id="modal-cast" class="text-gray-400 text-sm"></p>
    <div class="flex justify-between pt-9">
      <button class="bg-white text-gray-900 px-4 py-2 rounded" onclick="closeModal()">Close</button>
     <a href="buyTickets.jsp">
      <button class="bg-yellow-500 text-gray-900 px-4 py-2 rounded font-medium">Buy Ticket</button>
     </a>
    </div>
  </div>
</div>

</body>
</html>