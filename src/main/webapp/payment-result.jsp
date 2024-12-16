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
      background-color: #111827;
    }
    .result-container {
      background-color: #d1d5db;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      padding: 30px;
      max-width: 500px;
      margin: 0 auto;
    }
    .success {
      color: #2e1065;
    }
    .failed {
      color: red;
    }
    .cancelled {
      color: #facc15;
    }
    .btn {
      display: inline-block;
      padding: 10px 20px;
      margin-top: 20px;
      text-decoration: none;
      background-color: #2e1065;
      color: white;
      border-radius: 5px;
    }
    .qr-code {
      max-width: 250px;
      margin: 20px auto;
    }
  </style>
</head>
<body class="flex justify-center items-center flex-col min-h-screen">

<%
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

    String debugInfo = "Initial Status: " + status;
  %>

  <% if ("success".equals(status)) { %>
  <h1 class="success">Your Payment Successful !</h1>
    <p>Your payment has been processed.</p> <p> We will send you email with QR Tickets. Thank You for choosing us.</p>
  <%
    String paymentId = (String) request.getAttribute("paymentId");
    String amount = (String) request.getAttribute("amount");
    String currency = (String) request.getAttribute("currency");
    String qrCode = (String) request.getAttribute("qrCode");
    String ticketInfo = (String) request.getAttribute("ticketInfo");


    if (paymentId != null) {
  %>
  <p>Payment ID: <%= paymentId %></p>
  <p>Amount: <%= amount %> <%= currency %></p>

  <%
    if (qrCode != null && !qrCode.isEmpty()) {
  %>
  <div class="qr-code">
    <h2>Your Ticket QR Code</h2>
    <img src="data:image/png;base64,<%= qrCode %>" alt="Ticket QR Code" style="max-width: 100%; height: auto;">
    <pre><%= ticketInfo != null ? ticketInfo : "No ticket information available" %></pre>
  </div>
  <%
  } else {

  %>
  <div class="failed">
    <p>QR Code could not be generated. There was an error Processing QR Code.</p>
  </div>
  <% } %>

  <% } %>
  <% } else if ("cancelled".equals(status)) { %>
  <h1 class="cancelled">Payment Cancelled</h1>
  <p>You have cancelled the payment for your purchase.</p>
  <% } else if ("error".equals(status)) { %>
  <h1 class="failed">Payment Error</h1>
  <p>There was an error processing your ticket payment.</p>
  <% } else { %>
  <h1 class="failed">Payment Failed</h1>
  <p>Your ticket payment could not be completed. There was an error in your payment.</p>
  <% } %>

  <a href="index.jsp" class="btn">Return to Home</a>
</body>
</html>