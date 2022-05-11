package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Reply;
import com.solarpred.solcaster.service.BoardService;
import com.solarpred.solcaster.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReplyController {

    @Autowired
    ReplyService service;




}
