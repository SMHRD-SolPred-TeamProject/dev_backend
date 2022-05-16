package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Member;
import com.solarpred.solcaster.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class DashboardController {

    @Autowired
    private MemberService service;





}
