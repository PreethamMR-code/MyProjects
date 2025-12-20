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
import java.util.Optional;

@WebServlet(urlPatterns = "/CompanyLogin",loadOnStartup = 1)
public class CompanyLoginServlet extends HttpServlet {

    public CompanyLoginServlet(){
        System.out.println("company object created");
    }

   PlayerService playerService = new PlayerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        CompanyDTO companyDTO =new CompanyDTO(email);

        System.out.println("email is fetching :"+companyDTO);

        Optional<CompanyDTO> optionalCompanyDTO = playerService.validateAndLogin(companyDTO);
        if(optionalCompanyDTO.isPresent()){

//            req.setAttribute("optionalCompanyDTO",optionalCompanyDTO.get());

            req.getSession().setAttribute("companyDTO", optionalCompanyDTO.get());

            req.getRequestDispatcher("bidding.jsp").forward(req,resp);

        }else {
            req.setAttribute("error", "Company not registered");
            req.getRequestDispatcher("company.jsp").forward(req, resp);
        }
    }
}
