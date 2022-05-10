package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.Reply;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface ReplyMapper {

    // 댓글 조회 기능
    public List<Reply> reply(Reply vo);

    // 댓글 작성 기능
    public void boardReply(Reply vo);

}
