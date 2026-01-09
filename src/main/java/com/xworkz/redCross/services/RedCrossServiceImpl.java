package com.xworkz.redCross.services;

import com.xworkz.redCross.dao.RedCrossDao;
import com.xworkz.redCross.dto.DonarAccountDto;
import com.xworkz.redCross.entity.RedCrossEntity;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class RedCrossServiceImpl implements RedCrossService{

    @Autowired
    RedCrossDao redCrossDao;

    @Override
    public boolean validateAndSave(DonarAccountDto donarAccountDto) {

        if (donarAccountDto == null) {
            System.out.println("DTO is null");
            return false;
        }

        boolean valid = true;


        if (donarAccountDto.getFirstName() == null || donarAccountDto.getFirstName().trim().length() < 3) {
            System.out.println("First name not valid");
            valid = false;
        }


        if (donarAccountDto.getLastName() == null || donarAccountDto.getLastName().trim().isEmpty()) {
            System.out.println("Last name not valid");
            valid = false;
        }


        if (donarAccountDto.getEmail() == null || !donarAccountDto.getEmail().contains("@")) {
            System.out.println("Email not valid");
            valid = false;
        }


        if (donarAccountDto.getDob() == null || donarAccountDto.getDob().trim().isEmpty()) {
            System.out.println("DOB not valid");
            valid = false;
        }


        if (donarAccountDto.getZipCode() == null || donarAccountDto.getZipCode().length() != 6) {
            System.out.println("ZIP code not valid");
            valid = false;
        }


        if (donarAccountDto.getPassword() == null || donarAccountDto.getPassword().length() < 6) {
            System.out.println("Password not valid");
            valid = false;
        }

        if (!donarAccountDto.getPassword().equals(donarAccountDto.getConfirmPassword())) {
            System.out.println("Password and Confirm Password do not match");
            return false;
        }


        if (valid) {
            RedCrossEntity redCrossEntity = new RedCrossEntity();
            BeanUtils.copyProperties(donarAccountDto,redCrossEntity);
            boolean saved = redCrossDao.save(redCrossEntity);
            System.out.println("Saved to DB: " + saved);
            return saved;
        }

        return false;
    }

    @Override
    public Optional<DonarAccountDto> getDonorByEmail(String email) {
        if (email != null) {
            return redCrossDao.getDonarByEmail(email);
        } else {

            return Optional.empty();
        }
    }

    @Override
    public boolean updateDonor(DonarAccountDto donarAccountDto) {

        if (donarAccountDto == null || donarAccountDto.getEmail() == null)
        {
            return false;
        } else {
            return redCrossDao.update(donarAccountDto);
        }
    }

    @Override
    public boolean deleteDonorById(int id) {

        if (id > 0) {
            return redCrossDao.deleteById(id);
        }

        return false;
    }



}
