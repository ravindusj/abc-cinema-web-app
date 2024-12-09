<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booking Summary</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white min-h-screen flex flex-col items-center justify-center">
<div class="bg-gray-800 rounded-lg shadow-lg p-8 w-full max-w-md text-center">
  <h1 class="text-3xl font-bold mb-6 text-yellow-400">Booking Summary</h1>

  <div class="mb-4">
    <h2 class="text-xl font-semibold mb-2">Movie: <span class="text-yellow-300">Film Name :</span></h2>
    <p class="text-gray-400">Date: <span class="text-white">Selected Date</span></p>
    <p class="text-gray-400">Time: <span class="text-white">Time</span></p>
  </div>

  <div class="mb-4">
    <p class="mb-2"><strong>Selected Seats:</strong></p>
    <div class="flex flex-wrap justify-center gap-2">
      <span class="bg-yellow-500 text-black px-3 py-1 rounded-lg">${selectedSeats}</span>
    </div>
  </div>

  <div class="mb-4">
    <p><strong>Adult Tickets:</strong> ${adultTickets}</p>
    <p><strong>Child Tickets:</strong> ${childTickets}</p>
  </div>

  <div class="bg-gray-700 p-4 rounded-lg">
    <p class="text-xl font-bold text-yellow-400">Total Cost:</p>
    <p class="text-2xl font-medium"> ${totalCost}LKR</p>
  </div>

  <div class="mt-6 flex justify-center gap-4">
    <a href="pick_a_seat.jsp" class="bg-yellow-500 text-black px-4 py-2 rounded-lg hover:bg-yellow-400">
      Back to Seat Selection
    </a>

    <form action="ProcessPayment" method="post">
      <input type="hidden" name="movieName" value="Film Name">
      <input type="hidden" name="totalCost" value="${totalCost}">
      <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-400">
        Proceed to Payment
      </button>
    </form>
  </div>
</div>
</body>
</html>