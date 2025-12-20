package com.xworkz.bidding.servlet;


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

        // 1. Get player name & bid amount
        String playerName = req.getParameter("playerName");
        double bidAmount = Double.parseDouble(req.getParameter("bidAmount"));


        // 2. Get company from session (SIMPLE & CLEAN)
        CompanyDTO companyDTO =
                (CompanyDTO) req.getSession().getAttribute("companyDTO");

        // Safety check (optional but good)
        if (companyDTO == null) {
            req.setAttribute("error", "Session expired. Please login again.");
            req.getRequestDispatcher("company.jsp").forward(req, resp);
            return;
        }

        String companyName = companyDTO.getCompanyName();

        // 3. Call service
        boolean bidPlaced =
                playerService.placeBid(playerName, bidAmount, companyName);

        // 4. Redirect back to bidding page
        req.getRequestDispatcher("bidding.jsp").forward(req, resp);

        System.out.println("PlaceBidServlet doPost ended");
    }
}
