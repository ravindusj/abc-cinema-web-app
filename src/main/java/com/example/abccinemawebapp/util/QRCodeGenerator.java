package com.example.abccinemawebapp.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import java.io.ByteArrayOutputStream;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

public class QRCodeGenerator {
    private static final Logger LOGGER = Logger.getLogger(QRCodeGenerator.class.getName());

    public static String generateQRCodeBase64(String ticketInfo, int width, int height) {
        try {

            if (ticketInfo == null || ticketInfo.isEmpty()) {
                LOGGER.warning("Ticket info is null or empty");
                return null;
            }

            BitMatrix bitMatrix = new MultiFormatWriter().encode(
                    ticketInfo,
                    BarcodeFormat.QR_CODE,
                    width,
                    height
            );

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", baos);

            byte[] qrCodeBytes = baos.toByteArray();
            String base64QR = Base64.getEncoder().encodeToString(qrCodeBytes);

            LOGGER.info("QR Code Generated. Length: " + base64QR.length());
            return base64QR;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error generating QR Code", e);
            return null;
        }
    }
}