<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.abccinemawebapp.DatabaseUtil" %>
<html>
<head>
    <title>Buy Tickets</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script>
        function selectOption(type, value, event) {
            const inputElement = document.getElementById(type + "-input");
            const currentValue = inputElement.value;

            const dateButtons = document.querySelectorAll("#date-selection button");
            dateButtons.forEach(button => {
                button.classList.remove('bg-violet-950', 'text-white');
                button.classList.add('bg-gray-800', 'text-white');
            });

            if (currentValue === value) {
                inputElement.value = "";
            } else {
                inputElement.value = value;

                event.target.classList.remove('bg-gray-800', 'text-white');
                event.target.classList.add('bg-violet-950', 'text-white');
            }

            updateNextButtonStatus();
        }

        function selectOption2(type, value, event) {
            const inputElement = document.getElementById(type + "-input");
            const currentValue = inputElement.value;

            const dateButtons = document.querySelectorAll("#movie-selection button");
            dateButtons.forEach(button => {
                button.classList.remove('bg-violet-950', 'text-white');
                button.classList.add('bg-gray-800', 'text-white');
            });

            if (currentValue === value) {
                inputElement.value = "";
            } else {
                inputElement.value = value;
                event.target.classList.remove('bg-gray-800', 'text-white');
                event.target.classList.add('bg-violet-950', 'text-white');
            }


            updateNextButtonStatus();
        }

        function selectOption3(type, value, event) {
            const inputElement = document.getElementById(type + "-input");
            const currentValue = inputElement.value;

            const dateButtons = document.querySelectorAll("#cinema-selection button");
            dateButtons.forEach(button => {
                button.classList.remove('bg-violet-950', 'text-white');
                button.classList.add('bg-gray-800', 'text-white');
            });

            if (currentValue === value) {
                inputElement.value = "";
            } else {
                inputElement.value = value;

                event.target.classList.remove('bg-gray-800', 'text-white');
                event.target.classList.add('bg-violet-950', 'text-white');
            }

            updateNextButtonStatus();
        }

        function selectOption4(type, value, event) {
            const inputElement = document.getElementById(type + "-input");
            const currentValue = inputElement.value;

            const dateButtons = document.querySelectorAll("#time-selection button");
            dateButtons.forEach(button => {
                button.classList.remove('bg-violet-950', 'text-white');
                button.classList.add('bg-gray-800', 'text-white');
            });

            if (currentValue === value) {
                inputElement.value = "";
            } else {
                inputElement.value = value;

                event.target.classList.remove('bg-gray-800', 'text-white');
                event.target.classList.add('bg-violet-950', 'text-white');
            }

            updateNextButtonStatus();
        }


                        function setCookie(name, value) {
                    document.cookie = name + "=" + encodeURIComponent(value) + "; path=/";
        }

        function validateAndRedirect() {
            const date = document.getElementById("date-input").value;
            const movie = document.getElementById("movie-input").value;
            const cinema = document.getElementById("cinema-input").value;
            const time = document.getElementById("time-input").value;

            setCookie("selectedDate", date);
            setCookie("selectedMovie", movie);
            setCookie("selectedCinema", cinema);
            setCookie("selectedTime", time);

            window.location.href = 'temp_your_details.jsp';
        }

        function updateNextButtonStatus() {
            const date = document.getElementById("date-input").value;
            const movie = document.getElementById("movie-input").value;
            const cinema = document.getElementById("cinema-input").value;
            const time = document.getElementById("time-input").value;
            const nextButton = document.getElementById("next-button");

            if (date && movie && cinema && time) {
                nextButton.disabled = false;
                nextButton.title = "";
            } else {
                nextButton.disabled = true;
                nextButton.title = "Please make all selections before proceeding.";
            }
        }
                window.onload = updateNextButtonStatus;
    </script>
</head>

<style>
    #navbar {
        font-family: 'Poppins', sans-serif;
    }
