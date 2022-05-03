package com.solpred.solcaster.solcaster.mapper;

import com.solpred.solcaster.solcaster.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MemberMapper {

    @Select("SELECT MEM_ID FROM S_MEMBER")
    public List<Member> findAll();

}
