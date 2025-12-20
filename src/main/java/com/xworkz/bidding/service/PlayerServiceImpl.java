package com.xworkz.bidding.service;

import com.xworkz.bidding.dao.PlayerDAO;
import com.xworkz.bidding.dao.PlayerDaoImpl;
import com.xworkz.bidding.dto.CompanyDTO;
import com.xworkz.bidding.dto.PlayerDTO;
import com.xworkz.bidding.dto.SearchDTO;

import java.util.List;
import java.util.Optional;


public class PlayerServiceImpl implements PlayerService {

    PlayerDAO playerDAO = new PlayerDaoImpl();

    @Override
    public boolean validateAndSave(PlayerDTO playerDTO) {
        boolean invalid = false;

        if (playerDTO != null) {
            System.out.println("data is  entered");

            System.out.println("validation started");

            if (playerDTO.getPlayerName() == null || playerDTO.getPlayerName().trim().length() < 4) {
                System.out.println(" name not valid");
                invalid = true;
            }

            if (playerDTO.getPlayerType() == null || playerDTO.getPlayerType().isEmpty()) {
                System.out.println(" type not valid");
                invalid = true;
            }

            if (playerDTO.getAge() <= 18) {
                System.out.println("age not valid");
                invalid = true;
            }
            if (playerDTO.getBattingAvg() < 0) {
                System.out.println("batting avg not valid");
                invalid = true;
            }
            if (playerDTO.getBowlingAvg() < 0) {
                System.out.println("bowling avg not valid");
                invalid = true;
            }
            if (playerDTO.getStumpings() < 0) {
                System.out.println("stump avg not valid");
                invalid = true;
            }

            if (playerDTO.getState() == null || playerDTO.getState().length() < 5) {
                System.out.println("state avg not valid");
                invalid = true;
            }
        }

        if (!invalid) {

            System.out.println("all valid and proceeding to save");

            boolean saved = playerDAO.save(playerDTO);
            System.out.println("validation is done and saved to DB:" + saved);

            if (!saved) {
                invalid = true;
            }
        }
        return invalid;

    }


    @Override
    public Optional<CompanyDTO> validateAndLogin(CompanyDTO companyDTO) {

        System.out.println("validation started");
        if (companyDTO == null) {
            return Optional.empty();
        }

        System.out.println("company dto is checked and is not null");
        String email = companyDTO.getEmail();

        System.out.println("company dto is checked ");

        // validation
        if (email == null || email.trim().isEmpty()) {
            return Optional.empty();
        }
        System.out.println(" email is not null ");

        email = email.trim();

        boolean validEmail = email.matches("^[A-Za-z0-9+_.-]+@(.+)$");
        if (!validEmail) {
            System.out.println("email is not valid");
            return Optional.empty();
        }

        System.out.println("email is valid and procedding to DAO");
        // call DAO only after validation
        return playerDAO.findByEmail(companyDTO);
    }

    @Override
    public List<PlayerDTO> findPlayersForBidding(SearchDTO searchDTO) {

        boolean invalid = false;

        if (searchDTO != null) {
            System.out.println("data is  entered");

            System.out.println("validation started");

            if (searchDTO.getPlayerType() == null || searchDTO.getPlayerType().isEmpty()) {
                System.out.println(" type not valid");
                invalid = true;
            }

            if (searchDTO.getBattingAvg() < 0) {
                System.out.println("batting avg not valid");
                invalid = true;
            }
            if (searchDTO.getBowlingAvg() < 0) {
                System.out.println("bowling avg not valid");
                invalid = true;
            }
            if (searchDTO.getStumpings() < 0) {
                System.out.println("stump avg not valid");
                invalid = true;
            }
        }

        if (!invalid) {

            System.out.println("all valid and proceeding to save");

            List<PlayerDTO> saved = playerDAO.findPlayersForBidding(searchDTO);
            System.out.println("validation is done and saved to DB:" + saved);
            return saved;
        } else {
            return null;
        }

    }
}
