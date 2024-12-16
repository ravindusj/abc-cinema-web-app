<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<html>
<head>
    <title>Movie Seat Booking</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        let selectedSeats = [];
        let maxSeats = 0;
        let bookedSeats = [];

        function toggleSeat(seat) {
            if (bookedSeats.includes(seat)) {
                return;
            }

            const seatIndex = selectedSeats.indexOf(seat);
            const seatDiv = document.getElementById(seat);

            if (seatIndex === -1) {
                selectedSeats.push(seat);
                seatDiv.classList.remove("bg-gray-500");
                seatDiv.classList.add("bg-violet-950");
            } else {
                selectedSeats.splice(seatIndex, 1);
                seatDiv.classList.remove("bg-violet-950");
                seatDiv.classList.add("bg-gray-500");
            }

            maxSeats = selectedSeats.length;
            document.getElementById("selectedSeats").value = selectedSeats.join(",");
            updateTicketLimits();
        }

        function updateTicketLimits() {
            const adultsInput = document.getElementById("adults");
            const childrenInput = document.getElementById("children");
            adultsInput.max = maxSeats;
            childrenInput.max = maxSeats;
            validateInputs();
        }

        function validateInputs() {
            const adultsInput = document.getElementById("adults");
            const childrenInput = document.getElementById("children");

            const adults = parseInt(adultsInput.value || 0, 10);
            const children = parseInt(childrenInput.value || 0, 10);

            if (adults + children > maxSeats) {
                if (adults > maxSeats) {
                    adultsInput.value = maxSeats;
                } else {
                    childrenInput.value = maxSeats - adults;
                }
            }
        }

        window.onload = function() {
            <%
            String[] bookedSeats = new String[0];
            String bookedSeatsText = "None";
try {
Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/nowshowing", "user", "user");
    PreparedStatement pst = conn.prepareStatement("SELECT booked_seats FROM bookings WHERE movie_name = ?");
    pst.setString(1, "Pushpa 2: The Rule");
    ResultSet rs = pst.executeQuery();

    if (rs.next()) {
    bookedSeatsText = rs.getString("booked_seats").replaceAll("\\s+", "");
    bookedSeats = bookedSeatsText.split(",");
}
    conn.close();
}
catch (Exception e) {
    e.printStackTrace();
    bookedSeatsText = "Error retrieving booked seats: " + e.getMessage();
}
            %>
            bookedSeats = <%= new com.google.gson.Gson().toJson(bookedSeats) %>;

            bookedSeats.forEach(seat => {
                const seatDiv = document.getElementById(seat);
                if (seatDiv) {
                    seatDiv.classList.remove('bg-gray-500', 'cursor-pointer');
                    seatDiv.classList.add('bg-red-500', 'cursor-not-allowed');
                    seatDiv.onclick = null;
                }
            });
        }
    </script>
</head>
<body class="bg-gray-900 text-gray-200 font-poppins">
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
%>

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

  <div style="padding-top: 99px;" class="text-white min-h-screen flex flex-col items-center">
        <h2 class="text-2xl font-semibold tracking-tight text-left mb-6 text-white">Choose a Seat</h2>
    <div class="mb-4 text-center">
        <h2 class="text-lg font-semibold"><%= selectedMovie %></h2>
        <p><%= selectedCinema %> - <%= selectedDate %> - <%= selectedTime %></p>
    </div>

    <div class="pt-6 mb-6 w-3/5">
        <div class="bg-gray-700 text-white text-center py-2 font-semibold">SCREEN</div>
    </div>

    <div class="grid grid-cols-10 gap-5 mb-4">
        <%
            String[] seats = {"A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10",
                    "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10",
                    "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10",
                    "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10",
                    "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10",
                    "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"};
            for (String seat : seats) {
        %>
        <div id="<%= seat %>"
             class="w-16 h-10 bg-gray-500 rounded cursor-pointer text-center flex items-center justify-center hover:bg-violet-950"
             onclick="toggleSeat('<%= seat %>')">
            <%= seat %>
        </div>
        <% } %>
    </div>

    <div class="flex justify-center gap-4 mb-4">
        <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-gray-500"></div>
            <span>Available</span>
        </div>
        <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-violet-950"></div>
            <span>Selected</span>
        </div>
        <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-red-500"></div>
            <span>Unavailable</span>
        </div>
    </div>

    <form action="SeatServlet" method="post" class="flex flex-col items-center">
        <input type="hidden" id="selectedSeats" name="selectedSeats" value="">

        <div class="flex flex-col items-center gap-6 pt-6">
            <div class="flex items-center gap-4">
                <label for="adults" class="font-medium">Adults</label>
                <label for="adults">1150LKR</label>
                <input type="number" id="adults" name="adults" class="w-16 text-black text-center" min="0" value="0"
                       oninput="validateInputs()">
            </div>

            <div class="flex items-center gap-4">
                <label for="children" class="font-medium">Children</label>
                <label for="children">750LKR</label>
                <input type="number" id="children" name="children" class="w-16 text-black text-center" min="0" value="0"
                       oninput="validateInputs()">
            </div>
        </div>
        <div style="width:400px;" class="pt-9">
        <button type="submit" class="bg-violet-950 text-white px-4 py-2 font-medium w-full rounded-lg hover:border hover:border-white" onclick="validateInputs()">Checkout</button>
        </div>
    </form>
</div>
</body>
</html>