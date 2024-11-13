<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-gray-200">

<!-- Page Header -->
<header class="bg-black py-4 shadow-lg fixed w-full top-0 left-0 z-50">
  <div class="container mx-auto px-6 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-white uppercase">KCC Multiplex</h1>
    <nav class="space-x-6">
      <a href="/" class="text-white hover:text-yellow-500">Home</a>
      <a href="buyticket.jsp" class="text-white hover:text-yellow-500">Buy Tickets</a>
      <a href="movies.jsp" class="text-yellow-500 font-semibold">Movies</a>
      <a href="cinemas.jsp" class="text-white hover:text-yellow-500">Cinemas</a>
      <a href="contactus.jsp" class="text-white hover:text-yellow-500">Contact Us</a>
    </nav>
  </div>
</header>

<!-- Main Content -->
<main class="pt-24 pb-12">
  <section class="container mx-auto px-6">
    <h2 class="text-3xl font-bold text-center mb-10">Now Showing</h2>

    <!-- Film Grid -->
    <div class="grid gap-8 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
      <!-- Film Card 1 -->
      <div class="bg-gray-800 rounded-lg overflow-hidden shadow-md">
        <img src="https://via.placeholder.com/300x400" alt="Film 1" class="w-full h-60 object-cover">
        <div class="p-4">
          <h3 class="text-lg font-semibold text-white">Film Title 1</h3>
          <p class="text-gray-400 text-sm mt-2">An exciting adventure awaits. Join the journey in Film Title 1!</p>
        </div>
      </div>
      <!-- Film Card 2 -->
      <div class="bg-gray-800 rounded-lg overflow-hidden shadow-md">
        <img src="https://via.placeholder.com/300x400" alt="Film 2" class="w-full h-60 object-cover">
        <div class="p-4">
          <h3 class="text-lg font-semibold text-white">Film Title 2</h3>
          <p class="text-gray-400 text-sm mt-2">A heartwarming story of love and resilience in Film Title 2.</p>
        </div>
      </div>
      <!-- Film Card 3 -->
      <div class="bg-gray-800 rounded-lg overflow-hidden shadow-md">
        <img src="https://via.placeholder.com/300x400" alt="Film 3" class="w-full h-60 object-cover">
        <div class="p-4">
          <h3 class="text-lg font-semibold text-white">Film Title 3</h3>
          <p class="text-gray-400 text-sm mt-2">Witness an epic showdown in the thrilling Film Title 3.</p>
        </div>
      </div>
      <!-- Film Card 4 -->
      <div class="bg-gray-800 rounded-lg overflow-hidden shadow-md">
        <img src="https://via.placeholder.com/300x400" alt="Film 4" class="w-full h-60 object-cover">
        <div class="p-4">
          <h3 class="text-lg font-semibold text-white">Film Title 4</h3>
          <p class="text-gray-400 text-sm mt-2">A captivating mystery unfolds in the suspenseful Film Title 4.</p>
        </div>
      </div>
      <!-- Add more film cards as needed -->
    </div>
  </section>
</main>

</body>
</html>
