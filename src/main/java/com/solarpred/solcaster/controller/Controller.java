package com.solarpred.solcaster.controller;

import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class Controller {

    @GetMapping("/about")
    public String about(){
        return "about";
    }

    @GetMapping("/smartEnergy")
    public String smartEnergy(){
        return "smartEnergy";
    }

    @GetMapping("/smartFarm")
    public String smartFarm(){
        return "smartFarm";
    }

    @GetMapping("/smartStation")
    public String smartStation(){
        return "smartStation";
    }

    @GetMapping("/service")
    public String service(){
        return "service";
    }

    @GetMapping("/predictDashboard")
    public String predictDashboard(){
        return "predictDashboard";
    }


}
