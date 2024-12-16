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
    private static final String USERNAME = "ravindulach@gmail.com";
    private static final String PASSWORD = "wvpezrwimemdvedc";

    public static void sendTicketConfirmation(String recipientEmail, String ticketInfo, String qrCodeBase64) {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);


        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Your Movie Ticket Confirmation");

            Multipart multipart = new MimeMultipart();
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setText(ticketInfo);
            multipart.addBodyPart(textPart);


            if (qrCodeBase64 != null) {
                MimeBodyPart qrCodePart = new MimeBodyPart();
                byte[] qrCodeBytes = Base64.getDecoder().decode(qrCodeBase64);
                DataSource dataSource = new ByteArrayDataSource(qrCodeBytes, "image/png");
                qrCodePart.setDataHandler(new DataHandler(dataSource));
                qrCodePart.setFileName("ticket-qr-code.png");
                multipart.addBodyPart(qrCodePart);
            }


            message.setContent(multipart);


            Transport.send(message);

            System.out.println("Ticket confirmation email sent successfully.");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
