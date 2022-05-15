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
    public List<Map<String, Object>> category(@RequestParam(value = "category")String qna_cat, CriteriaAdd cri){

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
    public List<Map<String, Object>> loadBoardList(CriteriaAdd cri){

        // 글 개수
        int boardListCnt = service.boardListCnt();

        // 페이징 객체
        PagingAdd paging = new PagingAdd();
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);

        List<Map<String, Object>> list = service.boardList(cri);

        //페이징 객체를 list 변수에 담아줌(model.addAttribute는 비동기 처리 시 전달이 안됨)
        Map<String, Object> pagingMap = new HashMap<>();
        pagingMap.put("test",paging);
        list.add(pagingMap);

        return list;
    }

    /**
     * 검색된 단어 게시글 출력
     */
    @GetMapping("/boardSearch")
    public List<Map<String, Object>> boardSearch(@RequestParam(value = "qna_title")String qna_title, CriteriaAdd cri){
        // 전체 글 개수
        int boardListCnt = service.boardListSearchCnt(qna_title);

        // 페이징 객체
        PagingAdd paging = new PagingAdd();
        cri.setQna_title(qna_title);
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);

        List<Map<String, Object>> list =  service.boardListSearch(cri);

        //페이징 객체를 list 변수에 담아줌(model.addAttribute는 비동기 처리 시 전달이 안됨)
        Map<String, Object> pagingMap = new HashMap<>();
        pagingMap.put("test",paging);
        list.add(pagingMap);

        return list;
    }

}
