package com.solarpred.solcaster.service;

import com.solarpred.solcaster.domain.test;
import com.solarpred.solcaster.mapper.testMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class testService {

    @Autowired
    testMapper mapper;

    public test testSelect(){
       return mapper.testSelect();
    }

}
