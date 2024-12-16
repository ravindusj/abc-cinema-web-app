<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Now Showing Films</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

  <script>
    function openModal(title, description, cast, trailer) {
      document.getElementById('modal-title').innerText = title;


        document.getElementById('modal-trailer').innerHTML = `
      <iframe width="560" height="315" src="https://www.youtube.com/embed/${trailer}?si=M4tu8n8Da8M3Jixx"
              title="YouTube video player" frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
      </iframe>`;


      document.getElementById('modal-description').innerHTML = "<strong>Synopsis</strong><br/>" + description;
      document.getElementById('modal-cast').innerHTML = "<strong>Cast</strong><br/>" + cast;
      document.getElementById('modal').classList.remove('hidden');
    }


    function closeModal() {
      document.getElementById('modal').classList.add('hidden');
    }
  </script>
</head>
<style>
  body {
    font-family: 'Poppins', sans-serif;
  }
</style>
<body class="bg-gray-900 text-gray-200">

<nav id="navbar" class="bg-black/75 px-6 py-4 fixed w-8/12 top-2 left-1/2 transform -translate-x-1/2 z-50 rounded-lg shadow-lg transition-all duration-500 ease-in-out">
  <div class="flex items-center justify-between max-w-7xl mx-auto w-full">
    <div class="text-white text-2xl font-bold uppercase">ABC Cinema</div>

    <ul class="flex items-center space-x-8">
      <li><a href="index.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Home</a></li>
      <li><a href="movies.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Movies</a></li>
      <li><a href="cinemas.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Cinemas</a></li>
      <li><a href="contactus.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Contact Us</a></li>
      <li><a href="temp_buyTicket.jsp" class="bg-violet-950 text-white font-normal text-sm px-4 py-2 rounded">Buy Tickets</a></li>
    </ul>
  </div>
</nav>

<script>
  let lastScrollTop = 0;
  const navbar = document.getElementById('navbar');

  window.addEventListener('scroll', () => {
    const currentScroll = window.pageYOffset || document.documentElement.scrollTop;

    if (currentScroll > lastScrollTop) {
      navbar.style.top = '-100px';
    } else {
      navbar.style.top = '0.5rem';
    }

    lastScrollTop = currentScroll <= 0 ? 0 : currentScroll;
  });
</script>

<%!
  private Connection getConnection() throws SQLException, ClassNotFoundException {
    Class.forName("org.mariadb.jdbc.Driver");

    String url = "jdbc:mariadb://localhost:3306/nowshowing";
    String user = "user";
    String password = "user";

    return DriverManager.getConnection(url, user, password);
  }
%>

<div class="mx-auto w-8/12" style="padding-top: 99px;">
  <h2 class="text-2xl font-semibold tracking-tight text-center mb-6 text-white">Now Showing</h2>

  <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
      conn = getConnection();

      stmt = conn.createStatement();
      String sql = "SELECT * FROM films";
      rs = stmt.executeQuery(sql);

      if (!rs.isBeforeFirst()) {
  %>
  <div class="text-center text-red-500 text-xl">
    No films are currently available.
  </div>
  <%
  } else {
  %>
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-4 gap-4">
    <%
      while (rs.next()) {
        String title = rs.getString("title") != null ? rs.getString("title") : "Unknown Title";
        String description = rs.getString("description") != null ? rs.getString("description") : "No description available";
        String imageUrl = rs.getString("imageUrl") != null ? rs.getString("imageUrl") : "default.jpg";
        String cast = rs.getString("cast") != null ? rs.getString("cast") : "Cast not specified";
        String releaseDate = rs.getString("releaseDate") != null ? rs.getString("releaseDate") : "TBA";
        String categories = rs.getString("categories") != null ? rs.getString("categories") : "Not categorized";
        String language = rs.getString("language") != null ? rs.getString("language") : "Unknown";
        String trailer = rs.getString("trailer") != null ? rs.getString("trailer") : "";
    %>
    <div>
    <div class="bg-gray-800 shadow-md m-4 cursor-pointer card" style="width: 16rem; border-radius: 5px">
      <img src="<%= imageUrl %>"
           alt="<%= title %>"
           class="" style="width: 16rem; border-radius: 4px">

    </div>
    <div class="p-4 pt-0">
      <h3 class="font-semibold text-white"><%= title %></h3>
      <div class="flex justify-between text-gray-400 text-sm mt-2">
        <p> <%= releaseDate %></p>
        <p><%= categories %></p>
        <p><%= language %></p>
      </div>
      <div class="w-full" style="margin-top: 19px; width: 16rem">
      <a href="temp_buyTicket.jsp">
        <button class="hover:bg-violet-950 hover:border-none border border-white text-white px-4 py-2 font-medium w-full" style="border-radius: 5px">Buy Ticket</button>
      </a>
      </div>
    </div>
  </div>
    <%
      }
    %>
  </div>
  <%
    }
  } catch (ClassNotFoundException e) {
  %>
  <div class="text-center text-red-500 text-xl">
    Database Driver Error: <%= e.getMessage() %>
    <p class="text-sm text-gray-400">Please ensure the MariaDB JDBC driver is in your classpath.</p>
  </div>
  <%
  } catch (SQLException e) {
  %>
  <div class="text-center text-red-500 text-xl">
    Database Connection Error
    <p class="text-sm text-gray-400">
      Error Code: <%= e.getErrorCode() %><br>
      SQL State: <%= e.getSQLState() %><br>
      Message: <%= e.getMessage() %>
    </p>
  </div>
  <%
    e.printStackTrace();
  } catch (Exception e) {
  %>
  <div class="text-center text-red-500 text-xl">
    Unexpected Error: <%= e.getMessage() %>
  </div>
  <%
  } finally {
    try {
      if (rs != null) rs.close();
      if (stmt != null) stmt.close();
      if (conn != null) conn.close();
    } catch (SQLException e) {
  %>
  <div class="text-center text-red-500 text-sm">
    Error closing database resources: <%= e.getMessage() %>
  </div>
  <%
        e.printStackTrace();
      }
    }
  %>
</div>

<div id="modal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex justify-center items-center z-50">
  <div class="bg-gray-900 p-9" style="border-radius: 9px;">
    <h3 id="modal-title" class="text-xl font-semibold text-yellow-500 mb-4"></h3>
    <div id="modal-trailer"></div>
    <p id="modal-description" class="text-gray-400 mb-4 pt-9 text-sm"></p>
    <p id="modal-cast" class="text-gray-400 text-sm"></p>
    <div class="flex justify-between pt-9">
      <button class="bg-white text-gray-900 px-4 py-2 rounded" onclick="closeModal()">Close</button>
      <a href="temp_buyTicket.jsp">
        <button class="bg-yellow-500 text-gray-900 px-4 py-2 rounded font-medium">Buy Ticket</button>
      </a>
    </div>
  </div>
</div>
</body>
</html>