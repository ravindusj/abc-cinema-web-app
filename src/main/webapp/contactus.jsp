<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/13/2024
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta charset="UTF-8">
  <title>Contact Us</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-cover bg-center bg-no-repeat min-h-screen flex items-center justify-center" style="background-image: url('');">
<div class="bg-black bg-opacity-70 p-8 rounded-lg shadow-lg max-w-2xl w-full">
  <h2 class="text-3xl text-center text-white font-bold mb-8">Contact Us</h2>

  <form method="post" class="space-y-6">

    <!-- Name Field -->
    <div>
      <label for="name" class="block text-white mb-2">Name:</label>
      <input type="text" id="name" name="name" required
             class="w-full p-3 rounded-md border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-orange-500 focus:outline-none"
             placeholder="Your Name">
    </div>

    <!-- Email Field -->
    <div>
      <label for="email" class="block text-white mb-2">Email:</label>
      <input type="email" id="email" name="email" required
             class="w-full p-3 rounded-md border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-orange-500 focus:outline-none"
             placeholder="Your Email">
    </div>

    <!-- Phone Field -->
    <div>
      <label for="phone" class="block text-white mb-2">Phone Number:</label>
      <input type="tel" id="phone" name="phone"
             class="w-full p-3 rounded-md border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-orange-500 focus:outline-none"
             placeholder="Your Phone Number">
    </div>

    <!-- Subject Dropdown -->
    <div>
      <label for="subject" class="block text-white mb-2">Select Your Subject:</label>
      <select id="subject" name="subject"
              class="w-full p-3 rounded-md border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-orange-500 focus:outline-none">
        <option value="General Inquiry">General Inquiry</option>
        <option value="Partnership">Partnership</option>
        <option value="Advertisement">Advertisement</option>
        <option value="Feedback">Feedback</option>
      </select>
    </div>

    <!-- Message Field -->
    <div>
      <label for="message" class="block text-white mb-2">Type Your Message Here:</label>
      <textarea id="message" name="message" required
                class="w-full p-3 rounded-md border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-orange-500 focus:outline-none"
                placeholder="Your Message"></textarea>
    </div>

    <!-- Submit Button -->
    <div class="text-center">
      <button type="submit"
              class="bg-orange-500 hover:bg-orange-600 text-white font-bold py-3 px-8 rounded-md transition duration-200">
        Submit
      </button>
    </div>
  </form>
</div>
</body>
</html>
