package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Member;
import com.solarpred.solcaster.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Controller
public class MemberController {

    @Autowired
    private MemberService service;

    /**`
     * 메인페이지 이동
     */
    @RequestMapping("/")
    public String home(){
        return "index";
    }

    /**
     * 로그인페이지 이동
     */
    @GetMapping("/goLoginForm")
    public String goLoginForm(){
        return "login";
    }

    /**
     * 회원가입페이지 이동
     */
    @GetMapping("/join")
    public String join(){
        return "join.html";
    }

    /**`
     * 전체 회원 조회
     */
    @RequestMapping("/findAll")
    public List<Member> findAll(){
        return service.findAll();
    }

    /**
     * 회원가입 기능
     */
    @PostMapping("/joinInsert")
    public String joinInsert(Member vo){
        service.joinInsert(vo);
        return "redirect:/";
    }

    /**
     * 로그인 기능
     */
    @PostMapping("/login")
    public String login(Member vo, HttpServletRequest request) throws Exception{
        HttpSession session = request.getSession();
        Member member = service.login(vo);

        if(member == null){
            session.setAttribute("member",null);
            System.out.println("세션생성실패!");
        }else{
            session.setAttribute("member",member);
            System.out.println("세션생성성공!");
        }

        return "redirect:/";
    }

    /**
     * 로그아웃 기능
     */
    @GetMapping("/goLogOut")
    public String goLogOut(HttpSession session){
        session.removeAttribute("member");
        return "redirect:/";
    }

    /**
     * 회원관리 페이지 이동
     */
    @GetMapping("/goManage")
    public String goManage(Model model) {
        List<Member> list =  service.findAll();
        model.addAttribute("list",list);
        return "manage";
    }

}
