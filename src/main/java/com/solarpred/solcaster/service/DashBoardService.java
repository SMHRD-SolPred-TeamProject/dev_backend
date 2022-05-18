package com.solarpred.solcaster.service;

import com.solarpred.solcaster.domain.DashBoard;
import com.solarpred.solcaster.domain.Prediction;
import com.solarpred.solcaster.mapper.DashBoardMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DashBoardService {

    @Autowired
    DashBoardMapper mapper;

    /**
     * 대시보드에서 20개의 현재 발전량 값 져오기
     */
    public List<DashBoard> getAOD(String parsingTime, int cnt){
        return mapper.getAOD(parsingTime, cnt);
    }

    /**
     * 누적된 현재 발전량 값 몇 개 중 제일 오래된 값 가져오기
     */
    public Double getFirstTotal(String parsingTime1,String parsingTime2,int cnt){
        return mapper.getFirstTotal(parsingTime1,parsingTime2,cnt);
    }

    /**
     * 누적된 현재 발전량 값 몇개 중에서 -1 된 값들 가져오기
     */
    public List remainValues(String parsingTime2,int cnt){
        return mapper.remainValues(parsingTime2,cnt);
    }

    /**
     * 현재 시간 발전량 가져오기
     */
    public DashBoard currentGetAOD(String parsingTime){
        return mapper.currentGetAOD(parsingTime);
    }

    /**
     * 예측 발전량 값 몇 개 중 제일 오래된 값 가져오기
     */
    public Double getPreFirstTotal(String parsingTime1,String parsingTime2,int cnt){
        return mapper.getPreFirstTotal(parsingTime1,parsingTime2,cnt);
    }

    /**
     * 누적된 현재 발전량 값 몇개 중에서 -1 된 값들 가져오기
     */
    public List remainPreValues(String parsingTime,int cnt){
        return mapper.remainPreValues(parsingTime,cnt);
    }


    /**
     * 대시보드에서 20개의 예측 발전량 값 져오기
     */
    public List<Prediction> getPreAOD(String parsingTime){
        return mapper.getPreAOD(parsingTime);
    }

    /**
     * 1시간 후 발전량 가져오기
     */
    public Prediction preGetAOD(String parsingTime){
        return mapper.preGetAOD(parsingTime);
    }


    public List<DashBoard> DashBoardSelect(String parsingTime) {
    	return mapper.DashBoardSelect(parsingTime);
    }

    public List<Prediction> PredictionSelect(){
    	return mapper.PredictionSelect();
    }

    public Double PreTotalSelect(String parsingTime){
    	return mapper.PreTotalSelect(parsingTime);
    }

    public int realTotalSelect(String parsingTime, String parsingTime2) {
    	return mapper.realTotalSelect(parsingTime, parsingTime2);
    }

    public Double getPreParicularTime(String time) {
    	return mapper.getPreParicularTime(time);
    }


}
