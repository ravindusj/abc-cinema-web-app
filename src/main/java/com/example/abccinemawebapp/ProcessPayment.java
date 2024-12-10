package com.example.abccinemawebapp;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ProcessPayment")
public class ProcessPayment extends HttpServlet {

    private static final String CLIENT_ID = "AdXAiqy1nsBoA5WxABbyyb0S9cRP6zLaj7twYqjLyPFRUV-YeqUVcfe2CLFEGcaHXZlJojwi83_uolAH";
    private static final String CLIENT_SECRET = "EHlgQQsDtyBR5cFAu89mREJFt6d5qGe4zAkf7mlMbLnZXxPj2yvrPENq3FW-65CV-S7htVfvZ1GlR2li";
    private static final String MODE = "sandbox";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String movieName = request.getParameter("movieName");
        String totalCostStr = request.getParameter("totalCost");

        try {
            // Validate inputs
            if (movieName == null || totalCostStr == null) {
                throw new IllegalArgumentException("Movie name or total cost is missing");
            }

            double totalCost = Double.parseDouble(totalCostStr);

            // Convert the cost to USD (adjust the exchange rate as necessary)
            double amountUSD = totalCost * 0.0033; // Example: LKR to USD conversion rate

            // Create the payment
            Payment payment = createPayment(request, amountUSD, movieName);

            // Get the approval URL from PayPal
            String approvalUrl = payment.getLinks().stream()
                    .filter(link -> link.getRel().equals("approval_url"))
                    .findFirst()
                    .map(Links::getHref)
                    .orElseThrow(() -> new PayPalRESTException("No approval URL found"));

            // Store payment details in session for later reference
            HttpSession session = request.getSession();
            session.setAttribute("paymentAmount", amountUSD);
            session.setAttribute("movieName", movieName);

            // Redirect user to PayPal for approval
            response.sendRedirect(approvalUrl);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid total cost format");
        } catch (PayPalRESTException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "PayPal payment creation error: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }

    // Create a PayPal Payment request
    private Payment createPayment(HttpServletRequest request, double amount, String movieName)
            throws PayPalRESTException {

        // Set up PayPal API Context
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        // Create the Payment object
        Amount totalAmount = new Amount();
        totalAmount.setCurrency("USD");
        totalAmount.setTotal(String.format("%.2f", amount));

        Transaction transaction = new Transaction();
        transaction.setAmount(totalAmount);
        transaction.setDescription("Booking for " + movieName);

        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);

        Payment payment = new Payment();
        payment.setIntent("sale");
        payment.setTransactions(transactions);

        // Set the redirect URLs
        RedirectUrls redirectUrls = new RedirectUrls();
        String baseUrl = getBaseUrl(request);
        redirectUrls.setReturnUrl(baseUrl + "/PaymentSuccessServlet");
        redirectUrls.setCancelUrl(baseUrl + "/PaymentCancelServlet");
        payment.setRedirectUrls(redirectUrls);

        // Set the payment method
        payment.setPayer(new Payer().setPaymentMethod("paypal"));

        // Create the payment using PayPal API
        return payment.create(apiContext);
    }

    // Helper method to get base URL
    private String getBaseUrl(HttpServletRequest request) {
        String scheme = request.getScheme();
        String serverName = request.getServerName();
        int serverPort = request.getServerPort();
        String contextPath = request.getContextPath();

        StringBuilder url = new StringBuilder();
        url.append(scheme).append("://")
                .append(serverName);

        if ((scheme.equals("http") && serverPort != 80) ||
                (scheme.equals("https") && serverPort != 443)) {
            url.append(":").append(serverPort);
        }

        url.append(contextPath);
        return url.toString();
    }
}