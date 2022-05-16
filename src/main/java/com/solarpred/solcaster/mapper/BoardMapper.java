package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.domain.Criteria;
import com.solarpred.solcaster.domain.CriteriaAdd;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@MapperScan
public interface BoardMapper {

    // 게시글 전체 조회
    public List<Map<String, Object>> boardList(CriteriaAdd cri);

    // 전체 게시물 개수 조회
    public int boardListCnt();

    // 글 작성 기능
    public void boardWriteForm(Board vo);

    // 특정 게시물 조회
    public Board boardView(int seq);

    // 게시물 수정 페이지
    public void boardUpdate(Board vo);

    // 특정 게시물 삭제
    public void boardDelete(int seq);
    
    // 특정 게시물 댓글 전부 삭제
    public void boardDeleteReply(int seq);


    // 선택된 카테고리 게시글 보기
    public List<Map<String, Object>> category(CriteriaAdd cri);

    // 카테고리 게시글 개수 조회
    public int boardListCategoryCnt(String qna_cat);

    // 검색된 게시글 개수 조회
    public int boardListSearchCnt(String qna_title_search);

    // 검색된 게시글 조회
    public List<Map<String, Object>> boardListSearch(CriteriaAdd cri);

    // 조회수 증가
    public void boardCntAdd(int qna_seq);

    // 특정 회원이 쓴 글 조회
    public List<Integer> boardMemList(String mem_id);
}
