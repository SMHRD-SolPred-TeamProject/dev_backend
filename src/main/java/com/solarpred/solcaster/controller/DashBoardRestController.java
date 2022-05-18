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
     * 현재 발전량 값들과 누적된 발전량 값 가져오기
     */
    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/getAOD", method = RequestMethod.GET)
    public JSONObject getAOD(){

        // 현재시간 SQL문에 알맞는 형식으로 불러오기
        String parsingTime = currentTime();
        String parsingTime1 = currentTime2();
        String parsingTime2 = currentTime3();

        // 현재 시간 이전으로 보여질 값의 갯수
        int cnt = 20;

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체
        //JSONObject jsonFirstValue = new JSONObject(); //

        // 현재 시간에서 20개 이전의 실시간 발전량 가져오기
        List<DashBoard> list = service.getAOD(parsingTime, cnt);

        // cnt 갯수에서 제일 시간이 오래된 첫번째 누적된 값
        Double prevTotalValue = service.getFirstTotal(parsingTime1,parsingTime2,cnt);

        // cnt 갯수 중 - 1 한 나머지 값들을 Dashboard 객체에 담기
        List remainValues = service.remainValues(parsingTime, cnt - 1);
        JSONArray jArray = new JSONArray(); // json배열

        Double total = prevTotalValue;

        for(int i=0; i<cnt; i++){
            JSONObject row = new JSONObject();
            DashBoard items1 = list.get(i);
            row.put("r_aod",items1.getR_aod());

            if(i == 0){
                row.put("r_aod_total",total);
            }else {
                Double items2 = (Double) remainValues.get(i-1);
                total += items2;
                row.put("r_aod_total",(total*100)/100);
            }
            jArray.add(i,row);
        }

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

    /**
     * 예측 발전량 값들과 누적된 발전량 값 가져오기
     */
    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/getPreAOD", method = RequestMethod.GET)
    public JSONObject getPreAOD(){

        // 현재시간 SQL문에 알맞는 형식으로 불러오기
        String parsingTime = currentTimeAddOneHour2(); // +1 시간 후 형식 SQL
        String parsingTime2 = currentTime2(); // 자정시간 SQL

        int cnt = 20;

        // cnt 갯수에서 제일 시간이 오래된 첫번째 누적된 값
        Double prevTotalValue = service.getPreFirstTotal(parsingTime,parsingTime2,cnt);
//        int preTotalValueChange = Integer.parseInt(prevTotalValue.toString());

        // cnt 갯수 중 - 1 한 나머지 값들을 Dashboard 객체에 담기
        List remainPreValues = service.remainPreValues(parsingTime, cnt - 1);

        // 20개 이전 값 가져오기
        List<Prediction> list = service.getPreAOD(parsingTime);

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체
        JSONArray jArray = new JSONArray(); // json배열

        Double total = prevTotalValue;

        for(int i=0; i<cnt; i++){
            JSONObject row = new JSONObject();
            Prediction items1 = list.get(i);

            if(items1.getPred_aod() < 0){
                items1.setPred_aod(0);
            }

            row.put("pred_aod",items1.getPred_aod());

            if(i == 0){
                row.put("pred_aod_total",total);
            }else {
                Double items2 = (Double) remainPreValues.get(i-1);
                total += items2;
                row.put("pred_aod_total",total);
            }
            jArray.add(i,row);
        }
        // json객체에 배열을 넣음
        jsonMain.put("pred_aod", jArray);

        return jsonMain;
    }

    /**
     * 1시간 후 예측 발전량 가져오기
     */
    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/preGetAOD", method = RequestMethod.GET)
    public JSONObject preGetAOD(){

        // 현재시간 SQL문에 알맞는 형식으로 불러오기
        String parsingTime = currentTimeAddOneHour2();

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체

        Prediction item = service.preGetAOD(parsingTime);
        JSONArray jArray = new JSONArray(); // json배열
        JSONObject row = new JSONObject();

        if(item.getPred_aod() < 0){
            item.setPred_aod(0);
        }

        // json객체.put("변수명",값)
        row.put("pred_aod", item.getPred_aod());

        // 배열에 추가 json배열.add(인덱스,json객체)
        jArray.add(0,row);

        // json객체에 배열을 넣음
        jsonMain.put("pred_aod", jArray);

        return jsonMain;
    }

    /**
     * 안드로이드 실시간
     */
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

    /**
     * 안드로이드 예측
     */
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

    // 현재 시간 % 형식에 맞춰 출력 메서드 => (2022-05-05 00:00:0%)
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

    // 한시간 후 % 형식에 맞춰 출력 => +1시간 후의 값 (2022-05-05 00:00:0%)
    public String currentTimeAddOneHour(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis()+3600000);
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);

        //sql문에 들어갈 현재시간 변수에 '%' 합치기 (2022-05-05 00:00:0% 이런 형식)
        //SELECT * FROM temp_weather WHERE date_time LIKE '2022-05-05 00:00:0%' ;
        String substring_date = current_time.substring(0,18)+"%";
        return substring_date;
    }

    // 현재 날짜형식으로 출력 => (2022-05-05%)
    public String currentTime2(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);

        //sql문에 들어갈 현재시간 변수에 '%' 합치기 (2022-05-05% 이런 형식)
        //SELECT * FROM temp_weather WHERE date_time LIKE '2022-05-05%' ;
        String substring_date = current_time.substring(0,10)+"%";
        return substring_date;
    }

    // 현재 시간 출력 =>  (2022-05-15 14:12:25)
    public String currentTime3(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);

        return current_time;
    }

    // 
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

    // 한시간 후 % 형식에 맞춰 출력 => +59분 후의 값 (2022-05-05 00:00:0%)
    public String currentTimeAddOneHour2(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis()+3540000);
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);

        //sql문에 들어갈 현재시간 변수에 '%' 합치기 (2022-05-05 00:00:0% 이런 형식)
        //SELECT * FROM temp_weather WHERE date_time LIKE '2022-05-05 00:00:0%' ;
        String substring_date = current_time.substring(0,18)+"%";
        return substring_date;
    }


}
