<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Buy Tickets</title>
    <script>
        // Function to select a new option
        function selectOption(type, value, event) {
        // Update the hidden input value and display text
        document.getElementById(type + "-input").value = value;
        document.getElementById(type + "-display").innerText = value;

        // Special handling for each selection type
        if (type === 'date') {
        // Get all date buttons
        const dateButtons = document.querySelectorAll('#date-selection button');

        // Remove 'selected' state from all date buttons
        dateButtons.forEach(button => {
        button.classList.remove('bg-yellow-500', 'text-gray-900');
        button.classList.add('bg-gray-800', 'text-white');
        });

        // Highlight the currently selected date button
        event.target.classList.remove('bg-gray-800', 'text-white');
        event.target.classList.add('bg-yellow-500', 'text-gray-900');

        // Show movie selection after date selection
        showSection('movie-selection');
        } else if (type === 'movie') {
        // Get all movie buttons
        const movieButtons = document.querySelectorAll('#movie-selection button');

        // Reset movie buttons
        movieButtons.forEach(button => {
        button.classList.remove('bg-yellow-500', 'text-gray-900');
        button.classList.add('bg-gray-800', 'text-white');
        });

        // Highlight the selected movie button
        event.target.classList.remove('bg-gray-800', 'text-white');
        event.target.classList.add('bg-yellow-500', 'text-gray-900');

        // Show cinema selection after movie selection
        showSection('cinema-selection');
        } else if (type === 'cinema') {
        // Get all cinema buttons
        const cinemaButtons = document.querySelectorAll('#cinema-selection button');

        // Reset cinema buttons
        cinemaButtons.forEach(button => {
        button.classList.remove('bg-yellow-500', 'text-gray-900');
        button.classList.add('bg-gray-800', 'text-white');
        });

        // Highlight the selected cinema button
        event.target.classList.remove('bg-gray-800', 'text-white');
        event.target.classList.add('bg-yellow-500', 'text-gray-900');

        // Show time selection after cinema selection
        showSection('time-selection');
        } else if (type === 'time') {
        // Get all time buttons
        const timeButtons = document.querySelectorAll('#time-selection button');

        // Reset time buttons
        timeButtons.forEach(button => {
        button.classList.remove('bg-yellow-500', 'text-gray-900');
        button.classList.add('bg-gray-800', 'text-white');
        });

        // Highlight the selected time button
        event.target.classList.remove('bg-gray-800', 'text-white');
        event.target.classList.add('bg-yellow-500', 'text-gray-900');
        }
        }

        // Function to show the next selection section
        function showSection(sectionId) {
        // Hide all sections
        const sections = ['movie-selection', 'cinema-selection', 'time-selection'];
        sections.forEach(section => {
        document.getElementById(section).classList.add('hidden');
        });

        // Show the target section
        document.getElementById(sectionId).classList.remove('hidden');
        }

        // Submit the selection form
        function submitSelection() {
        document.getElementById("selection-form").submit();
        }

        // Initialize the page
        window.onload = function() {
        // Hide all selection sections except date
        const sections = ['movie-selection', 'cinema-selection', 'time-selection'];
        sections.forEach(section => {
        document.getElementById(section).classList.add('hidden');
        });
        }
        </script>
    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-gray-900 text-gray-200">

<section class="max-w-4xl mx-auto pt-16 px-4 pb-12">
    <h1 class="text-3xl font-bold text-center mb-8">Buy Tickets</h1>


    <div class="flex justify-between items-center mb-10 text-gray-400">
        <span class="text-yellow-500 font-semibold">Pick a Movie</span>
        <span>Your Details</span>
        <button onclick="window.location.href='pick_a_seat.jsp';">Pick a Seat</button>

        <span>Summary</span>
    </div>


        <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a date</h2>
        <div class="flex space-x-4">
            <button class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-yellow-500">Today</button>
            <button class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700">Thu, 14 Nov</button>
            <button class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700">Sat, 16 Nov</button>
            <button class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700">Sun, 17 Nov</button>
        </div>
    <!-- Selection Form -->
    <form id="selection-form" action="processSelection.jsp" method="POST">
        <!-- Hidden Inputs -->
        <input type="hidden" id="date-input" name="selectedDate">
        <input type="hidden" id="movie-input" name="selectedMovie">
        <input type="hidden" id="cinema-input" name="selectedCinema">
        <input type="hidden" id="time-input" name="selectedTime">

        <!-- Date Selection -->
        <div class="mb-8" id="date-selection">
            <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a Date</h2>
            <div class="flex space-x-4">
                <%
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, dd MMM");
                    java.util.Calendar cal = java.util.Calendar.getInstance();
                    for (int i = 0; i < 4; i++) {
                        String date = sdf.format(cal.getTime());
                %>
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('date', '<%= date %>', event)"><%= date %></button>
                <%
                        cal.add(java.util.Calendar.DATE, 1);
                    }
                %>
            </div>

        </div>


    <div class="flex justify-between">
        <button class="px-6 py-2 text-yellow-500 border border-yellow-500 rounded-lg hover:bg-yellow-500 hover:text-gray-900">Previous</button>
        <button class="px-6 py-2 bg-yellow-500 text-gray-900 font-semibold rounded-lg hover:bg-yellow-600">Next</button>
    </div>

        <!-- Movie Selection -->
        <div class="mb-8 hidden" id="movie-selection">
            <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a Movie</h2>
            <div class="flex space-x-4">
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('movie', 'Movie 1', event)">Movie 1</button>
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('movie', 'Movie 2', event)">Movie 2</button>
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('movie', 'Movie 3', event)">Movie 3</button>
            </div>
        </div>

        <!-- Cinema Hall Selection -->
        <div class="mb-8 hidden" id="cinema-selection">
            <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a Cinema Hall</h2>
            <div class="flex space-x-4">
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('cinema', 'Hall 1', event)">Hall 1</button>
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('cinema', 'Hall 2', event)">Hall 2</button>
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('cinema', 'Hall 3', event)">Hall 3</button>
            </div>
        </div>

        <div class="mb-8 hidden" id="time-selection">
            <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a Time</h2>
            <div class="flex space-x-4">
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('time', '10:00 AM', event)">10:00 AM</button>
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('time', '2:00 PM', event)">2:00 PM</button>
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                        onclick="selectOption('time', '6:00 PM', event)">6:00 PM</button>
            </div>
        </div>

        <!-- Display Selection -->
        <div class="mb-8">
            <h2 class="text-lg font-semibold text-gray-300 mb-4">Your Selection</h2>
            <p>Date: <span id="date-display" class="text-yellow-500">Not Selected</span></p>
            <p>Movie: <span id="movie-display" class="text-yellow-500">Not Selected</span></p>
            <p>Cinema Hall: <span id="cinema-display" class="text-yellow-500">Not Selected</span></p>
            <p>Time: <span id="time-display" class="text-yellow-500">Not Selected</span></p>
        </div>

        <!-- Submit Button -->
        <div class="flex justify-center">
            <button type="button" class="px-6 py-2 bg-yellow-500 text-gray-900 font-semibold rounded-lg hover:bg-yellow-600"
                    onclick="submitSelection()">Confirm Selection</button>
        </div>
    </form>

</section>

</body>
</html>