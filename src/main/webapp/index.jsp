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
<nav id="navbar" class="bg-black/75 px-6 py-4 fixed w-8/12 top-2 left-1/2 transform -translate-x-1/2 z-50 rounded-lg shadow-lg transition-all duration-500 ease-in-out">
    <div class="flex items-center justify-between max-w-7xl mx-auto w-full">
        <!-- Logo -->
        <div class="text-white text-2xl font-bold uppercase">ABC Cinema</div>

        <!-- Navigation Links -->
        <ul class="flex items-center space-x-8">
            <li><a href="index.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Home</a></li>
            <li><a href="buyTickets.jsp" class="bg-sky-600 text-white font-normal text-sm px-4 py-2 rounded hover:bg-sky-800">Buy Tickets</a></li>
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


<!-- Hero Section Start -->
<section>
    <div class="relative h-screen bg-cover bg-center" style="background-image: url('https://designone.lk/wp-content/uploads/2021/09/1-3.jpg'); margin-top: 0;">
        <div class="absolute inset-0 bg-black opacity-50"></div> <!-- Dark overlay -->

        <div class="relative z-10 flex flex-col items-center justify-center h-full text-center text-white px-4">
            <h1 class="text-4xl md:text-6xl font-normal">Welcome to ABC Cinema</h1>
            <p class="mt-4 text-lg md:text-xl max-w-2xl">
                Experience the best movies in town with high-quality sound and visuals. Book your tickets now!
            </p>
            <a href="buyTickets.jsp" class="mt-8 bg-sky-600 hover:bg-sky-800 text-white font-normal px-6 py-3 rounded text-lg">
                Buy Tickets Now!
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
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 1" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>
            <!-- Film Card 2 -->
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 2" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>
            <!-- Film Card 3 -->
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 3" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>
            <!-- Film Card 4 -->
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 4" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 4" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 4" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 4" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 4" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 4" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
            <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 4" class="w-full h-60 object-cover">
            <div class="p-4">
                <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
            </div>
        </div>
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 4" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>
            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 4" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>


        </div>
    </div>
</section>
<!-- Film Grid Section End -->

</body>
</html>

