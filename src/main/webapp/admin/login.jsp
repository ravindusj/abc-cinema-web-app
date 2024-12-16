<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login | ABC Cinema</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white flex items-center min-h-screen justify-center w-full">

<div style="width: 300px;">
  <h2 class="text-2xl font-bold text-center">Admin Login</h2>

  <form action="${pageContext.request.contextPath}/loginServlet" method="POST">

    <div class="mb-4">
      <input type="text" id="username" placeholder="username" name="username" class="w-full p-3 text-gray-900 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>
    <div class="mb-4">
      <input type="password" id="password" name="password"  placeholder="password" class="w-full p-3 text-gray-900 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
    </div>

    <div>
      <button type="submit" class="w-full bg-violet-950 text-white px-4 py-2 rounded-md font-medium">Login</button>
    </div>

  </form>
</div>

</body>
</html>