</style>
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

<body class="bg-gray-900 text-gray-200 font-poppins">
<div class="container mx-auto max-w-4xl px-4 py-8">

    <section style="padding-top: 99px;">
        <h2 class="text-2xl font-semibold tracking-tight text-left mb-6 text-white">Buy Tickets</h2>

        <div class="flex justify-between items-center mb-10 text-gray-400 space-x-4 w-full pt-9">

            <a href="#" class="text-white font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_buyTicket.jsp")) { %> border-b-2 border-white <% } %>">Pick a Movie</a>
            <a href="#" class="text-white font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_your_details.jsp")) { %>  border-b-2 border-yellow-500 <% } %>">Your Details</a>
            <a href="#" class="text-white font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_pick_a_seat.jsp")) { %>  border-b-2 border-yellow-500 <% } %>">Pick a Seat</a>
            <a href="#" class="text-white font-semibold flex-grow text-center <% if(request.getRequestURI().contains("summary.jsp")) { %> border-b-2 border-yellow-500 <% } %>">Summary</a>

        </div>

        <form id="selection-form" action="processSelection.jsp" method="POST">

            <input type="hidden" id="date-input" name="selectedDate">
            <input type="hidden" id="movie-input" name="selectedMovie">
            <input type="hidden" id="cinema-input" name="selectedCinema">
            <input type="hidden" id="time-input" name="selectedTime">

            <div class="mb-8" id="date-selection">
                <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a Date</h2>
                <div class="flex space-x-4">
                    <%
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEE, dd MMM");
                        java.util.Calendar cal = java.util.Calendar.getInstance();
                        for (int i = 0; i < 4; i++) {
                            String date = sdf.format(cal.getTime());
                    %>
                    <button type="button" class="input px-4 py-2 bg-gray-800 text-white rounded-lg"
                            onclick="selectOption('date', '<%= date %>', event)"><%= date %></button>
                    <%
                            cal.add(java.util.Calendar.DATE, 1);
                        }
                    %>
                </div>
            </div>

            <div class="mb-8" id="movie-selection">
                <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a Movie</h2>
                <%
                    List<String> movieNames = DatabaseUtil.getMovieNames();
                    for (String movieName : movieNames) {
                %>
                <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg mb-2"
                        onclick="selectOption2('movie', '<%= movieName %>', event)"><%= movieName %></button>
                <%
                    }
                %>
            </div>

            <div class="mb-8" id="cinema-selection">
                <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a Cinema Hall</h2>
                <div class="flex space-x-4">
                    <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg"
                            onclick="selectOption3('cinema', 'Multiplex 1', event)">Multiplex 01</button>
                    <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg"
                            onclick="selectOption3('cinema', 'Multiplex 2', event)">Multiplex 02</button>
                    <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg"
                            onclick="selectOption3('cinema', 'Multiplex 3', event)">Multiplex 03</button>
                </div>
            </div>

            <div class="mb-8" id="time-selection">
                <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a Time</h2>
                <div class="flex space-x-4">
                    <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg"
                            onclick="selectOption4('time', '10:00 AM', event)">10:00 AM</button>
                    <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg"
                            onclick="selectOption4('time', '2:00 PM', event)">2:00 PM</button>
                    <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg"
                            onclick="selectOption4('time', '6:00 PM', event)">6:00 PM</button>
                    <button type="button" class="px-4 py-2 bg-gray-800 text-white rounded-lg"
                            onclick="selectOption4('time', '6:00 PM', event)">10:00 PM</button>
                </div>
            </div>

            <div style="width:50%;" class="pt-5">
                <button type="button" id="next-button" onclick="validateAndRedirect()"
                        class="bg-violet-950 text-white px-4 py-2 font-medium w-full rounded-lg hover:border hover:border-white">
                    Next
                </button>
            </div>

        </form>
    </section>

</section>
</div>
</body>
</html>