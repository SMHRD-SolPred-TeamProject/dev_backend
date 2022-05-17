package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.DashBoard;
import com.solarpred.solcaster.domain.Prediction;
import com.solarpred.solcaster.service.DashBoardService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RestController
public class DashBoardRestController {

    @Autowired
    DashBoardService service;

    /**
     * 대시보드에서 20개의 발전량 값 져오기
     */
    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/getAOD", method = RequestMethod.GET)
    public JSONObject getAOD(){

        // 현재시간 SQL문에 알맞는 형식으로 불러오기
        String parsingTime = currentTime();

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체

        List<DashBoard> list = service.getAOD(parsingTime);
        JSONArray jArray = new JSONArray(); // json배열

        for(int i=0; i<list.size(); i++){
            DashBoard items = list.get(i);
            JSONObject row = new JSONObject();

            // json객체.put("변수명",값)
            row.put("r_aod", items.getR_aod());
            row.put("r_date", items.getR_date());

            // 배열에 추가
            // json배열.add(인덱스,json객체)
            //jArray.add(i,row);
            jArray.add(i,row);
        }

        // json객체에 배열을 넣음
        jsonMain.put("r_aod", jArray);

        return jsonMain;
    }

    /**
     * 현재 시간 발전량 가져오기
     */
    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/currentGetAOD", method = RequestMethod.GET)
    public JSONObject currentGetAOD(){

        // 현재시간 SQL문에 알맞는 형식으로 불러오기
        String parsingTime = currentTime();

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체

        DashBoard item = service.currentGetAOD(parsingTime);
        JSONArray jArray = new JSONArray(); // json배열
        JSONObject row = new JSONObject();

        // json객체.put("변수명",값)
        row.put("r_aod", item.getR_aod());

        // 배열에 추가 json배열.add(인덱스,json객체)
        jArray.add(0,row);

        // json객체에 배열을 넣음
        jsonMain.put("r_aod", jArray);

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
    
  //현재 시간 % 형식에 맞춰 출력 메서드 (날짜까지)
    public String currentTime2(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);

        //sql문에 들어갈 현재시간 변수에 '%' 합치기 (2022-05-05 00:00:0% 이런 형식)
        //SELECT * FROM temp_weather WHERE date_time LIKE '2022-05-05 00:00:0%' ;
        String substring_date = current_time.substring(0,10)+"%";
        return substring_date;
    }
    
    //한시간 후 시간 %형식에 맞춰 출력 메서드
    public String preTotal(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);
        
        Calendar cal = Calendar.getInstance();
        try {
			Date date = sdf.parse(current_time);
			cal.setTime(date);
			cal.add(Calendar.HOUR, 1);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        String afterHour = sdf.format(cal.getTime());

        //sql문에 들어갈 현재시간 변수에 '%' 합치기 (2022-05-05 00:00:0% 이런 형식)
        //SELECT * FROM temp_weather WHERE date_time LIKE '2022-05-05 00:00:0%' ;
        String substring_date = afterHour.substring(0,10)+"%";
        return substring_date;
    }
    
    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/dash", method = RequestMethod.GET)
    public JSONObject apiDash(){

    	// 현재시간 SQL문에 알맞는 형식으로 불러오기
        String parsingTime = currentTime();
        String parsingTime2 = currentTime2();
        //DashBoard dash = service.DashBoardSelect();

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체
        JSONObject row2 = new JSONObject();

        // {변수명:값, 변수명:값}
        // {sendData:[{변수명:값},{변수명:값},...]}
        List<DashBoard> items = service.DashBoardSelect(parsingTime);
        int total = service.realTotalSelect(parsingTime,parsingTime2);

        JSONArray jArray = new JSONArray(); // json배열

        row2.put("realTotal", total);
        for(int i=0; i<items.size(); i++){
        DashBoard dto = items.get(i);
        JSONObject row = new JSONObject();
        // json객체.put("변수명",값)
        row.put("aod", dto.getR_aod());
        // 배열에 추가
        // json배열.add(인덱스,json객체)
        jArray.add(i,row);
        //jArray.add(0,row);
        }
        jArray.add(items.size(),row2);
        // json객체에 배열을 넣음
        jsonMain.put("dash", jArray);
        return jsonMain;
    }
    
    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/pre", method = RequestMethod.GET)
    public JSONObject apiPre(){

    	// 현재시간 SQL문에 알맞는 형식으로 불러오기
        String parsingTime = preTotal();
        //DashBoard dash = service.DashBoardSelect();

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체
        JSONObject row2 = new JSONObject();
        // {변수명:값, 변수명:값}
        // {sendData:[{변수명:값},{변수명:값},...]}
        List<Prediction> items = service.PredictionSelect();
        Double total = service.PreTotalSelect(parsingTime);
        JSONArray jArray = new JSONArray(); // json배열

        row2.put("total", total);
        for(int i=0; i<items.size(); i++){
        Prediction dto = items.get(i);
        JSONObject row = new JSONObject();
        // json객체.put("변수명",값)
        row.put("predAOD", dto.getPred_aod());
        // 배열에 추가
        // json배열.add(인덱스,json객체)
        jArray.add(i,row);
        //jArray.add(0,row);
        }
        jArray.add(items.size(),row2);
        // json객체에 배열을 넣음
        jsonMain.put("pre", jArray);
        return jsonMain;
    }

}
