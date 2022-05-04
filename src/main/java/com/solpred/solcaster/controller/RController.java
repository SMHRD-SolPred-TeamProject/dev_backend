package com.solpred.solcaster.controller;

import com.solpred.solcaster.domain.Member;
import com.solpred.solcaster.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class RController {

    @Autowired
    private MemberService service;

    @RequestMapping("/findAll")
    public List<Member> findAll(){
        return service.findAll();
    }

}
