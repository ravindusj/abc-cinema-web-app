<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  </style>
</head>
<body>
<div class="result-container">
  <%
    String status = request.getParameter("status");
    if (status == null) {
      status = (String) request.getAttribute("paymentId") != null ? "success" : "failed";
    }
  %>

  <% if ("success".equals(status)) { %>
  <h1 class="success">Payment Successful!</h1>
  <p>Your payment has been processed.</p>
  <%
    String paymentId = (String) request.getAttribute("paymentId");
    String amount = (String) request.getAttribute("amount");
    String currency = (String) request.getAttribute("currency");
    if (paymentId != null) {
  %>
  <p>Payment ID: <%= paymentId %></p>
  <p>Amount: <%= amount %> <%= currency %></p>
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
</div>
</body>
</html>