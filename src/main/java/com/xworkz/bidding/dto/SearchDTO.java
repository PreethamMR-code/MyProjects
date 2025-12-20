package com.xworkz.bidding.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchDTO {

   private String  playerType;
   private double battingAvg;
   private double bowlingAvg;
   private int stumpings;
}
