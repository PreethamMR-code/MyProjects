package com.xworkz.bidding.service;

import com.xworkz.bidding.dto.BidDTO;
import com.xworkz.bidding.dto.CompanyDTO;
import com.xworkz.bidding.dto.PlayerDTO;
import com.xworkz.bidding.dto.SearchDTO;

import java.util.List;
import java.util.Optional;

public interface PlayerService {

    boolean validateAndSave(PlayerDTO playerDTO);

    Optional<CompanyDTO> validateAndLogin(CompanyDTO companyDTO);

    List<PlayerDTO> findPlayersForBidding(SearchDTO searchDTO);

    boolean placeBid(BidDTO bidDTO);

}
