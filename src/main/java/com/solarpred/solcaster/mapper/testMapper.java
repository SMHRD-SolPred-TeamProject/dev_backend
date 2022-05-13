package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.test;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface testMapper {

    public test testSelect();
}
