<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buy Tickets</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <script>
        function validateForm() {
            const name = document.getElementById("name").value;
            const email = document.getElementById("email").value;
            const phone = document.getElementById("phone").value;
            const nextButton = document.getElementById("nextButton");

            if (name && email && phone) {
                nextButton.disabled = false;
                nextButton.title = "";

                document.cookie = "userName=" + encodeURIComponent(name) + "; path=/";
                document.cookie = "userEmail=" + encodeURIComponent(email) + "; path=/";
            } else {
                nextButton.disabled = true;
                nextButton.title = "Please fill all the required fields to proceed";
            }
        }

        document.getElementById("nextButton").onclick = function() {
            window.location.href = 'temp_pick_a_seat.jsp';
        };
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
            <li><a href="temp_buyTicket.jsp" class="bg-sky-600 text-white font-normal text-sm px-4 py-2 rounded hover:bg-sky-800">Buy Tickets</a></li>
            <li><a href="movies.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Movies</a></li>
            <li><a href="cinemas.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Cinemas</a></li>
            <li><a href="contactus.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Contact Us</a></li>
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


<body class="bg-gray-900 text-gray-200 font-poppin py-8">
<div class="container mx-auto max-w-4xl px-4 py-8" style="padding-top: 99px;">

    <h2 class="text-2xl font-semibold tracking-tight text-left mb-6 text-white">Personal Details</h2>

    <div class="flex justify-between items-center mb-10 text-gray-400 space-x-4 w-full pt-9">

        <a href="#" class="text-white font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_buyTicket.jsp")) { %> border-b-2 border-white <% } %>">Pick a Movie</a>
        <a href="#" class="text-white font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_your_details.jsp")) { %> border-b-2 border-white <% } %>">Your Details</a>
        <a href="#" class="text-white font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_pick_a_seat.jsp")) { %> border-b-2 border-white <% } %>">Pick a Seat</a>
        <a href="#" class="text-white font-semibold flex-grow text-center <% if(request.getRequestURI().contains("temp_summary.jsp")) { %> border-b-2 border-white <% } %>">Summary</a>

    </div>

    <div class="flex justify-center">
        <form class="flex flex-col gap-9 w-2/4" oninput="validateForm()">
            <div>
                <label for="name" class="block font-semibold text-gray-300">Name</label>
                <input type="text" id="name" name="name"
                       class="w-full p-2 border border-gray-600 bg-gray-800 text-gray-200 rounded mt-1 focus:outline-none focus:ring focus:ring-yellow-500"
                       required>
            </div>

            <div>
                <label for="email" class="block font-semibold text-gray-300">Email</label>
                <input type="email" id="email" name="email"
                       class="w-full p-2 border border-gray-600 bg-gray-800 text-gray-200 rounded mt-1 focus:outline-none focus:ring focus:ring-yellow-500"
                       required>
            </div>

            <div>
                <label for="phone" class="block font-semibold text-gray-300">Phone Number</label>
                <input type="tel" id="phone" name="phone"
                       class="w-full p-2 border border-gray-600 bg-gray-800 text-gray-200 rounded mt-1 focus:outline-none focus:ring focus:ring-yellow-500"
                       required>
            </div>
        </form>
    </div>

    <div class="flex justify-between space-x-4 pt-9">
        <button type="button" onclick="window.location.href='temp_buyTicket.jsp'"
                class="hover:bg-violet-950 text-white border border-white px-4 py-2 font-medium w-full rounded-lg hover:border-0">
            Previous
        </button>
        <button type="button" id="nextButton" onclick="window.location.href='temp_pick_a_seat.jsp'"
                class="bg-violet-950 text-white px-4 py-2 font-medium w-full rounded-lg hover:border hover:border-white"
                disabled>
            Next
        </button>
    </div>
</div>


</body>
</html>