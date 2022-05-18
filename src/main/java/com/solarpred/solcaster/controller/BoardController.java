package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.*;
import com.solarpred.solcaster.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    public String boardList(CriteriaAdd cri, Model model){

        // 전체 글 개수
        int boardListCnt = service.boardListCnt();

        // 페이징 객체
        PagingAdd paging = new PagingAdd();
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
    public String boardView(@RequestParam("seq")int seq, @RequestParam("session_mem_id")String session_mem_id , Model model, HttpServletRequest request, HttpServletResponse response){

        // 쿠키 생성 및 조회수 메서드
        createCookie(request, response, seq, session_mem_id);

        Board vo = service.boardView(seq);
        model.addAttribute("vo",vo);
        return "boardView";
    }

    // 쿠키 생성 및 조회수 메서드
    public void createCookie(HttpServletRequest request, HttpServletResponse response, int qna_seq, String session_mem_id){

        // 선택된 게시물의 객체
        Board vo = service.boardView(qna_seq);

        // 새로운 쿠키 생성
        Cookie[] cookies = request.getCookies();

        Cookie newCookie = null;

        // 쿠키가 있을 경우
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
                // Cookie의 name이 cookie + seq 일치하는 쿠키를 newCookie 넣어줌
                if (cookies[i].getName().equals("cookie"+qna_seq)) {
                    System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
                    newCookie = cookies[i];
                }
            }//for
        }//if


        // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
        if (newCookie == null && !(vo.getMem_id().equals(session_mem_id))) {

            System.out.println("sessiontest = " + (vo.getMem_id() == session_mem_id));
            // 쿠키 생성(이름, 값)
            newCookie = new Cookie("cookie"+qna_seq, "|" + qna_seq + "|");

            // 쿠키 추가
            response.addCookie(newCookie);

            // 쿠키를 추가 시키고 조회수 증가시킴
            service.boardCntAdd(qna_seq);
        }

    }//end

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
     * 선택된 카테고리 이동
     */
    @GetMapping("/category2")
    public String category(CriteriaAdd cri,Model model){

        int boardListCnt = service.boardListCategoryCnt(cri.getQna_cat());
        System.out.println("boardListCnt = " + boardListCnt);

        // 페이징 객체
        PagingAdd paging = new PagingAdd();
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);

        List<Map<String, Object>> list = service.category(cri);

        System.out.println("list = " + list);

        model.addAttribute("list",list);
        model.addAttribute("paging",paging);

        return "boardList";
    }


}