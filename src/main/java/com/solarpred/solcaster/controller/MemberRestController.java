package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Member;
import com.solarpred.solcaster.service.MemberService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
public class MemberRestController {

    @Autowired
    MemberService service;

    /**`
     * 로그인
     */
    @RequestMapping (value = "/api/login", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
    public JSONObject apiLogin(Member vo){
        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체

        // {변수명:값, 변수명:값}
        // {sendData:[{변수명:값},{변수명:값},...]}
        //List<Member> items = service.login(vo);
        Member items = service.login(vo);
        JSONArray jArray = new JSONArray(); // json배열

        //for(int i=0; i<items.size(); i++){
            //Member dto = items.get(i);
            JSONObject row = new JSONObject();
            // json객체.put("변수명",값)
            row.put("mem_id", items.getMem_id());
            row.put("mem_pw", items.getMem_pw());
            row.put("mem_purchase", items.getMem_purchase());
            // 배열에 추가
            // json배열.add(인덱스,json객체)
            //jArray.add(i,row);
            jArray.add(0,row);
        //}

        // json객체에 배열을 넣음
        jsonMain.put("Member", jArray);
        return jsonMain;
    }

    /**
     * 회원가입
     */
    @RequestMapping (value = "/api/join", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
    public void apiJoin(Member vo){
        service.joinInsert(vo);
    }

    /**
     * 회원 구매 정보 수정
     */
    @RequestMapping("/purchaseUpdate")
    public void purchaseUpdate (Member vo) {
        service.purchaseUpdate(vo);
    }



}
