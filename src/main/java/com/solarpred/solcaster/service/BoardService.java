package com.solarpred.solcaster.service;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.domain.Criteria;
import com.solarpred.solcaster.domain.CriteriaAdd;
import com.solarpred.solcaster.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    @Autowired
    BoardMapper mapper;

    // 게시글 전체 조회
    public List<Map<String, Object>> boardList(CriteriaAdd cri){
        return mapper.boardList(cri);
    }

    // 전체 게시글 개수 조회
    public int boardListCnt(){return mapper.boardListCnt();}

    // 글작성 기능
    public void boardWriteForm(Board vo){
        mapper.boardWriteForm(vo);
    }

    // 특정 게시물 조회
    public Board boardView(int seq){
        return mapper.boardView(seq);
    }

    // 게시물 수정
    public void boardUpdate(Board vo){
        mapper.boardUpdate(vo);
    }

    // 특정 게시물 삭제
    public void boardDelete(int seq){
        mapper.boardDelete(seq);
    }

    // 특정 게시물 댓글 전부 삭제
    public void boardDeleteReply(int seq){
        mapper.boardDeleteReply(seq);
    }

    // 선택된 카테고리 게시글 보기
    public List<Map<String, Object>> category(CriteriaAdd cri){
        return mapper.category(cri);
    }

    // 카테고리 게시글 개수 조회
    public int boardListCategoryCnt(String qna_cat){return mapper.boardListCategoryCnt(qna_cat);}

    // 검색된 게시글 개수 조회
    public int boardListSearchCnt(String qna_title_search){return mapper.boardListSearchCnt(qna_title_search);}

    // 검색된 게시글 조회
    public List<Map<String, Object>> boardListSearch(CriteriaAdd cri){
        return mapper.boardListSearch(cri);
    }

    // 조회수 증가
    public void boardCntAdd(int qna_seq){mapper.boardCntAdd(qna_seq);}

    // 특정 회원이 쓴 글 조회
    public List<Integer> boardMemList(String mem_id) {
        return mapper.boardMemList(mem_id);
    }

}
