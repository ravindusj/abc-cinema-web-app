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

@WebServlet("/PaymentServ")
public class PaymentServ extends HttpServlet {

    private static final String CLIENT_ID = "AdXAiqy1nsBoA5WxABbyyb0S9cRP6zLaj7twYqjLyPFRUV-YeqUVcfe2CLFEGcaHXZlJojwi83_uolAH";
    private static final String CLIENT_SECRET = "EHlgQQsDtyBR5cFAu89mREJFt6d5qGe4zAkf7mlMbLnZXxPj2yvrPENq3FW-65CV-S7htVfvZ1GlR2li";
    private static final String MODE = "sandbox";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String movieName = request.getParameter("movieName");
        String totalCostStr = request.getParameter("totalCost");

        try {
            if (movieName == null || totalCostStr == null) {
                throw new IllegalArgumentException("Inputs are missing");
            }

            double totalCost = Double.parseDouble(totalCostStr);
            double amountUSD = totalCost * 0.0033;

            Payment payment = createPayment(request, amountUSD, movieName);

            String approvalUrl = payment.getLinks().stream()
                    .filter(link -> link.getRel().equals("approval_url"))
                    .findFirst()
                    .map(Links::getHref)
                    .orElseThrow(() -> new PayPalRESTException("No approval URL found"));

            HttpSession session = request.getSession();
            session.setAttribute("paymentAmount", amountUSD);
            session.setAttribute("movieName", movieName);

            response.sendRedirect(approvalUrl);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error in total cost format");
        } catch (PayPalRESTException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "PayPal payment creation error: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }

    private Payment createPayment(HttpServletRequest request, double amount, String movieName)
            throws PayPalRESTException {

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

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

        RedirectUrls redirectUrls = new RedirectUrls();
        String baseUrl = getBaseUrl(request);
        redirectUrls.setReturnUrl(baseUrl + "/SuccessfullPayment");
        redirectUrls.setCancelUrl(baseUrl + "/CancelPayment");
        payment.setRedirectUrls(redirectUrls);

        payment.setPayer(new Payer().setPaymentMethod("paypal"));
        return payment.create(apiContext);
    }
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