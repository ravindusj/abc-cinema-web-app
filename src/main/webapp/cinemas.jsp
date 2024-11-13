<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/13/2024
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    <div class="flex flex-col md:flex-row gap-8">

      <!-- Cinema Image -->
      <div class="md:w-1/2">
        <img src="https://via.placeholder.com/800x450" alt="Cinema Hall" class="rounded-lg shadow-lg mb-4">

        <!-- Gallery -->
        <div class="flex space-x-4 overflow-x-auto">
          <img src="https://via.placeholder.com/150" alt="Gallery Image 1" class="w-24 h-24 rounded-lg object-cover">
          <img src="https://via.placeholder.com/150" alt="Gallery Image 2" class="w-24 h-24 rounded-lg object-cover">
          <img src="https://via.placeholder.com/150" alt="Gallery Image 3" class="w-24 h-24 rounded-lg object-cover">
          <img src="https://via.placeholder.com/150" alt="Gallery Image 4" class="w-24 h-24 rounded-lg object-cover">
        </div>
      </div>

      <!-- Cinema Details -->
      <div class="md:w-1/2">
        <h2 class="text-3xl font-bold mb-4">KCC Multiplex - C1</h2>
        <p class="text-gray-400 mb-4">Walking through the new KCC Multiplex main entrance, on Sri Wickramarajasinghe Mawatha, takes you to the main lobby with the Box Office on the left and Cinema 1 on the right. C1 is a state-of-the-art modern cinema showcasing an immersive, unparalleled Dolby Atmos surround sound experience coupled with ultra-bright 4K projection with 3D capability. C1 seats 135 viewers and prides itself in having seating accessibility for wheelchairs. Each seat is designed and engineered for an all-round first-class experience for sounds and visuals – to the highest available industry standards.</p>

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
  </section>
</main>

</body>
</html>
