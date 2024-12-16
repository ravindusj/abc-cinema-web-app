<!DOCTYPE html>
<html>
<head>
  <script src="https://cdn.tailwindcss.com"></script>
  <title>Contact Us - ABC Cinema</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <style>
    body {
      background: url("https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D") no-repeat center center fixed;
      background-size: cover;
      color: white;
    }

  </style>
</head>
<body class="text-white bg-black bg-opacity-75">
<style>
  body {
    font-family: 'Poppins', sans-serif;
  }
</style>
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

<div class="flex flex-col justify-center items-center min-h-screen bg-black bg-opacity-50">
  <div>
    <h1 class="text-4xl text-center font-bold">Contact Us</h1>
    <p class="text-sm pt-9 text-center w-[699px] mx-auto">Whether you are a movie distributor, an aspiring producer, or simply providing feedback on your experience, we would love to hear from you.</p>
  </div>
  <form class="pt-9 w-[36vw] grid grid-cols-2 gap-4" action="https://docs.google.com/forms/d/e/1FAIpQLSdnsppeqstxB8uUSpPZ5FWLawhI2lO6N9j0ZI9dwG_ZbZReeA/formResponse" method="post">

    <div class="flex flex-col col-span-1">
      <label for="name" class="text-sm text-gray-400 mb-1">Name</label>
      <input type="text" id="name" name="entry.1302254668" placeholder="Enter your full name" class="p-3 border border-gray-700 rounded-md text-white text-sm focus:ring-2 focus:ring-yellow-500 focus:outline-none" required>
    </div>

    <div class="flex flex-col col-span-1">
      <label for="email" class="text-sm text-gray-400 mb-1">Email</label>
      <input type="email" id="email" name="entry.1691193182" placeholder="Enter your email" class="p-3 border border-gray-700 rounded-md text-white text-sm focus:ring-2 focus:ring-yellow-500 focus:outline-none" required>
    </div>

    <div class="flex flex-col col-span-1">
      <label for="phone" class="text-sm text-gray-400 mb-1">Phone Number</label>
      <input type="tel" id="phone" name="entry.1012497427" placeholder="Enter your phone number" class="p-3 border border-gray-700 rounded-md text-white text-sm focus:ring-2 focus:ring-yellow-500 focus:outline-none" required>
    </div>

    <div class="flex flex-col col-span-1">
      <label for="subject" class="text-sm text-gray-400 mb-1">Select Your Subject</label>
      <select id="subject" name="entry.1565475192" class="p-3 border border-gray-700 rounded-md text-sm focus:ring-2 focus:ring-yellow-500 focus:outline-none" required>
        <option value="" disabled selected>Select a subject</option>
        <option value="General Inquiry">General Inquiry</option>
        <option value="Feedback">Feedback</option>
        <option value="Advertising">Advertising</option>
        <option value="Other">Other</option>
      </select>
    </div>

    <div class="flex flex-col col-span-2">
      <label for="message" class="text-sm text-gray-400 mb-1">Type Your Message Here</label>
      <textarea id="message" name="entry.687026150" rows="6" placeholder="Write your message here" class="p-3 border border-gray-700 rounded-md text-white text-sm focus:ring-2 focus:ring-yellow-500 focus:outline-none" required></textarea>
    </div>

    <div class="flex justify-center col-span-2">
      <button type="submit" class="px-6 py-3 bg-violet-950 text-white rounded-md">Submit</button>
    </div>
  </form>
</div>

</body>
</html>
