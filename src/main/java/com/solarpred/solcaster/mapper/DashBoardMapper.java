package com.solarpred.solcaster.mapper;

import com.solarpred.solcaster.domain.DashBoard;
import com.solarpred.solcaster.domain.Prediction;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface DashBoardMapper {

    // 20개 현재 발전량 값 가져오기
    public List<DashBoard> getAOD(@Param("parsingTime")String parsingTime, @Param("cnt")int cnt);

    // 누적된 현재 발전량 값 몇 개 중 제일 오래된 값 가져오기
    public Double getFirstTotal(@Param("parsingTime1")String parsingTime1, @Param("parsingTime2")String parsingTime2, @Param("cnt")int cnt);

    // 누적된 현재 발전량 값 몇개 중에서 -1 된 값들 가져오기
    public List remainValues(@Param("parsingTime2")String parsingTime2, @Param("cnt")int cnt);

    // 현재시간 발전량 가져오기
    public DashBoard currentGetAOD(String parsingTime);

    // 누적된 예측 발전량 값 몇 개 중 제일 오래된 값 가져오기
    public Double getPreFirstTotal(@Param("parsingTime1")String parsingTime1, @Param("parsingTime2")String parsingTime2, @Param("cnt")int cnt);

    // 누적된 예측 발전량 값 몇개 중에서 -1 된 값들 가져오기
    public List remainPreValues(@Param("parsingTime")String parsingTime, @Param("cnt")int cnt);

    // 20개 예측 발전량 값 가져오기
    public List<Prediction> getPreAOD(String parsingTime);

    // 1시간 후 발전량 가져오기
    public Prediction preGetAOD(String parsingTime);

    public List<DashBoard> DashBoardSelect(String parsingTime);
    
    public List<Prediction> PredictionSelect();
    
    public Double PreTotalSelect(String parsingTime);
    
    public int realTotalSelect(@Param("parsingTime") String parsingTime, @Param("parsingTime2") String parsingTime2);
    
    // 예측 발전량 테이블에서 특정시간 발전량값 가져오기
    public Double getPreParicularTime(String time);
    
}
