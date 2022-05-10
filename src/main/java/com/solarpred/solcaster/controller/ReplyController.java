package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Reply;
import com.solarpred.solcaster.service.BoardService;
import com.solarpred.solcaster.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReplyController {

    @Autowired
    ReplyService service;

    /**
     * 댓글 작성 기능
     */
    @PostMapping("/boardReply")
    public void boardReply(Reply vo){
        service.boardReply(vo);
    }


}
