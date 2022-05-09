package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BoardRestController {

    @Autowired
    BoardService service;

    /**
     * 게시글 전체 조회

    @GetMapping("/board")
    public List<Board> viewBoardList(){
        List<Board> list = service.viewBoardList();
        return list;
    }
     */
}
