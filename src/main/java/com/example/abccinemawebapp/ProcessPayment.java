package com.example.abccinemawebapp;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ProcessPayment")
public class ProcessPayment extends HttpServlet {

    private static final String CLIENT_ID = "AdXAiqy1nsBoA5WxABbyyb0S9cRP6zLaj7twYqjLyPFRUV-YeqUVcfe2CLFEGcaHXZlJojwi83_uolAH";  // Replace with your PayPal Client ID
    private static final String CLIENT_SECRET = "ENDaztRreRFoudncMxKnvgGdCgxO2jabwgaBQLVelND9o0lP9rOXrjjj1BUV2PvRs76k5m_tYP6j2SSF";  // Replace with your PayPal Client Secret
    private static final String MODE = "sandbox";  // Use 'live' for production

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String movieName = request.getParameter("movieName");
        String totalCostStr = request.getParameter("totalCost");

        try {
            double totalCost = Double.parseDouble(totalCostStr);
            // Convert the cost to USD (adjust the exchange rate as necessary)
            double amountUSD = totalCost * 0.0033; // Example: LKR to USD conversion rate

            // Create the payment (details like item description, price, etc.)
            Payment payment = createPayment(amountUSD, movieName);

            // Get the approval URL from PayPal
            String approvalUrl = null;
            for (Links link : payment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    approvalUrl = link.getHref();
                }
            }

            // Redirect user to PayPal for approval
            if (approvalUrl != null) {
                response.sendRedirect(approvalUrl);
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error with PayPal payment creation.");
            }

        } catch (NumberFormatException | PayPalRESTException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid total cost or PayPal error.");
        }
    }

    // Create a PayPal Payment request
    private Payment createPayment(double amount, String movieName) throws PayPalRESTException {
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

        // Set the redirect URLs (success and cancel URLs)
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setReturnUrl("http://yourwebsite.com/payment-success");
        redirectUrls.setCancelUrl("http://yourwebsite.com/payment-cancel");
        payment.setRedirectUrls(redirectUrls);

        // Set the payment method (PayPal)
        payment.setPayer(new Payer().setPaymentMethod("paypal"));

        // Create the payment using PayPal API
        return payment.create(apiContext);
    }
}
