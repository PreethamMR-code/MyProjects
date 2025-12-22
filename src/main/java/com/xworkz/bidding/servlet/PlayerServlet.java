package com.xworkz.bidding.servlet;

import com.xworkz.bidding.dto.PlayerDTO;
import com.xworkz.bidding.service.PlayerService;
import com.xworkz.bidding.service.PlayerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/PlayerServlet",loadOnStartup = 1)
public class PlayerServlet extends HttpServlet {

    PlayerService playerService = new PlayerServiceImpl();

    public PlayerServlet(){
        System.out.println("player servlet object created");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        System.out.println("PlayerServlet doPost started");
        resp.setContentType("text/html");

        try {
            // SAFE PARAMETER EXTRACTION with NULL checks
            String playerName = req.getParameter("playerName");
            String ageStr = req.getParameter("age");
            String playerType = req.getParameter("playerType");
            String battingAvgStr = req.getParameter("battingAvg");
            String bowlingAvgStr = req.getParameter("bowlingAvg");
            String stumpingsStr = req.getParameter("stumpings");
            String state = req.getParameter("state");

            // VALIDATE non-null first
            if (playerName == null || playerType == null || state == null) {
                req.setAttribute("error", "Required fields missing!");
                req.getRequestDispatcher("registration.jsp").forward(req, resp);
                return;
            }

            // SAFE PARSING with defaults
            int age = ageStr != null ? Integer.parseInt(ageStr) : 0;
            double battingAvg = battingAvgStr != null ? Double.parseDouble(battingAvgStr) : 0.0;
            double bowlingAvg = bowlingAvgStr != null ? Double.parseDouble(bowlingAvgStr) : 0.0;
            int stumpings = stumpingsStr != null ? Integer.parseInt(stumpingsStr) : 0;

            // NO bidCount/soldTo needed for NEW players!
            PlayerDTO playerDTO = new PlayerDTO(playerName, age, playerType, battingAvg, bowlingAvg, stumpings, state, 0, null);

            System.out.println("PlayerDTO: " + playerDTO);

            // Call service
            boolean saved = playerService.validateAndSave(playerDTO);

            if (saved) {
                req.setAttribute("success", "Player registered successfully!");
                req.setAttribute("playerName", playerName);
            } else {
                req.setAttribute("fail", "Registration failed! Check data.");
            }

            req.getRequestDispatcher("result.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid number format! Check age/averages.");
            e.printStackTrace();
            req.getRequestDispatcher("registration.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Unexpected error occurred.");
            e.printStackTrace();
            req.getRequestDispatcher("registration.jsp").forward(req, resp);
        }
    }
}
