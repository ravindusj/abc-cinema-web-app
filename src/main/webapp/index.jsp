<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<style>
    body {
        font-family: 'Poppins', sans-serif;
    }
</style>
<body class="bg-gray-100">


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

            navbar.style.top = '-100px'; // Adjust this value based on your navbar height
        } else {

            navbar.style.top = '0.5rem'; // Keep it fixed at its original position
        }

        lastScrollTop = currentScroll <= 0 ? 0 : currentScroll; // For mobile or negative scrolling
    });
</script>

<section>
    <div class="relative h-screen bg-cover bg-center" style="background-image: url('https://designone.lk/wp-content/uploads/2021/09/1-3.jpg'); margin-top: 0;">
        <div class="absolute inset-0 bg-black opacity-50"></div>

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

<section class="bg-white py-20 px-6">
    <div class="max-w-7xl mx-auto">
        <h2 class="text-3xl font-bold text-center mb-10">Now Showing</h2>


        <div class="grid gap-8 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">

            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 1" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>

            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 2" class="w-full h-60 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold">அமரன் | Amaran</h3>
                    <p class="text-gray-700 text-sm mt-2">Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran</p>
                </div>
            </div>

            <div class="bg-gray-100 rounded-lg shadow-md overflow-hidden">
                <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fposter%2F0aa4934b-3179-4268-ade0-1287445ea4d7.jpg?alt=media&token=781aeafa-48bb-402a-81f7-70bf56792b7e" alt="Film 3" class="w-full h-60 object-cover">
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


<div class="flex justify-center items-center space-x-8 p-10">
    <!-- Card 1 -->
    <div class="bg-red-800 text-white p-6 rounded-lg shadow-lg w-64">
        <h2 class="text-lg font-semibold">KCC Multiplex</h2>
        <p class="mt-2 flex items-center">
            <span class="material-icons mr-2">wifi</span> <span>Dolby Atmos</span>
        </p>
        <p class="mt-1 flex items-center">
            <span class="material-icons mr-2">tv</span> <span>4K Digital Projection</span>
        </p>
        <button class="mt-4 bg-orange-500 text-black px-4 py-2 rounded-lg font-semibold">View Showtimes</button>
        <div class="mt-2 text-sm">DOLBY ATMOS</div>
    </div>

    <!-- Card 2 -->
    <div class="bg-yellow-800 text-white p-6 rounded-lg shadow-lg w-64">
        <h2 class="text-lg font-semibold">KCC Multiplex</h2>
        <p class="mt-2 flex items-center">
            <span class="material-icons mr-2">wifi</span> <span>Dolby 7.1 Sounds</span>
        </p>
        <p class="mt-1 flex items-center">
            <span class="material-icons mr-2">tv</span> <span>2K Laser Projection</span>
        </p>
        <button class="mt-4 bg-orange-500 text-black px-4 py-2 rounded-lg font-semibold">View Showtimes</button>
        <div class="mt-2 text-sm">DOLBY SURROUND 7.1</div>
    </div>

    <!-- Card 3 -->
    <div class="bg-gray-800 text-white p-6 rounded-lg shadow-lg w-64">
        <h2 class="text-lg font-semibold">KCC Multiplex</h2>
        <p class="mt-2 flex items-center">
            <span class="material-icons mr-2">wifi</span> <span>Dolby 7.1 Sounds</span>
        </p>
        <p class="mt-1 flex items-center">
            <span class="material-icons mr-2">tv</span> <span>2K Laser Projection</span>
        </p>
        <button class="mt-4 bg-orange-500 text-black px-4 py-2 rounded-lg font-semibold">View Showtimes</button>
        <div class="mt-2 text-sm">DOLBY SURROUND 7.1</div>
    </div>
</div>


<!-- Footer Section Start -->
<footer class="bg-black text-white pt-10">
    <div class="container mx-auto px-6">
        <div class="flex flex-col md:flex-row justify-between space-y-8 md:space-y-0">
            <!-- Column 1 -->
            <div>
                <h3 class="text-lg font-bold">KCC Multiplex</h3>
                <ul class="mt-4 space-y-2 text-gray-400">
                    <li><a href="#" class="hover:text-white">Buy tickets</a></li>
                    <li><a href="#" class="hover:text-white">Movies</a></li>
                    <li><a href="#" class="hover:text-white">Cinemas</a></li>
                    <li><a href="#" class="hover:text-white">Contact us</a></li>
                </ul>
            </div>

            <!-- Column 2 -->
            <div>
                <h3 class="text-lg font-bold">General</h3>
                <ul class="mt-4 space-y-2 text-gray-400">
                    <li><a href="#" class="hover:text-white">Kandy City Centre</a></li>
                    <li><a href="#" class="hover:text-white">COVID-19 guidelines</a></li>
                </ul>
            </div>

            <!-- Column 3 -->
            <div>
                <h3 class="text-lg font-bold">Newsletter</h3>
                <p class="mt-4 text-gray-400">Join our mailing list for promotions and latest movie updates.</p>
                <div class="mt-4 flex">
<%--                    <label for="email" class="sr-only">Email address</label>--%>
                    <input type="email" placeholder="Type your email address" class="w-full p-2 rounded-l-lg text-black focus:outline-none">
                    <button class="bg-blue-600 text-white px-4 rounded-r-lg hover:bg-blue-700">Subscribe</button>
                </div>
            </div>
        </div>

        <!-- Social Media and Bottom Links -->
        <div class="mt-10 border-t border-gray-700 pt-6 flex flex-col md:flex-row justify-between items-center">
            <!-- Social Media Icons -->
            <div class="flex space-x-4">
                <a href="#" class="text-gray-400 hover:text-white"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="text-gray-400 hover:text-white"><i class="fab fa-instagram"></i></a>
            </div>

            <!-- Legal Text -->
            <p class="text-gray-400 text-sm text-center md:text-left mt-6 md:mt-0">
                © Made with ❤️ in Ceylon 🇱🇰
            </p>
        </div>

        <!-- Bottom Links -->
        <div class="text-gray-400 text-center mt-4 text-sm">
            <a href="#" class="hover:text-white">Privacy policy</a> |
            <a href="#" class="hover:text-white">Terms and conditions</a>
        </div>
    </div>
</footer>


</body>
</html>

