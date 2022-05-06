package com.solpred.solcaster.mapper;

import com.solpred.solcaster.domain.Member;
import org.apache.ibatis.annotations.Select;
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

}