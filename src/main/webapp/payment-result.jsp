<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="jakarta.servlet.http.Cookie" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Payment Result</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      padding: 50px;
      background-color: #f4f4f4;
    }
    .result-container {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      padding: 30px;
      max-width: 500px;
      margin: 0 auto;
    }
    .success {
      color: green;
    }
    .failed {
      color: red;
    }
    .cancelled {
      color: orange;
    }
    .btn {
      display: inline-block;
      padding: 10px 20px;
      margin-top: 20px;
      text-decoration: none;
      background-color: #007bff;
      color: white;
      border-radius: 5px;
    }
    .qr-code {
      max-width: 250px;
      margin: 20px auto;
    }
    .debug-info {
      background-color: #f0f0f0;
      padding: 10px;
      margin-top: 20px;
      text-align: left;
      font-size: 0.8em;
    }
  </style>
</head>
<body>

<%
  // Retrieve cookie values
  Cookie[] cookies = request.getCookies();
  String userEmail = "";

  if (cookies != null) {
    for (Cookie cookie : cookies) {
      switch (cookie.getName()) {
        case "userEmail":
          userEmail = URLDecoder.decode(cookie.getValue(), "UTF-8");
          break;
      }
    }
  }
%>

<div class="result-container">
  <%
    String status = request.getParameter("status");
    if (status == null) {
      status = (String) request.getAttribute("paymentId") != null ? "success" : "failed";
    }

    // Debug information
    String debugInfo = "Initial Status: " + status;
  %>

  <% if ("success".equals(status)) { %>
  <h1 class="success">Payment Successful!</h1>
  <p>Your payment has been processed.</p>
  <%
    String paymentId = (String) request.getAttribute("paymentId");
    String amount = (String) request.getAttribute("amount");
    String currency = (String) request.getAttribute("currency");
    String qrCode = (String) request.getAttribute("qrCode");
    String ticketInfo = (String) request.getAttribute("ticketInfo");

    // Additional debug tracking
    debugInfo += "\nPayment ID: " + (paymentId != null ? paymentId : "NULL");
    debugInfo += "\nQR Code Available: " + (qrCode != null && !qrCode.isEmpty());

    if (paymentId != null) {
  %>
  <p>Payment ID: <%= paymentId %></p>
  <p>Amount: <%= amount %> <%= currency %></p>

  <%
    // Robust QR code handling
    if (qrCode != null && !qrCode.isEmpty()) {
  %>
  <div class="qr-code">
    <h2>Your Ticket QR Code</h2>
    <img src="data:image/png;base64,<%= qrCode %>" alt="Ticket QR Code" style="max-width: 100%; height: auto;">
    <pre><%= ticketInfo != null ? ticketInfo : "No ticket information available" %></pre>
  </div>
  <%
  } else {
    debugInfo += "\nQR Code Display Failed";
  %>
  <div class="failed">
    <p>QR Code could not be generated. Please contact support.</p>
  </div>
  <% } %>

  <% } %>
  <% } else if ("cancelled".equals(status)) { %>
  <h1 class="cancelled">Payment Cancelled</h1>
  <p>You have cancelled the payment process.</p>
  <% } else if ("error".equals(status)) { %>
  <h1 class="failed">Payment Error</h1>
  <p>There was an error processing your payment. Please try again.</p>
  <% } else { %>
  <h1 class="failed">Payment Failed</h1>
  <p>Your payment could not be completed. Please try again.</p>
  <% } %>

  <a href="index.jsp" class="btn">Return to Home</a>

  <!-- Debug Information Section -->
  <div class="debug-info">
    <h3>Debug Information</h3>
    <pre><%= debugInfo %></pre>
  </div>
</div>
</body>
</html>