package com.solarpred.solcaster.service;

import com.solarpred.solcaster.domain.DashBoard;
import com.solarpred.solcaster.mapper.DashBoardMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DashBoardService {

    @Autowired
    DashBoardMapper mapper;

    /**
     * 대시보드에서 20개의 발전량 값 져오기
     */
    public List<DashBoard> getAOD(String parsingTime){
        return mapper.getAOD(parsingTime);
    }

    /**
     * 현재 시간 발전량 가져오기
     */
    public DashBoard currentGetAOD(String parsingTime){
        return mapper.currentGetAOD(parsingTime);
    }
    
    public List<DashBoard> DashBoardSelect() {
    	return mapper.DashBoardSelect();
    }


}
