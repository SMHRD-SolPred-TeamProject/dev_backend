package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.domain.Reply;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface ReplyMapper {

    // 댓글 조회 기능
    public List<Reply> reply(int vo);

    // 댓글 작성 기능
    public void boardReply(Reply vo);

    // 댓글 삭제 기능
    public void replyDelete(int reply_seq);

    // 댓글 수정 기능
    public void replyUpdate(Reply vo);

}
