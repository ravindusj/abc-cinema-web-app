<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        // JavaScript to dynamically load the Poppins font
        document.addEventListener("DOMContentLoaded", () => {
            const link = document.createElement("link");
            link.href = "https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap";
            link.rel = "stylesheet";
            document.head.appendChild(link);

            // Apply the font to the body tag
            document.body.style.fontFamily = "'Poppins', sans-serif";
        });
    </script>
</head>
<body class="bg-gray-100 font-sans">

<!-- Fixed Navbar Start -->
<nav class="bg-black/80 px-6 py-4 fixed w-11/12 top-2 left-1/2 transform -translate-x-1/2 z-50 rounded-lg">
    <div class="flex items-center justify-between max-w-7xl mx-auto">
        <!-- Logo -->
        <div class="text-white text-2xl font-bold uppercase">ABC Cinema</div>

        <!-- Navigation Links -->
        <ul class="flex items-center space-x-8">
            <li><a href="index.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded">Home</a></li>
            <li><a href="buyTickets.jsp" class="bg-cyan-500 text-white font-semibold text-sm px-4 py-2 rounded hover:bg-yellow-600">Buy Tickets</a></li>
            <li><a href="movies.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded">Movies</a></li>
            <li><a href="cinemas.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded">Cinemas</a></li>
            <li><a href="contactus.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded">Contact Us</a></li>
        </ul>
    </div>
</nav>
<!-- Fixed Navbar End -->

<!-- Hero Section Start -->
<section class="pt-20">
    <div class="relative h-screen bg-cover bg-center" style="background-image: url('https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fbackdrop%2F111b45c9-1fdd-4e99-b3de-d60255302fa4.jpg?alt=media&token=c6194650-dae5-4b51-bb75-a563d5abd693');">
        <div class="absolute inset-0 bg-black opacity-50"></div> <!-- Dark overlay -->

        <div class="relative z-10 flex flex-col items-center justify-center h-full text-center text-white px-4">
            <h1 class="text-4xl md:text-6xl font-bold">Welcome to KCC Multiplex</h1>
            <p class="mt-4 text-lg md:text-xl max-w-2xl">
                Experience the best movies in town with high-quality sound and visuals. Book your tickets now!
            </p>
            <a href="buyTickets.jsp" class="mt-8 bg-yellow-500 hover:bg-yellow-600 text-white font-semibold px-6 py-3 rounded text-lg">
                Buy Tickets
            </a>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Film Grid Section Start -->
<section class="bg-white py-20 px-6">
    <div class="max-w-7xl mx-auto">
        <h2 class="text-3xl font-bold text-center mb-10">Now Showing</h2>

        <!-- Film Grid -->
        <div class="grid gap-8 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
            <!-- Film Card 1 -->
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://via.placeholder.com/300x400" alt="Film 1" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">Film Title 1</h3>
                    <p class="text-gray-700 text-sm mt-2">An exciting adventure awaits. Join the journey in Film Title 1!</p>
                </div>
            </div>
            <!-- Film Card 2 -->
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://via.placeholder.com/300x400" alt="Film 2" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">Film Title 2</h3>
                    <p class="text-gray-700 text-sm mt-2">A heartwarming story of love and resilience in Film Title 2.</p>
                </div>
            </div>
            <!-- Film Card 3 -->
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://via.placeholder.com/300x400" alt="Film 3" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">Film Title 3</h3>
                    <p class="text-gray-700 text-sm mt-2">Witness an epic showdown in the thrilling Film Title 3.</p>
                </div>
            </div>
            <!-- Film Card 4 -->
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://via.placeholder.com/300x400" alt="Film 4" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">Film Title 4</h3>
                    <p class="text-gray-700 text-sm mt-2">A captivating mystery unfolds in the suspenseful Film Title 4.</p>
                </div>
            </div>
            <!-- Add more film cards as needed -->
        </div>
    </div>
</section>
<!-- Film Grid Section End -->

</body>
</html>

