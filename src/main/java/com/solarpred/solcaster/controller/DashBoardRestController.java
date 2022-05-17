package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.DashBoard;
import com.solarpred.solcaster.domain.Temp_weather;
import com.solarpred.solcaster.domain.test;
import com.solarpred.solcaster.service.DashBoardService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@RestController
public class DashBoardRestController {

    @Autowired
    DashBoardService service;

    /**
     * temp_weather에서 현재시간과 같은 값 가져오기
     */
    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/getTemp_weather", method = RequestMethod.GET)
    public JSONObject getTemp_weather(){

        // 현재시간 SQL문에 알맞는 형식으로 불러오기
        String parsingTime = currentTime();

        Temp_weather tw = service.getTemp_weather(parsingTime);
        System.out.println("tw 출력 성공!!!!!!!!!!!");

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체
        JSONArray jArray = new JSONArray(); // json배열
        JSONObject row = new JSONObject(); // json배열에 담을 json 객체
        
        // json객체.put("변수명",값)
        row.put("date_time", tw.getDate_time());
        row.put("temperature", tw.getTemperature());
        row.put("precipitation", tw.getPrecipitation());
        row.put("wind_speed", tw.getWind_speed());
        row.put("humidity", tw.getHumidity());
        row.put("radiation", tw.getRadiation());
        row.put("total_cloudiness", tw.getTotal_cloudiness());
        row.put("visibility", tw.getVisibility());
        row.put("ground_temp", tw.getGround_temp());

        // 배열에 추가
        // json배열.add(인덱스,json객체)
        //jArray.add(i,row);
        jArray.add(0,row);
        //}

        // json객체에 배열을 넣음
        jsonMain.put("temp_weather", jArray);

        return jsonMain;
    }


    //현재 시간 % 형식에 맞춰 출력 메서드
    public String currentTime(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);

        //sql문에 들어갈 현재시간 변수에 '%' 합치기 (2022-05-05 00:00:0% 이런 형식)
        //SELECT * FROM temp_weather WHERE date_time LIKE '2022-05-05 00:00:0%' ;
        String substring_date = current_time.substring(0,18)+"%";
        return substring_date;
    }
    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/dash", method = RequestMethod.GET)
    public JSONObject apiLogin(){
    	
    	// 현재시간 SQL문에 알맞는 형식으로 불러오기
        String parsingTime = currentTime();
        //DashBoard dash = service.DashBoardSelect();

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체

        // {변수명:값, 변수명:값}
        // {sendData:[{변수명:값},{변수명:값},...]}
        List<DashBoard> items = service.DashBoardSelect(parsingTime);
        JSONArray jArray = new JSONArray(); // json배열

        for(int i=0; i<items.size(); i++){
        DashBoard dto = items.get(i);
        JSONObject row = new JSONObject();
        // json객체.put("변수명",값)
        row.put("aod", dto.getR_aod());
        // 배열에 추가
        // json배열.add(인덱스,json객체)
        //jArray.add(i,row);
        jArray.add(0,row);
        }

        // json객체에 배열을 넣음
        jsonMain.put("dash", jArray);
        return jsonMain;
    }
    
    
}
