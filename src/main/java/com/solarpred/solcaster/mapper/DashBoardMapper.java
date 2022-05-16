package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.Temp_weather;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface DashBoardMapper {

    public Temp_weather getTemp_weather(String parsingTime);

}
