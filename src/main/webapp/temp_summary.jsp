<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
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
                seatDiv.classList.remove("bg-blue-500");
                seatDiv.classList.add("bg-yellow-500");
            } else {
                selectedSeats.splice(seatIndex, 1);
                seatDiv.classList.remove("bg-yellow-500");
                seatDiv.classList.add("bg-blue-500");
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
    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/seats", "user", "user");
    PreparedStatement pst = conn.prepareStatement("SELECT booked_seats FROM bookings WHERE movie_name = ?");
    pst.setString(1, "Gladiator II");
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
                    seatDiv.classList.remove('bg-blue-500', 'cursor-pointer');
                    seatDiv.classList.add('bg-red-500', 'cursor-not-allowed');
                    seatDiv.onclick = null;
                }
            });
        }
    </script>
</head>
<body>
<div class="bg-black text-white min-h-screen flex flex-col items-center p-6 pt-10">
    <h1 class="text-2xl font-bold mb-4">Pick a Seat</h1>
    <div class="mb-4 text-center">
        <h2 class="text-xl font-semibold">Gladiator II</h2>
        <p>C2 - 04-12-2024 - Wednesday at 3:45 PM</p>
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
             class="w-16 h-10 bg-blue-500 rounded cursor-pointer text-center flex items-center justify-center hover:bg-yellow-500"
             onclick="toggleSeat('<%= seat %>')">
            <%= seat %>
        </div>
        <% } %>
    </div>

    <div class="flex justify-center gap-4 mb-4">
        <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-blue-500"></div>
            <span>Available</span>
        </div>
        <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-yellow-500"></div>
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

        <button type="submit" class="bg-yellow-500 px-4 py-2 rounded mt-9" onclick="validateInputs()">Continue for Summary</button>
    </form>
</div>
</body>
</html>