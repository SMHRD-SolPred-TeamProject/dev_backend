package com.solpred.solcaster.solcaster.service;

import com.solpred.solcaster.solcaster.domain.Member;
import com.solpred.solcaster.solcaster.mapper.MemberMapper;
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
