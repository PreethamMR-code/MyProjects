package com.xworkz.bidding.servlet;


import com.xworkz.bidding.dto.BidDTO;
import com.xworkz.bidding.dto.CompanyDTO;
import com.xworkz.bidding.service.PlayerService;
import com.xworkz.bidding.service.PlayerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/placeBid",loadOnStartup = 1)
public class PlaceBidServlet extends HttpServlet {

    PlayerService playerService = new PlayerServiceImpl();

    public PlaceBidServlet(){
        System.out.println("place bid servlet object created");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        System.out.println("PlaceBidServlet doPost started");

        try {
            // 1. Extract form parameters
            String playerName = req.getParameter("playerName");
            String companyName = req.getParameter("companyName");
            double bidAmount = Double.parseDouble(req.getParameter("bidAmount"));

            // 2. Create DTO
            BidDTO bidDTO = new BidDTO(playerName, companyName, bidAmount);
            System.out.println("Bid received: " + bidDTO);

            // 3. Call service
            boolean bidPlaced = playerService.placeBid(bidDTO);

            if (bidPlaced) {
                req.setAttribute("success", " Bid placed successfully for " + playerName + "!");
                req.setAttribute("bid", bidDTO);
            } else {
                req.setAttribute("error", " Failed to place bid. Please check details and try again.");
            }

        } catch (NumberFormatException e) {
            req.setAttribute("error", " Invalid bid amount. Please enter a valid number.");
            System.out.println("Invalid bid amount: " + e.getMessage());
        } catch (Exception e) {
            req.setAttribute("error", " An error occurred. Please try again.");
            e.printStackTrace();
        }

        // 4. Forward to JSP (same page for success/error)
        req.getRequestDispatcher("bidding.jsp").forward(req, resp);

        System.out.println("PlaceBidServlet doPost ended");
  }
}
