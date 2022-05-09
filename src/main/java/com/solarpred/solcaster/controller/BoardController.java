package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.domain.Criteria;
import com.solarpred.solcaster.domain.Paging;
import com.solarpred.solcaster.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    @Autowired
    BoardService service;

    /**
     * 게시글 전체 조회
     */
    @GetMapping("/boardList")
    public String boardList(Criteria cri, Model model){

        // 전체 글 개수
        int boardListCnt = service.boardListCnt();

        // 페이징 객체
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);

        //List<Board> list =  service.viewBoardList();
        List<Map<String, Object>> list =  service.boardList(cri);

        model.addAttribute("list",list);
        model.addAttribute("paging",paging);

        return "boardList";
    }

}
