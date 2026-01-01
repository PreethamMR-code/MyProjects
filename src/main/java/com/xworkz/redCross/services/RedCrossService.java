package com.xworkz.redCross.services;

import com.xworkz.redCross.dto.DonarAccountDto;

import java.util.Optional;

public interface RedCrossService {

   boolean validateAndSave(DonarAccountDto donarAccountDto);

   Optional<DonarAccountDto> getDonorByEmail(String email);

   boolean updateDonor(DonarAccountDto donarAccountDto);


   boolean deleteDonorById(int id);
}
