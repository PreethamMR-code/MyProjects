package com.xworkz.redCross.dao;

import com.xworkz.redCross.dto.DonarAccountDto;

import java.util.Optional;

public interface RedCrossDao {
    boolean save(DonarAccountDto donarAccountDto);

    Optional<DonarAccountDto> getDonarByEmail(String email);

    boolean update(DonarAccountDto donarAccountDto);
}
