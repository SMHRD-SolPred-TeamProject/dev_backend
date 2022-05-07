package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.Board;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface BoardMapper {

    // 게시글 전체 조회
    public List<Board> viewBoardList();
}
