<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Movie</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">

<div class="max-w-2xl mx-auto bg-white p-8 rounded-lg shadow-lg mt-10">
  <h2 class="text-2xl font-bold text-center text-gray-900 mb-6">Add Movie</h2>

  <form action="addMovieServlet" method="POST">

    <div class="mb-4">
      <label for="title" class="block text-lg font-medium text-gray-700">Movie Title:</label>
      <input type="text" id="title" name="title" class="w-full p-3 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="description" class="block text-lg font-medium text-gray-700">Description:</label>
      <textarea id="description" name="description" class="w-full p-3 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required></textarea>
    </div>

    <div class="mb-4">
      <label for="imageUrl" class="block text-lg font-medium text-gray-700">Image URL:</label>
      <input type="text" id="imageUrl" name="imageUrl" class="w-full p-3 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="cast" class="block text-lg font-medium text-gray-700">Cast:</label>
      <input type="text" id="cast" name="cast" class="w-full p-3 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="releaseDate" class="block text-lg font-medium text-gray-700">Release Date:</label>
      <input type="date" id="releaseDate" name="releaseDate" class="w-full p-3 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="categories" class="block text-lg font-medium text-gray-700">Categories:</label>
      <input type="text" id="categories" name="categories" class="w-full p-3 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <label for="language" class="block text-lg font-medium text-gray-700">Film Language:</label>
      <input type="text" id="language" name="language" class="w-full p-3 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div class="mb-4">
      <button type="submit" class="w-full p-3 bg-blue-500 text-white rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500">Add Movie</button>
    </div>

  </form>
</div>

</body>
</html>