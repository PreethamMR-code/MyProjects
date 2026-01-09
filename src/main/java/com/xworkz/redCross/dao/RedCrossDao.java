package com.xworkz.redCross.dao;

import com.xworkz.redCross.dto.DonarAccountDto;
import com.xworkz.redCross.entity.RedCrossEntity;

import java.util.Optional;

public interface RedCrossDao {
    boolean save(RedCrossEntity redCrossEntity);

    Optional<DonarAccountDto> getDonarByEmail(String email);

    boolean update(DonarAccountDto donarAccountDto);

  //  boolean deleteByEmail(String email);

    boolean deleteById(int id);
}
