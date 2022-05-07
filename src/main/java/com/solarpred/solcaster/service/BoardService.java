package com.solarpred.solcaster.service;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    BoardMapper mapper;

    // 게시글 전체 조회
    public List<Board> viewBoardList(){
        return mapper.viewBoardList();
    }
}
