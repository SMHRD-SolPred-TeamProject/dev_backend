package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.service.testService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testController {

    @Autowired
    testService service;

}
