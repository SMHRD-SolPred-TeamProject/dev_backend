package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.DashBoard;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface DashBoardMapper {

    // 20개 발전량 값 가져오기
    public List<DashBoard> getAOD(String parsingTime);

    // 현재시간 발전량 가져오기
    public DashBoard currentGetAOD(String parsingTime);

    public List<DashBoard> DashBoardSelect();

}
