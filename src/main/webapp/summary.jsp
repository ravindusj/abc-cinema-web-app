<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booking Summary - ABC Cinema</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white min-h-screen flex flex-col items-center justify-center">
<%
  Cookie[] cookies = request.getCookies();
  String selectedDate = "";
  String selectedMovie = "";
  String selectedCinema = "";
  String selectedTime = "";
  String userName = "";
  String userEmail = "";

  if (cookies != null) {
    for (Cookie cookie : cookies) {
      switch (cookie.getName()) {
        case "selectedDate":
          selectedDate = URLDecoder.decode(cookie.getValue(), "UTF-8");
          break;
        case "selectedMovie":
          selectedMovie = URLDecoder.decode(cookie.getValue(), "UTF-8");
          break;
        case "selectedCinema":
          selectedCinema = URLDecoder.decode(cookie.getValue(), "UTF-8");
          break;
        case "selectedTime":
          selectedTime = URLDecoder.decode(cookie.getValue(), "UTF-8");
          break;
        case "userName":
          userName = URLDecoder.decode(cookie.getValue(), "UTF-8");
          break;
        case "userEmail":
          userEmail = URLDecoder.decode(cookie.getValue(), "UTF-8");
          break;
      }
    }
  }
  session.setAttribute("userEmail", userEmail);
%>
<div class="bg-gray-800 rounded-lg shadow-lg p-8 w-full max-w-md text-center">
  <h1 class="text-3xl font-bold mb-6 text-yellow-300">Booking Summary</h1>

  <div class="mb-4">
    <h2 class="text-xl font-semibold mb-2"><span class="text-yellow-300"><%= selectedMovie %></span></h2>
    <p class="text-gray-400">Date: <span class="text-white"><%= selectedDate %></span></p>
    <p class="text-gray-400">Time: <span class="text-white"><%= selectedTime %></span></p>
    <p class="text-gray-400">Cinema Hall: <span class="text-white"><%= selectedCinema %></span></p>
  </div>

  <div class="mb-4">
    <h2 class="font-semibold mb-2">Customer Details</h2>
    <p class="text-gray-400">Name: <span class="text-white"><%= userName %></span></p>
    <p class="text-gray-400">Email: <span class="text-white"><%= userEmail %></span></p>
  </div>

  <div class="mb-4">
    <p class="mb-2"><strong>Selected Seats:</strong></p>
    <div class="flex flex-wrap justify-center gap-2">
      <span class="bg-gray-300 text-black px-3 py-1 rounded-lg"> ${selectedSeats}</span>
    </div>
  </div>

  <div class="mb-4">
    <p><strong>Adult Tickets: </strong>${adultTickets}</p>
    <p><strong>Child Tickets: </strong>${childTickets}</p>
  </div>

  <div class="bg-gray-700 p-4 rounded-lg">
    <p class="text-xl font-bold text-yellow-400">Total Cost:</p>
    <p class="text-2xl font-medium"> ${totalCost} LKR</p>
  </div>

  <div class="mt-6 flex justify-center gap-4">
    <a href="temp_pick_a_seat.jsp" class="hover:bg-violet-950 text-white border border-white px-4 py-2 font-medium rounded-lg hover:border-0">
      Back to Seat Selection
    </a>

    <form action="PaymentServ" method="post">
      <input type="hidden" name="movieName" value="<%= selectedMovie %>">
      <input type="hidden" name="totalCost" value="${totalCost}">
      <button type="submit" class="bg-violet-950 text-white px-4 py-2 font-medium w-full rounded-lg hover:border hover:border-white">
        Proceed to Payment
      </button>
    </form>
  </div>
</div>
</body>
</html>