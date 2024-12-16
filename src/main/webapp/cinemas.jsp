<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cinemas - ABC Cinema</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<style>
  body {
    font-family: 'Poppins', sans-serif;
  }
</style>
<body class="bg-gray-900 text-gray-200">

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

<main>
  <section class="container mx-auto px-6" style="padding-top: 99px;">

<h2 class="text-2xl font-semibold tracking-tight text-center mb-6 text-white">Theaters</h2>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">

      <div class="bg-gray-300 rounded-lg shadow-lg overflow-hidden">
        <img src="https://kccmultiplex.lk/assets/images/cinema/c1/c1-06.jpg" alt="Cinema Hall 1" class="w-full h-48 object-cover">
        <div class="p-6">
          <h2 class="text-2xl font-bold text-violet-950 mb-4">ABC Multiplex 01</h2>
          <p class="text-gray-900 mb-4 font-medium">Cinema 1 features the latest in Dolby Atmos surround sound, paired with ultra-bright 4K digital projection and 3D capabilities. With a seating capacity of 135, it's designed for an immersive experience.</p>

          <div class="space-y-2 text-gray-900">
            <div class="flex items-center space-x-2">
              <span class="text-xl">📡</span>
              <span class="text-lg font-medium">Dolby Atmos</span>
            </div>
            <div class="flex items-center space-x-2">
              <span class="text-xl">🔲</span>
              <span class="text-lg font-medium">4K Digital Projection</span>
            </div>
            <div class="flex items-center space-x-2">
              <span class="text-xl">🎬</span>
              <span class="text-lg font-medium">3D Capable</span>
            </div>
          </div>
        </div>
      </div>

      <div class="bg-gray-300 rounded-lg shadow-lg overflow-hidden">
        <img src="https://entrepreneurship.babson.edu/wp-content/uploads/2020/10/Movie-1200-630.jpg" alt="Cinema Hall 2" class="w-full h-48 object-cover">
        <div class="p-6">
          <h2 class="text-2xl font-bold text-violet-950 mb-4">ABC Multiplex 02</h2>
          <p class="text-gray-900 mb-4 font-medium">Cinema 2 offers a premium cinema experience with the latest sound and visual technologies. It seats 180 and is equipped with advanced projection systems, ensuring crystal-clear visuals and superior sound.</p>

          <div class="space-y-2 text-gray-900">
            <div class="flex items-center space-x-2">
              <span class="text-xl">📡</span>
              <span class="text-lg font-medium">Dolby Surround</span>
            </div>
            <div class="flex items-center space-x-2">
              <span class="text-xl">🔲</span>
              <span class="text-lg font-medium">4K Projection</span>
            </div>
            <div class="flex items-center space-x-2">
              <span class="text-xl">🎬</span>
              <span class="text-lg font-medium">3D Projection</span>
            </div>
          </div>
        </div>
      </div>

      <div class="bg-gray-300 rounded-lg shadow-lg overflow-hidden">
        <img src="https://t4.ftcdn.net/jpg/06/89/49/95/360_F_689499531_MeYeI1VVavgYQRzz0S3JxkQ9VxzgYZQh.jpg" alt="Cinema Hall 3" class="w-full h-48 object-cover">
        <div class="p-6">
          <h2 class="text-2xl font-bold text-violet-950 mb-4">ABC Multiplex 03</h2>
          <p class="text-gray-900 mb-4 font-medium">Cinema 3 is designed for large groups and families, featuring spacious seating and high-definition visuals. It seats 200 viewers and provides a premium cinematic experience with rich sound and clear imagery.</p>

          <div class="space-y-2 text-gray-900">
            <div class="flex items-center space-x-2">
              <span class="text-xl">📡</span>
              <span class="text-lg font-medium">Dolby Atmos</span>
            </div>
            <div class="flex items-center space-x-2">
              <span class="text-xl">🔲</span>
              <span class="text-lg font-medium">HD Projection</span>
            </div>
            <div class="flex items-center space-x-2">
              <span class="text-xl">🎬</span>
              <span class="text-lg font-medium">3D Capable</span>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>
</main>

</body>
</html>