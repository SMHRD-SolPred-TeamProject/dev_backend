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

    // 회원 삭제
    public void memDelete(String mem_id) {
        mapper.memDelete(mem_id);
    }

    // 회원 구매 정보 업데이트
    public void purchaseUpdate(Member vo) {
        mapper.purchaseUpdate(vo);
    }

    // 회원 정보 수정 전 비밀번호 확인
    public String checkPW(String mem_id) { return mapper.checkPW(mem_id);}

    // 회원 정보 수정
    public void goUpdateInfo(Member vo) {mapper.goUpdateInfo(vo);}


}
