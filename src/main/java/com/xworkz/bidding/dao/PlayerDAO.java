package com.xworkz.bidding.dao;

import com.xworkz.bidding.dto.CompanyDTO;
import com.xworkz.bidding.dto.PlayerDTO;
import com.xworkz.bidding.dto.SearchDTO;

import java.util.List;
import java.util.Optional;

public interface PlayerDAO {

    boolean save(PlayerDTO playerDTO);

    Optional<CompanyDTO> findByEmail(CompanyDTO companyDTO);

    List<PlayerDTO> findPlayersForBidding(SearchDTO searchDTO);

}
