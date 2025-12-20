package com.xworkz.bidding.dao;

import com.xworkz.bidding.dto.CompanyDTO;
import com.xworkz.bidding.dto.PlayerDTO;
import com.xworkz.bidding.dto.SearchDTO;
import lombok.SneakyThrows;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static java.sql.DriverManager.getConnection;

public class PlayerDaoImpl implements PlayerDAO {


    private static final String URL = "jdbc:mysql://localhost:3306/matrimony_db";
    private static final String USER = "root";
    private static final String PASS = "0000";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySql driver is loaded");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean save(PlayerDTO playerDTO) {


        String sql = "Insert into auction (playerName,age, playerType,battingAvg,bowlingAvg, stumpings, state) Values (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection(URL, USER, PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, playerDTO.getPlayerName());
            preparedStatement.setInt(2, playerDTO.getAge());
            preparedStatement.setString(3, playerDTO.getPlayerType());
            preparedStatement.setDouble(4, playerDTO.getBattingAvg());
            preparedStatement.setDouble(5, playerDTO.getBowlingAvg());
            preparedStatement.setInt(6, playerDTO.getStumpings());
            preparedStatement.setString(7, playerDTO.getState());

            System.out.println("saving to DB :" + playerDTO);

            int rows = preparedStatement.executeUpdate();

            System.out.println("rows inserted:" + rows);

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    @SneakyThrows
    public Optional<CompanyDTO> findByEmail(CompanyDTO companyDTO) {

        String sql = "select company_name,email from company where email = ?";


        try (Connection connection = getConnection(URL, USER, PASS);

             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, companyDTO.getEmail());

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                String companyName = resultSet.getString(1);
                String gmail = resultSet.getString(2);

                CompanyDTO companyDTO1 = new CompanyDTO(companyName, gmail);

                return Optional.of(companyDTO1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return Optional.empty();
    }

    @Override
    @SneakyThrows
    public List<PlayerDTO> findPlayersForBidding(SearchDTO searchDTO) {

        List<PlayerDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM auction WHERE playerType = ? AND battingAvg >= ? and bowlingAvg <= ? and stumpings >= ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASS);

             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, searchDTO.getPlayerType());
            preparedStatement.setDouble(2, searchDTO.getBattingAvg());
            preparedStatement.setDouble(3, searchDTO.getBowlingAvg());
            preparedStatement.setInt(4, searchDTO.getStumpings());


            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {


                String playerName = resultSet.getString("playerName");
                int age = resultSet.getInt("age");
                String  playerType = resultSet.getString("playerType");
                double  battingAvg = resultSet.getDouble("battingAvg");
                double  bowlingAvg = resultSet.getDouble("bowlingAvg");
                int stumpings = resultSet.getInt("stumpings");
                String state = resultSet.getString("state");
                int bidCount = resultSet.getInt("bidCount");
                String soldTo = resultSet.getString("soldTo");


                PlayerDTO playerDTO = new PlayerDTO(playerName, age, playerType,  battingAvg, bowlingAvg, stumpings, state,bidCount,soldTo);

                list.add(playerDTO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
