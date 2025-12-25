package com.xworkz.bidding.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BidDTO {

    private String playerName;
    private String companyName;
    private double bidAmount;
}
