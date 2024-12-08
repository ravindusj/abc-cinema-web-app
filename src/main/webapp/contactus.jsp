<!DOCTYPE html>
<html>
<head>
  <script src="https://cdn.tailwindcss.com"></script>
  <title>Contact Us - KCC Multiplex</title>
  <style>


    form {
      width: 36vw;
    }

    form label {
      font-size: 14px;
      margin-bottom: 5px;
      color: #bbb;
    }

    form input, form select, form textarea {
      padding: 12px;
      border: 1px solid #333;
      border-radius: 6px;
      background-color: #2c2c2c;
      color: #fff;
      font-size: 14px;
      transition: all 0.3s ease;
    }

    form input:focus, form select:focus, form textarea:focus {
      border-color: #f39c12;
      outline: none;
      background-color: #333;
      box-shadow: 0 0 8px rgba(243, 156, 18, 0.5);
    }

    form textarea {
      resize: none;
      grid-column: span 2;
    }

    form button {
      grid-column: span 2;
      padding: 12px 20px;
      background-color: #f39c12;
      border: none;
      color: #fff;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      border-radius: 6px;
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    form button:hover {
      background-color: #e67e22;
      box-shadow: 0 4px 15px rgba(230, 126, 34, 0.5);
    }
  </style>
</head>
<body class="bg-gray-900 text-white">


<!-- Fixed Navbar Start -->
<nav id="navbar" class="bg-black/75 px-6 py-4 fixed w-8/12 top-2 left-1/2 transform -translate-x-1/2 z-50 rounded-lg shadow-lg transition-all duration-500 ease-in-out">
  <div class="flex items-center justify-between max-w-7xl mx-auto w-full">
    <!-- Logo -->
    <div class="text-white text-2xl font-bold uppercase">ABC Cinema</div>

    <!-- Navigation Links -->
    <ul class="flex items-center space-x-8">
      <li><a href="index.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Home</a></li>
      <li><a href="buyTickets.jsp" class="bg-sky-600 text-white font-normal text-sm px-4 py-2 rounded hover:bg-sky-800">Buy Tickets</a></li>
      <li><a href="movies.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Movies</a></li>
      <li><a href="cinemas.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Cinemas</a></li>
      <li><a href="contactus.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Contact Us</a></li>
    </ul>
  </div>
</nav>
<!-- Fixed Navbar End -->

<script>
  let lastScrollTop = 0;
  const navbar = document.getElementById('navbar');

  // Function to handle navbar visibility based on scroll
  window.addEventListener('scroll', () => {
    const currentScroll = window.pageYOffset || document.documentElement.scrollTop;

    if (currentScroll > lastScrollTop) {
      // Scroll down: hide navbar smoothly
      navbar.style.top = '-100px'; // Adjust this value based on your navbar height
    } else {
      // Scroll up: show navbar smoothly and keep it centered
      navbar.style.top = '0.5rem'; // Keep it fixed at its original position
    }

    lastScrollTop = currentScroll <= 0 ? 0 : currentScroll; // For mobile or negative scrolling
  });
</script>


<div class="flex flex-col justify-center items-center min-h-screen">
  <div>
  <h1 class="text-4xl text-center font-bold">Contact Us</h1>
  <p class="text-sm pt-9 text-center" style="width: 699px; margin: auto;">Whether you are a movie distributor, an aspiring producer, or simply providing feedback on your experience, we’d love to hear from you.</p>
  </div>
  <form class="pt-9"action="https://docs.google.com/forms/d/e/1FAIpQLSdnsppeqstxB8uUSpPZ5FWLawhI2lO6N9j0ZI9dwG_ZbZReeA/formResponse" method="post">


    <div class="flex items-center justify-between" style="gap: 9px">
    <div class="flex flex-col w-full">
      <label for="name">Name</label>
      <input type="text" id="name" name="entry.1302254668" placeholder="Enter your full name" required>
    </div>

        <div class="flex flex-col w-full">
      <label for="email">Email</label>
      <input type="email" id="email" name="entry.1691193182" placeholder="Enter your email" required>
    </div>
    </div>

    <div class="flex items-center pt-9 justify-between" style="gap: 9px">
    <div class="flex flex-col w-full">
      <label for="phone">Phone Number</label>
      <input type="tel" id="phone" name="entry.1012497427" placeholder="Enter your phone number" required>
    </div>

    <div class="flex flex-col w-full">
      <label for="subject">Select Your Subject</label>
      <select id="subject" name="entry.1565475192" required>
        <option value="" disabled selected>Select a subject</option>
        <option value="General Inquiry">General Inquiry</option>
        <option value="Feedback">Feedback</option>
        <option value="Advertising">Advertising</option>
        <option value="Other">Other</option>
      </select>
    </div>
    </div>

    <div class="flex flex-col pt-9">
      <label for="message">Type Your Message Here</label>
      <textarea id="message" name="entry.687026150" rows="6" placeholder="Write your message here" required></textarea>
    </div>

    <div class="flex justify-center pt-9">
    <button type="submit">Submit</button>
    </div>
  </form>
</div>

</body>
</html>
