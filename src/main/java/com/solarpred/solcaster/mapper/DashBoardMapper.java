package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.Temp_weather;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface DashBoardMapper {

    public List<Temp_weather> getTemp_weather(String parsingTime);

}
