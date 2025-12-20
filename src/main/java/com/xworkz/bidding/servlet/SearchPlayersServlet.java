package com.xworkz.bidding.servlet;


import com.xworkz.bidding.dto.PlayerDTO;
import com.xworkz.bidding.dto.SearchDTO;
import com.xworkz.bidding.service.PlayerService;
import com.xworkz.bidding.service.PlayerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(urlPatterns = "/searchPlayers", loadOnStartup = 1)
public class SearchPlayersServlet extends HttpServlet {

    public SearchPlayersServlet() {
        System.out.println("Search Players Servlet object created");
    }

    PlayerService playerService = new PlayerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String playerType = req.getParameter("playerType");
        double battingAvg = Double.valueOf(req.getParameter("battingAvg"));
        double bowlingAvg = Double.valueOf(req.getParameter("bowlingAvg"));
        int stumpings = Integer.parseInt(req.getParameter("stumpings"));

        SearchDTO searchDTO = new SearchDTO(playerType, battingAvg, bowlingAvg, stumpings);
        System.out.println("player search----:" + searchDTO);



        // Call service
        List<PlayerDTO> saved = playerService.findPlayersForBidding(searchDTO);
        System.out.println(saved);


        if (saved.isEmpty()) {
            req.setAttribute("error", "Players not found ");
            req.getRequestDispatcher("bidding.jsp").forward(req, resp);
        }else {
            req.setAttribute("success","players listed");
            req.setAttribute("players",saved);
            req.getRequestDispatcher("bidding.jsp").forward(req,resp);

        }
    }
}
