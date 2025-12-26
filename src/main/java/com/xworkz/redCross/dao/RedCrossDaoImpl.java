package com.xworkz.redCross.dao;

import com.xworkz.redCross.dto.DonarAccountDto;
import lombok.SneakyThrows;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.Optional;

@Repository
public class RedCrossDaoImpl implements RedCrossDao{


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
    public boolean save(DonarAccountDto donarAccountDto) {

        String sql = "INSERT INTO donor_account " + "(first_name, last_name, email, dob, zip_code, password, confirm_password) " + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, donarAccountDto.getFirstName());
            preparedStatement.setString(2, donarAccountDto.getLastName());
            preparedStatement.setString(3, donarAccountDto.getEmail());
            preparedStatement.setString(4, donarAccountDto.getDob());
            preparedStatement.setString(5, donarAccountDto.getZipCode());
            preparedStatement.setString(6, donarAccountDto.getPassword());
            preparedStatement.setString(7,donarAccountDto.getConfirmPassword());

            System.out.println("saving to DB:" + donarAccountDto);

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
    public Optional<DonarAccountDto> getDonarByEmail(String email) {

        String sql = "SELECT * FROM donor_account WHERE email = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                DonarAccountDto donarAccountDto = new DonarAccountDto();

                donarAccountDto.setEmail(resultSet.getString("email"));
                donarAccountDto.setFirstName(resultSet.getString("first_name"));
                donarAccountDto.setLastName(resultSet.getString("last_name"));
                donarAccountDto.setDob(resultSet.getString("dob"));
                donarAccountDto.setZipCode(resultSet.getString("zip_code"));
                donarAccountDto.setPassword(resultSet.getString("password"));
                donarAccountDto.setConfirmPassword(resultSet.getString("confirm_password"));

                return Optional.of(donarAccountDto);
            }
        }

        return Optional.empty();
    }

    @Override
    @SneakyThrows
    public boolean update(DonarAccountDto donarAccountDto) {

        String sql = "UPDATE donor_account SET first_name=?, last_name=?, dob=? , zip_code=?, password = ?, confirm_password=? WHERE email=?";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement preparedStatement = conn.prepareStatement(sql))
        {
            preparedStatement.setString(1, donarAccountDto.getFirstName());
            preparedStatement.setString(2, donarAccountDto.getLastName());
            preparedStatement.setString(3, donarAccountDto.getEmail());
            preparedStatement.setString(4, donarAccountDto.getDob());
            preparedStatement.setString(5, donarAccountDto.getZipCode());
            preparedStatement.setString(6, donarAccountDto.getPassword());
            preparedStatement.setString(7,donarAccountDto.getConfirmPassword());

            int rows = preparedStatement.executeUpdate();

            System.out.println("rows updated:" + rows);

            return rows > 0;

        }
    }
}
