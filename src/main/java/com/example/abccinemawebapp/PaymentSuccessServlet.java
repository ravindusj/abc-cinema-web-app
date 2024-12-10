package com.example.abccinemawebapp;

import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/PaymentSuccessServlet")
public class PaymentSuccessServlet extends HttpServlet {

    private static final String CLIENT_ID = "AdXAiqy1nsBoA5WxABbyyb0S9cRP6zLaj7twYqjLyPFRUV-YeqUVcfe2CLFEGcaHXZlJojwi83_uolAH";
    private static final String CLIENT_SECRET = "EHlgQQsDtyBR5cFAu89mREJFt6d5qGe4zAkf7mlMbLnZXxPj2yvrPENq3FW-65CV-S7htVfvZ1GlR2li";
    private static final String MODE = "sandbox";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        try {
            APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

            Payment payment = Payment.get(apiContext, paymentId);

            PaymentExecution paymentExecution = new PaymentExecution();
            paymentExecution.setPayerId(payerId);

            // Execute the payment
            Payment executedPayment = payment.execute(apiContext, paymentExecution);

            // Check payment state
            if ("approved".equalsIgnoreCase(executedPayment.getState())) {
                // Payment successful
                request.setAttribute("paymentId", paymentId);
                request.setAttribute("amount", executedPayment.getTransactions().get(0).getAmount().getTotal());
                request.setAttribute("currency", executedPayment.getTransactions().get(0).getAmount().getCurrency());

                request.getRequestDispatcher("/payment-result.jsp").forward(request, response);
            } else {
                // Payment not approved
                response.sendRedirect("payment-result.jsp?status=failed");
            }

        } catch (PayPalRESTException e) {
            e.printStackTrace();
            response.sendRedirect("payment-result.jsp?status=error");
        }
    }
}