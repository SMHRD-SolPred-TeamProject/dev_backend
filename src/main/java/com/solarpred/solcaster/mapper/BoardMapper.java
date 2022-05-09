package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.Board;
import com.solarpred.solcaster.domain.Criteria;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
import java.util.Map;

@MapperScan
public interface BoardMapper {

    // 게시글 전체 조회
    public List<Map<String, Object>> boardList(Criteria cri);

    // 전체 게시물 개수 조회
    public int boardListCnt();

}
