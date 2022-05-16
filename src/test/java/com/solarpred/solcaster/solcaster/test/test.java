package com.solarpred.solcaster.solcaster.test;

import org.junit.jupiter.api.Test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

    @Test
    void test(){
        //시간구하기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        System.out.println("System.currentTimeMillis() = " + System.currentTimeMillis());
        //시간형식 맞출 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //현재 시간 변수
        String current_time = sdf.format(timestamp);

        //sql문에 들어갈 현재시간 변수에 '%' 합치기 (2022-05-05 00:00:0% 이런 형식)
        //SELECT * FROM temp_weather WHERE date_time LIKE '2022-05-05 00:00:0%' ;
        String substring_date = current_time.substring(0,18)+"%";

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

}
