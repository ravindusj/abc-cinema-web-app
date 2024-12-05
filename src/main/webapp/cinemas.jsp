<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>KCC Multiplex Cinemas</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-gray-200">

<!-- Navbar -->
<header class="bg-black py-4 shadow-lg fixed w-full top-0 left-0 z-50">
  <div class="container mx-auto px-6 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-white uppercase">KCC Multiplex</h1>
    <nav class="space-x-6">
      <a href="home.jsp" class="text-white hover:text-yellow-500">Home</a>
      <a href="buyticket.jsp" class="text-white hover:text-yellow-500">Buy Tickets</a>
      <a href="movies.jsp" class="text-white hover:text-yellow-500">Movies</a>
      <a href="cinemas.jsp" class="text-yellow-500 font-semibold">Cinemas</a>
      <a href="contactus.jsp" class="text-white hover:text-yellow-500">Contact Us</a>
    </nav>
  </div>
</header>

<!-- Main Content -->
<main class="pt-24 pb-12">
  <section class="container mx-auto px-6">

    <!-- Cinema Halls -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">

      <!-- Cinema Hall 1 -->
      <div class="bg-gray-800 rounded-lg shadow-lg overflow-hidden">
        <img src="https://via.placeholder.com/800x450" alt="Cinema Hall 1" class="w-full h-48 object-cover">
        <div class="p-6">
          <h2 class="text-2xl font-semibold text-yellow-500 mb-4">Cinema Hall 1 - C1</h2>
          <p class="text-gray-400 mb-4">Cinema 1 features the latest in Dolby Atmos surround sound, paired with ultra-bright 4K digital projection and 3D capabilities. With a seating capacity of 135, it's designed for an immersive experience.</p>

          <!-- Features -->
          <div class="space-y-2">
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

      <!-- Cinema Hall 2 -->
      <div class="bg-gray-800 rounded-lg shadow-lg overflow-hidden">
        <img src="https://via.placeholder.com/800x450" alt="Cinema Hall 2" class="w-full h-48 object-cover">
        <div class="p-6">
          <h2 class="text-2xl font-semibold text-yellow-500 mb-4">Cinema Hall 2 - C2</h2>
          <p class="text-gray-400 mb-4">Cinema 2 offers a premium cinema experience with the latest sound and visual technologies. It seats 180 and is equipped with advanced projection systems, ensuring crystal-clear visuals and superior sound.</p>

          <!-- Features -->
          <div class="space-y-2">
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

      <!-- Cinema Hall 3 -->
      <div class="bg-gray-800 rounded-lg shadow-lg overflow-hidden">
        <img src="https://via.placeholder.com/800x450" alt="Cinema Hall 3" class="w-full h-48 object-cover">
        <div class="p-6">
          <h2 class="text-2xl font-semibold text-yellow-500 mb-4">Cinema Hall 3 - C3</h2>
          <p class="text-gray-400 mb-4">Cinema 3 is designed for large groups and families, featuring spacious seating and high-definition visuals. It seats 200 viewers and provides a premium cinematic experience with rich sound and clear imagery.</p>

          <!-- Features -->
          <div class="space-y-2">
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

<!-- Footer -->
<footer class="bg-black py-6 text-center text-gray-400">
  <p>&copy; 2024 KCC Multiplex. All rights reserved.</p>
</footer>

</body>
</html>