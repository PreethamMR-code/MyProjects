package com.xworkz.bidding.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlayerDTO {

    private String playerName;
    private int age;
    private String playerType;
    private double battingAvg;
    private double bowlingAvg;
    private int stumpings;
    private String  state;
    private int bidCount;
    private String soldTo;


}
