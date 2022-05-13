package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.domain.Reply;
import com.solarpred.solcaster.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ReplyRestController {

    @Autowired
    ReplyService service;

    /**
     * 댓글 전체 불러오는 기능
     */
    @GetMapping("/reply")
    public List<Reply> reply(@RequestParam(value="seq")String seq, Model model){
        int vo = Integer.parseInt(seq);
        List<Reply> list = service.reply(vo);
        model.addAttribute("list",list);
        return list;
    }

    /**
     * 댓글 작성 기능
     */
    @PostMapping("/boardReply")
    public void boardReply(Reply vo){
        service.boardReply(vo);
    }

    /**
     * 댓글 삭제 기능
     */
    @GetMapping("/replyDelete")
    public void replyDelete(int reply_seq){
        service.replyDelete(reply_seq);
    }

    /**
     * 댓글 수정 기능
     */
    @PostMapping("/replyUpdate")
    public void replyUpdate(Reply vo){
        service.replyUpdate(vo);
    }

}
