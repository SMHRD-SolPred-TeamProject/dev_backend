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

    /**
     * 대쉬보드 페이지 이동
     */
    @GetMapping("/dashboardLoginPage")
    public String dashboardLoginPage(){
        return "/dashboard/dashboardLogin";
    }

    @GetMapping("/predictDashboard")
    public String predictDashboard(){
        return "/dashboard/predictDashboard";
    }

    @GetMapping("/todayDashboard")
    public String todayDashboard(){
        return "/dashboard/todayDashboard";
    }

    @GetMapping("/solution")
    public String solution(){
        return "/dashboard/solution";
    }

    @GetMapping("/valuesTest")
    public String valuesTest(){
        return "valuesTest";
    }
}
