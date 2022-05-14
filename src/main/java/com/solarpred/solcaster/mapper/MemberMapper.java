package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.Member;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface MemberMapper {

    //@Select("SELECT MEM_ID FROM S_MEMBER")
    public List<Member> findAll();

    //회원가입
    public void joinInsert(Member vo);

    //로그인
    public Member login(Member vo);

    //회원삭제
    public void memDelete(String mem_id);

    //회원구매정보 업데이트
    public void purchaseUpdate(Member vo);

    //회원정보 수정 전 비밀번호 확인
    public String checkPW(String mem_id);

}
