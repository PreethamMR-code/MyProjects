package com.xworkz.redCross.controller;

import com.xworkz.redCross.dto.DonarAccountDto;
import com.xworkz.redCross.services.RedCrossService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping("/")
public class RedCrossController {

    @Autowired
    RedCrossService redCrossService;

    public RedCrossController(){
        System.out.println("RedCrossController object created");
    }


    @PostMapping("CreateRedCrossAccount")
    public String CreateRedCrossAccount(DonarAccountDto donarAccountDto) {
        System.out.println(donarAccountDto);

        boolean saved = redCrossService.validateAndSave(donarAccountDto);
        System.out.println("the data is valid and saved:" + saved);

        if (saved) {
            return "response";
        } else {
            return "createMyAccount";
        }
    }

    @GetMapping("/searchDonor")
    public String searchDonor(@RequestParam("email") String email, Model model) {

        System.out.println(email);

        Optional<DonarAccountDto> donorDto = redCrossService.getDonorByEmail(email);

        System.out.println(donorDto);

        if (donorDto.isPresent()) {
            model.addAttribute("donor", donorDto.get());
        } else {
            model.addAttribute("error", "Donor not found");
        }

        return "search";
    }

    @PostMapping("/updateDonor")
    public String updateMedicine(DonarAccountDto donarAccountDto,Model model) {

        boolean updated = redCrossService.updateDonor(donarAccountDto);

        if (updated) {
            model.addAttribute("success", "data updated successfully");
            return "update";
        } else {

            model.addAttribute("error", "please try again");
            return "update";
        }
    }

}
