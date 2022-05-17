package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.DashBoard;
import com.solarpred.solcaster.domain.Prediction;
import com.solarpred.solcaster.domain.Temp_weather;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface DashBoardMapper {

    // 20개 발전량 값 가져오기
    public List<DashBoard> getAOD(String parsingTime);

    // 현재시간 발전량 가져오기
    public DashBoard currentGetAOD(String parsingTime);

    public List<DashBoard> DashBoardSelect();

    public List<DashBoard> DashBoardSelect(String parsingTime);
    
    public List<Prediction> PredictionSelect();
    
    public Double PreTotalSelect(String parsingTime);
    
    public int realTotalSelect(@Param("parsingTime") String parsingTime, @Param("parsingTime2") String parsingTime2);

}