package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Member;
import com.solarpred.solcaster.domain.test;
import com.solarpred.solcaster.service.testService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class testRestController {
    @Autowired
    testService service;

    @CrossOrigin("*") // 모든 요청에 접근 허용
    @RequestMapping(value = "/api/test", method = RequestMethod.GET)
    public JSONObject apiLogin(){

        test test = service.testSelect();

        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체

        // {변수명:값, 변수명:값}
        // {sendData:[{변수명:값},{변수명:값},...]}
        //List<Member> items = service.login(vo);
        JSONArray jArray = new JSONArray(); // json배열

        //for(int i=0; i<items.size(); i++){
        //Member dto = items.get(i);
        JSONObject row = new JSONObject();
        // json객체.put("변수명",값)
        row.put("num1", test.getNum1());
        // 배열에 추가
        // json배열.add(인덱스,json객체)
        //jArray.add(i,row);
        jArray.add(0,row);
        //}

        // json객체에 배열을 넣음
        jsonMain.put("test", jArray);
        return jsonMain;
    }



}
