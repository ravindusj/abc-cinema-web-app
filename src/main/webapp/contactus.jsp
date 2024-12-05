<!DOCTYPE html>
<html>
<head>
  <script src="https://cdn.tailwindcss.com"></script>
  <title>Contact Us - KCC Multiplex</title>
  <style>
    /* General Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', Arial, sans-serif;
      background-color: #000;
      color: #fff;
    }

    /* Navbar Styling */
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 20px;
      background-color: #111;
    }

    .navbar a {
      text-decoration: none;
      color: #fff;
      margin: 0 15px;
      font-weight: 500;
      transition: color 0.3s ease;
    }

    .navbar a:hover {
      color: #f39c12;
    }

    /* Container Styling */
    .container {
      max-width: 900px;
      margin: 50px auto;
      padding: 30px;
      background-color: #1a1a1a;
      border-radius: 10px;
      box-shadow: 0 8px 20px rgba(255, 255, 255, 0.1);
    }

    .container h1 {
      font-size: 2.5em;
      margin-bottom: 15px;
      text-align: center;
      color: #f39c12;
    }

    .container p {
      font-size: 1.1em;
      text-align: center;
      margin-bottom: 30px;
      color: #bbb;
    }

    /* Form Styling */
    form {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
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

    /* Button Styling */
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

    /* Responsive Design */
    @media (max-width: 768px) {
      form {
        grid-template-columns: 1fr;
      }

      form button {
        grid-column: span 1;
      }
    }
  </style>
</head>
<body>

<!-- Navigation Bar -->
<div class="navbar">
  <div><a href="index.jsp">Home</a></div>
  <div>
    <a href="movies.jsp">Movies</a>
    <a href="cinemas.jsp">Cinemas</a>
    <a href="contact.jsp">Contact Us</a>
  </div>
</div>

<!-- Contact Form -->
<div class="container">
  <h1>Contact Us</h1>
  <p>Whether you are a movie distributor, an aspiring producer, or simply providing feedback on your experience, we’d love to hear from you.</p>
  <form action="https://docs.google.com/forms/d/e/1FAIpQLSdnsppeqstxB8uUSpPZ5FWLawhI2lO6N9j0ZI9dwG_ZbZReeA/formResponse" method="post">
    <!-- Name Field -->
    <div>
      <label for="name">Name</label>
      <input type="text" id="name" name="entry.1302254668" placeholder="Enter your full name" required>
    </div>

    <!-- Email Field -->
    <div>
      <label for="email">Email</label>
      <input type="email" id="email" name="entry.1691193182" placeholder="Enter your email" required>
    </div>

    <!-- Phone Number Field -->
    <div>
      <label for="phone">Phone Number</label>
      <input type="tel" id="phone" name="entry.1012497427" placeholder="Enter your phone number" required>
    </div>

    <!-- Subject Field -->
    <div>
      <label for="subject">Select Your Subject</label>
      <select id="subject" name="entry.1565475192" required>
        <option value="" disabled selected>Select a subject</option>
        <option value="General Inquiry">General Inquiry</option>
        <option value="Feedback">Feedback</option>
        <option value="Advertising">Advertising</option>
        <option value="Other">Other</option>
      </select>
    </div>

    <!-- Message Field -->
    <div>
      <label for="message">Type Your Message Here</label>
      <textarea id="message" name="entry.687026150" rows="6" placeholder="Write your message here" required></textarea>
    </div>

    <!-- Submit Button -->
    <button type="submit">Submit</button>
  </form>
</div>

</body>
</html>
