package com.xworkz.redCross.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "donor_account")
public class DonarAccountDto {

    @Id
    @Column(name = "donor_account_id")
    private int donorID;
    @Column(name = "email")
    private String email;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "dob")
    private String dob;
    @Column(name = "zip_code")
    private String zipCode;
    @Column(name = "password")
    private String password;
    @Column(name = "confirm_password")
    private String confirmPassword;


}
