<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-gray-200">

<!-- Buy Tickets Section -->
<section class="max-w-4xl mx-auto pt-16 px-4 pb-12">
    <!-- Step Navigation -->
    <h1 class="text-3xl font-bold text-center mb-8">Buy Tickets</h1>

    <div class="flex justify-between items-center mb-10 text-gray-400">
        <span class="text-yellow-500 font-semibold">Pick a Movie</span>
        <span>Your Details</span>
        <span>Pick a Seat</span>
        <span>Summary</span>
    </div>

    <!-- Date Selection -->
    <div class="mb-8">
        <h2 class="text-lg font-semibold text-gray-300 mb-4">Select a date</h2>
        <div class="flex space-x-4">
            <button class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-yellow-500">Today</button>
            <button class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700">Thu, 14 Nov</button>
            <button class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700">Sat, 16 Nov</button>
            <button class="px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700">Sun, 17 Nov</button>
        </div>
    </div>

    <!-- Navigation Buttons -->
    <div class="flex justify-between">
        <button class="px-6 py-2 text-yellow-500 border border-yellow-500 rounded-lg hover:bg-yellow-500 hover:text-gray-900">Previous</button>
        <button class="px-6 py-2 bg-yellow-500 text-gray-900 font-semibold rounded-lg hover:bg-yellow-600">Next</button>
    </div>
</section>

</body>
</html>
