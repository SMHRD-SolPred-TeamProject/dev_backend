package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Reply;
import com.solarpred.solcaster.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ReplyRestController {

    @Autowired
    ReplyService service;

    @GetMapping("/reply")
    public List<Reply> reply(Reply vo){
        List<Reply> list = service.reply(vo);
        System.out.println("list = " + list);
        return list;
    }

}
