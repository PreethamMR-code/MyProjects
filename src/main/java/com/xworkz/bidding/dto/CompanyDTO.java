package com.xworkz.bidding.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyDTO {

    private String companyName;
    private String email;

    public CompanyDTO(String email) {
        this.email=email;
    }
}
