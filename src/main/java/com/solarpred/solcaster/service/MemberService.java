package com.solarpred.solcaster.service;

import com.solarpred.solcaster.domain.Member;
import com.solarpred.solcaster.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    MemberMapper mapper;

    //전체회원조회
    public List<Member> findAll(){
        return mapper.findAll();
    }

    //회원가입
    public void joinInsert(Member vo){
        mapper.joinInsert(vo);
    }

    //로그인
    public Member login(Member vo){
        return mapper.login(vo);
    }





}
