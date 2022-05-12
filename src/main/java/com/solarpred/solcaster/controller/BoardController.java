package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.domain.Criteria;
import com.solarpred.solcaster.domain.Paging;
import com.solarpred.solcaster.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
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

    /**
     * 글 작성 페이지 이동
     */
    @GetMapping("/boardWrite")
    public String boardWrite(){
        return "boardWrite";
    }

    /**
     * 글 작성 기능
     */
    @PostMapping("/boardWriteForm")
    public String boardWriteForm(Board vo){
        service.boardWriteForm(vo);
        return "redirect:/boardList";
    }

    /**
     * 특정 게시물 조회
     */
    @GetMapping("/boardView")
    public String boardView(@RequestParam("seq")int seq, Model model){
        Board vo = service.boardView(seq);
        model.addAttribute("vo",vo);
        return "boardView";
    }

    /**
     * 특정 게시물 수정페이지 이동
     */
    @GetMapping("/boardUpdateForm")
    public String boardUpdateForm(@RequestParam("seq") int seq, Model model){
        Board vo = service.boardView(seq);
        String[] arr = {"구매문의","기술문의","AS문의"};
        model.addAttribute("vo",vo);
        model.addAttribute("arr",arr);
        return "boardUpdate";
    }

    /**
     * 특정 게시물 수정
     */
    @PostMapping("/boardUpdate")
    public String boardUpdate(Board vo){
        service.boardUpdate(vo);
        return "redirect:/boardList";
    }

    /**
     * 특정 게시물 삭제
     */
    @GetMapping("/boardDelete")
    public String boardDelete(@RequestParam("seq") int seq){
        // 댓글 모두 삭제
        service.boardDeleteReply(seq);
        
        // 게시글 삭제
        service.boardDelete(seq);
        return "redirect:/boardList";
    }

    /**
     * 특정 회원이 쓴 글 모두 조회
     */


}
