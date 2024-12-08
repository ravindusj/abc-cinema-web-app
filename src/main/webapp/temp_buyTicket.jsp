<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buy Tickets</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script>
        // Function to toggle selection of options
        function selectOption(type, value, event) {
            const inputElement = document.getElementById(type + "-input");
            const displayElement = document.getElementById(type + "-display");
            const currentValue = inputElement.value;

            // If the selected value is the same as the current one, deselect it
            if (currentValue === value) {
                inputElement.value = ""; // Clear the hidden input value
                displayElement.innerText = "Not Selected"; // Reset the display text

                // Reset button styles
                event.target.classList.remove('bg-yellow-500', 'text-gray-900');
                event.target.classList.add('bg-gray-800', 'text-white');
            } else {
                // Update the hidden input value and display text
                inputElement.value = value;
                displayElement.innerText = value;

                // Reset all buttons in the current section
                const buttons = document.querySelectorAll(`#${type}-selection button`);
                buttons.forEach(button => {
                    button.classList.remove('bg-yellow-500', 'text-gray-900');
                    button.classList.add('bg-gray-800', 'text-white');
                });

                // Highlight the selected button
                event.target.classList.remove('bg-gray-800', 'text-white');
                event.target.classList.add('bg-yellow-500', 'text-gray-900');
            }

            // Check if all selections are made and enable/disable the Next button
            updateNextButtonStatus();
        }
        function validateAndRedirect() {
            // Perform validation logic here
            // If validation passes, redirect to the next page
            window.location.href = 'temp_your_details.jsp';
        }

        // Function to update the status of the Next button
        function updateNextButtonStatus() {
            const date = document.getElementById("date-input").value;
            const movie = document.getElementById("movie-input").value;
            const cinema = document.getElementById("cinema-input").value;
            const time = document.getElementById("time-input").value;
            const nextButton = document.getElementById("next-button");

            if (date && movie && cinema && time) {
                // Enable the Next button if all selections are made
                nextButton.disabled = false;
                nextButton.title = ""; // Remove the tooltip
            } else {
                // Disable the Next button and show the tooltip
                nextButton.disabled = true;
                nextButton.title = "Please make all selections before proceeding.";
            }
        }

        // Call the update function on page load to set the initial state
        window.onload = updateNextButtonStatus;
    </script>
</head>
<style>
    #navbar {
        font-family: 'Poppins', sans-serif;
    }
</style>
<!-- Fixed Navbar Start -->
<nav id="navbar" class="bg-black/75 px-6 py-4 fixed w-8/12 top-2 left-1/2 transform -translate-x-1/2 z-50 rounded-lg shadow-lg transition-all duration-500 ease-in-out">
    <div class="flex items-center justify-between max-w-7xl mx-auto w-full">
        <!-- Logo -->
        <div class="text-white text-2xl font-bold uppercase">ABC Cinema</div>

        <!-- Navigation Links -->
        <ul class="flex items-center space-x-8">
            <li><a href="index.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Home</a></li>
            <li><a href="temp_buyTicket.jsp" class="bg-sky-600 text-white font-normal text-sm px-4 py-2 rounded hover:bg-sky-800">Buy Tickets</a></li>
            <li><a href="movies.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Movies</a></li>
            <li><a href="cinemas.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Cinemas</a></li>
            <li><a href="contactus.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Contact Us</a></li>
        </ul>
    </div>
</nav>
<!-- Fixed Navbar End -->

<script>
    let lastScrollTop = 0;
    const navbar = document.getElementById('navbar');

    // Function to handle navbar visibility based on scroll
    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset || document.documentElement.scrollTop;

        if (currentScroll > lastScrollTop) {
            // Scroll down: hide navbar smoothly
            navbar.style.top = '-100px'; // Adjust this value based on your navbar height
        } else {
            // Scroll up: show navbar smoothly and keep it centered
            navbar.style.top = '0.5rem'; // Keep it fixed at its original position
        }

        lastScrollTop = currentScroll <= 0 ? 0 : currentScroll; // For mobile or negative scrolling
    });
</script>

<body class="bg-gray-900 text-gray-200 font-poppins">
<div class="container mx-auto max-w-4xl px-4 py-8">

        <section class="max-w-4xl mx-auto pt-9 px-4">
            <h1 class="text-3xl font-bold text-center mb-8">Buy Tickets</h1>

            <!-- Navigation Links -->
            <div class="flex justify-between items-center mb-10 text-gray-400 space-x-4 w-full pt-1">

                    <a href="#" class="text-yellow-500 font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_buyTicket.jsp")) { %> text-gray-900 border-b-2 border-yellow-500 <% } %>">Pick a Movie</a>
                    <a href="#" class="text-yellow-500 font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_your_details.jsp")) { %> text-gray-900 border-b-2 border-yellow-500 <% } %>">Your Details</a>
                    <a href="#" class="text-yellow-500 font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_pick_a_seat.jsp")) { %> text-gray-900 border-b-2 border-yellow-500 <% } %>">Pick a Seat</a>
                    <a href="#" class="text-yellow-500 font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_summary.jsp")) { %> text-gray-900 border-b-2 border-yellow-500 <% } %>">Summary</a>

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
                        <button type="button" class="input px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700"
                                onclick="selectOption('date', '<%= date %>', event)"><%= date %></button>
                        <%
                                cal.add(java.util.Calendar.DATE, 1);
                            }
                        %>
                    </div>
                </div>

                <!-- Movie Selection -->
                <div class="mb-8" id="movie-selection">
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
                <div class="mb-8" id="cinema-selection">
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

                <!-- Time Selection -->
                <div class="mb-8" id="time-selection">
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

                <!-- Form Buttons -->
                <div class="flex justify-center" style="width:50%; margin:auto">
                <button type="button" id="next-button" onclick="validateAndRedirect()"
                            class="flex-1 px-6 py-2 w-2/4 text-yellow-500 border border-yellow-500 rounded-lg hover:bg-yellow-500 hover:text-gray-900 transition duration-300">
                        Next
                </button>
                </div>

            </form>
        </section>

</div>
</body>
</html>
