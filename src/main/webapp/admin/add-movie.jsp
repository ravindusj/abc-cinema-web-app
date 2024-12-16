<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Movie</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white">

<div class="max-w-2xl mx-auto">
  <h2 class="text-2xl font-bold text-center mb-6 pt-9">Add Movie</h2>

  <form action="/abc_cinema_web_app_war_exploded/addMovieServlet" method="POST">

    <div class="mb-4">
      <label for="title" class="block font-medium">Movie Title:</label>
      <input type="text" id="title" name="title" class="w-full p-3 text-gray-900 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="description" class="block font-medium">Description:</label>
      <textarea id="description" name="description" class="w-full p-3 mt-2 text-gray-900 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required></textarea>
    </div>

    <div class="mb-4">
      <label for="imageUrl" class="block font-medium">Image URL:</label>
      <input type="text" id="imageUrl" name="imageUrl" class="w-full p-3 mt-2 text-gray-900  border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="cast" class="block font-medium">Cast:</label>
      <input type="text" id="cast" name="cast" class="w-full p-3 mt-2 border text-gray-900 border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="releaseDate" class="block font-medium">Release Year:</label>
      <input type="text" id="releaseDate" name="releaseDate" class="w-full p-3 mt-2 text-gray-900 der border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="categories" class="block font-medium">Categories:</label>
      <input type="text" id="categories" name="categories" class="w-full p-3 mt-2 border text-gray-900 border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="language" class="block font-medium">Film Language:</label>
      <input type="text" id="language" name="language" class="w-full p-3 mt-2 border border-gray-300 text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="trailer" class="block font-medium">Trailer YouTube ID:</label>
      <input type="text" id="trailer" name="trailer" class="w-full p-3 mt-2 border border-gray-300 text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <button type="submit" class="w-full bg-violet-950 text-white px-4 py-2 rounded-md font-medium">Add Movie</button>
    </div>

  </form>
</div>

</body>
</html>