package com.example.abccinemawebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/SeatServlet")
public class SeatServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] selectedSeats = request.getParameterValues("selectedSeats");
        String adultCount = request.getParameter("adults");
        String childCount = request.getParameter("children");

        try {
            int adultTickets = adultCount != null ? Integer.parseInt(adultCount) : 0;
            int childTickets = childCount != null ? Integer.parseInt(childCount) : 0;

            int adultPrice = 1150;
            int childPrice = 750;

            int totalCost = (adultTickets * adultPrice) + (childTickets * childPrice);

            if (selectedSeats == null || selectedSeats.length == 0) {
                request.setAttribute("error", "Please select at least one seat.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            request.setAttribute("selectedSeats", String.join(", ", selectedSeats));
            request.setAttribute("adultTickets", adultTickets);
            request.setAttribute("childTickets", childTickets);
            request.setAttribute("totalCost", totalCost);

            request.getRequestDispatcher("temp_summary.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number of tickets entered.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
