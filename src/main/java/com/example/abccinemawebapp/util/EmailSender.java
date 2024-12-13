package com.example.abccinemawebapp.util;

import jakarta.activation.DataHandler;
import jakarta.activation.DataSource;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.mail.util.ByteArrayDataSource;

import java.util.Properties;
import java.util.Base64;

public class EmailSender {
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;
    private static final String USERNAME = "ravindulach@gmail.com"; // Replace with your email
    private static final String PASSWORD = "wvpezrwimemdvedc"; // Use App Password for Gmail

    public static void sendTicketConfirmation(String recipientEmail, String ticketInfo, String qrCodeBase64) {
        // Configure mail properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        // Create a session with authentication
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });

        try {
            // Create a message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Your Movie Ticket Confirmation");

            // Create multipart message
            Multipart multipart = new MimeMultipart();

            // Text part
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setText(ticketInfo);
            multipart.addBodyPart(textPart);

            // QR Code part
            if (qrCodeBase64 != null) {
                MimeBodyPart qrCodePart = new MimeBodyPart();
                byte[] qrCodeBytes = Base64.getDecoder().decode(qrCodeBase64);
                DataSource dataSource = new ByteArrayDataSource(qrCodeBytes, "image/png");
                qrCodePart.setDataHandler(new DataHandler(dataSource));
                qrCodePart.setFileName("ticket-qr-code.png");
                multipart.addBodyPart(qrCodePart);
            }

            // Set content
            message.setContent(multipart);

            // Send message
            Transport.send(message);

            System.out.println("Ticket confirmation email sent successfully.");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
