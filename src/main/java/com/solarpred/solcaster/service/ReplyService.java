package com.solarpred.solcaster.service;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.domain.Reply;
import com.solarpred.solcaster.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyService {

    @Autowired
    ReplyMapper mapper;

    // 댓글 조회
    public List<Reply> reply(int vo){
        return mapper.reply(vo);
    }

    // 댓글작성 기능
    public void boardReply(Reply vo){
        mapper.boardReply(vo);
    }

    // 댓글삭제 기능
    public void replyDelete(int reply_seq){
        mapper.replyDelete(reply_seq);
    }

    // 댓글수정 기능
    public void replyUpdate(Reply vo){
        mapper.replyUpdate(vo);
    }

}
