package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.*;
import com.solarpred.solcaster.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class BoardRestController {

    @Autowired
    BoardService service;

    /**
     * 선택된 카테고리 게시글 보기
     */
    @GetMapping("/category")
    public List<Map<String, Object>> category(@RequestParam(value = "category")String qna_cat, CriteriaAdd cri, Model model){

        // 글 개수
        int boardListCnt = service.boardListCategoryCnt(qna_cat);
        System.out.println("boardListCnt = " + boardListCnt);
        // 페이징 객체
        PagingAdd paging = new PagingAdd();
        cri.setQna_cat(qna_cat);
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);

        List<Map<String, Object>> list = service.category(cri);

        //페이징 객체를 list 변수에 담아줌(model.addAttribute는 비동기 처리 시 전달이 안됨)
        Map<String, Object> pagingMap = new HashMap<>();
        pagingMap.put("test",paging);
        list.add(pagingMap);

        return list;
    }

    /**
     * 전체 게시글 보기
     */
    @GetMapping("/loadBoardList")
    public List<Map<String, Object>> loadBoardList(Criteria cri, Model model){

        // 글 개수
        int boardListCnt = service.boardListCnt();
        
        // 페이징 객체
        Paging paging = new Paging();
        paging.setTotalCount(boardListCnt);

        List<Map<String, Object>> list = service.boardList(cri);

        return list;
    }



}
