package com.xworkz.redCross.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DonarAccountDto {

   // private int donorID;
    private String email;
    private String firstName;
    private String lastName;
    private String dob;
    private String zipCode;
    private String password;
    private String confirmPassword;


}
