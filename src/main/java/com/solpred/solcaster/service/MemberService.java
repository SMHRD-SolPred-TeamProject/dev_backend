package com.solpred.solcaster.service;

import com.solpred.solcaster.domain.Member;
import com.solpred.solcaster.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    MemberMapper mapper;

    public List<Member> findAll(){
        return mapper.findAll();
    }

}
