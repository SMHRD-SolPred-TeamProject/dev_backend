package com.solarpred.solcaster.service;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.domain.Criteria;
import com.solarpred.solcaster.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    @Autowired
    BoardMapper mapper;

    // 게시글 전체 조회
    public List<Map<String, Object>> boardList(Criteria cri){
        return mapper.boardList(cri);
    }

    // 전체 게시글 개수 조회
    public int boardListCnt(){return mapper.boardListCnt();}

}
