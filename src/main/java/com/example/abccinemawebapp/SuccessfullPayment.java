package com.example.abccinemawebapp;

import com.example.abccinemawebapp.util.EmailSender;
import com.example.abccinemawebapp.util.QRCodeGenerator;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/SuccessfullPayment")
public class SuccessfullPayment extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(SuccessfullPayment.class.getName());

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

            Payment executedPayment = payment.execute(apiContext, paymentExecution);

            if ("approved".equalsIgnoreCase(executedPayment.getState())) {
                HttpSession session = request.getSession();
                String movieName = (String) session.getAttribute("movieName");
                String userEmail = (String) session.getAttribute("userEmail");

                String ticketInfo = generateTicketInfo(movieName, paymentId);

                String qrCodeBase64 = generateQRCodeSafely(ticketInfo);

                request.setAttribute("paymentId", paymentId);
                request.setAttribute("amount", executedPayment.getTransactions().get(0).getAmount().getTotal());
                request.setAttribute("currency", executedPayment.getTransactions().get(0).getAmount().getCurrency());

                if (qrCodeBase64 != null && !qrCodeBase64.isEmpty()) {
                    request.setAttribute("qrCode", qrCodeBase64);
                    LOGGER.info("QR Code successfully generated and set. Length: " + qrCodeBase64.length());
                } else {
                    LOGGER.warning("QR Code generation failed");
                }

                request.setAttribute("ticketInfo", ticketInfo);

                sendConfirmationEmail(userEmail, ticketInfo, qrCodeBase64);

                request.getRequestDispatcher("/payment-result.jsp").forward(request, response);
            } else {

                LOGGER.warning("Payment not approved. State: " + executedPayment.getState());
                response.sendRedirect("payment-result.jsp?status=failed");
            }

        } catch (PayPalRESTException e) {
            LOGGER.log(Level.SEVERE, "PayPal REST Exception", e);
            response.sendRedirect("payment-result.jsp?status=error");
        }
    }

    private String generateTicketInfo(String movieName, String paymentId) {
        return String.format("Ticket for %s\nPayment ID: %s\nUnique ID: %s",
                movieName,
                paymentId,
                UUID.randomUUID().toString()
        );
    }

    private String generateQRCodeSafely(String ticketInfo) {
        try {
            String qrCode = QRCodeGenerator.generateQRCodeBase64(ticketInfo, 250, 250);

            if (qrCode == null || qrCode.isEmpty()) {
                LOGGER.warning("QR Code generation returned null or empty");
                return null;
            }

            return qrCode;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error in QR code generation", e);
            return null;
        }
    }

    private void sendConfirmationEmail(String userEmail, String ticketInfo, String qrCodeBase64) {

        try {
            EmailSender.sendTicketConfirmation(userEmail, ticketInfo, qrCodeBase64);
            LOGGER.info("Confirmation email sent successfully");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Failed to send confirmation email", e);
        }
    }
}

