package com.solarpred.solcaster.test;

import com.solarpred.solcaster.controller.DashBoardRestController;
import com.solarpred.solcaster.service.DashBoardService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.stereotype.Controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebMvcTest(DashBoardRestController.class)
public class test {

    @Autowired
    DashBoardService service;

    @Test
    void t(){
        Double preParicularTime = service.getPreParicularTime("2022-05-17 18:57:30");

        int aod = Integer.parseInt(preParicularTime.toString());
        System.out.println("aod = " + aod);
    }

    @Test
    void test(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Timestamp timestamp2 = new Timestamp(System.currentTimeMillis()+3600000);
        System.out.println("timestamp = " + timestamp);
        System.out.println("timestamp2 = " + timestamp2);
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);
        String current_time2 = sdf.format(timestamp2);
        System.out.println("current_time = " + current_time);
        System.out.println("current_time2 = " + current_time2);


        //sql문에 들어갈 현재시간 변수에 '%' 합치기 (2022-05-05 00:00:0% 이런 형식)
        //SELECT * FROM temp_weather WHERE date_time LIKE '2022-05-05 00:00:0%' ;
        String substring_date = current_time.substring(0,18)+"%";
        System.out.println("substring_date = " + substring_date);

    }

    @Test
    void test2(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        System.out.println("System.currentTimeMillis() = " + System.currentTimeMillis());
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);
        System.out.println("current_time = " + current_time);
        Date parse = null;

        try {
            //2022-05-17 00:04:00 형식의 날짜시간을 long형 초단위 시간으로 변경
            parse = sdf.parse(current_time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        // 변수에 담으려면 long으로 선언 후 변수 선언해야 함
        System.out.println("parse = " + parse.getTime());
    }
    @Test
    void test3(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis()+3600000);
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);

        //sql문에 들어갈 현재시간 변수에 '%' 합치기 (2022-05-05 00:00:0% 이런 형식)
        //SELECT * FROM temp_weather WHERE date_time LIKE '2022-05-05 00:00:0%' ;
        String substring_date = current_time.substring(0,18)+"%";
        System.out.println("substring_date = " + substring_date);
    }
    
    @Test
    void currentTime2(){
        ///시간구하기
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
        System.out.println("substring_date = " + substring_date);
                
    }

}
