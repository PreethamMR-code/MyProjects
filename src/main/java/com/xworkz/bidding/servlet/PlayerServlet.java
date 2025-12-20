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

        System.out.println("DO POST stated");
        resp.setContentType("text/html");

        String playerName = req.getParameter("playerName");
        int age = Integer.parseInt(req.getParameter("age"));
        String playerType = req.getParameter("playerType");
        double battingAvg = Double.parseDouble(req.getParameter("battingAvg"));
        double bowlingAvg = Double.parseDouble(req.getParameter("bowlingAvg"));
        int stumpings = Integer.parseInt(req.getParameter("stumpings"));
        String state = req.getParameter("state");
        int bidCount = Integer.parseInt(req.getParameter("bidCount"));
        String soldTo = req.getParameter("soldTo");

        PlayerDTO playerDTO = new PlayerDTO(playerName,age,playerType,battingAvg,bowlingAvg,stumpings,state,bidCount,soldTo);


        try{
            playerService.validateAndSave(playerDTO);


            req.setAttribute("playerName",playerName);
            req.setAttribute("age",age);
            req.setAttribute("playerType",playerType);
            req.setAttribute("battingAvg",battingAvg);
            req.setAttribute("bowlingAvg",bowlingAvg);
            req.setAttribute("stumpings",stumpings);
            req.setAttribute("state",state);


            RequestDispatcher requestDispatcher = req.getRequestDispatcher("result.jsp");
            requestDispatcher.forward(req,resp);

            System.out.println("realEstateDTO: "+playerDTO);

        }catch (Exception e){
            e.printStackTrace();
        }

        System.out.println("Do post ended");
    }
}
