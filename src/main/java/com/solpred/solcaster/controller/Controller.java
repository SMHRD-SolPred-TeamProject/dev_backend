package com.solpred.solcaster.controller;

import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class Controller {

    @GetMapping("/solcaster/")
    public String home(){
        return "index.html";
    }

}
