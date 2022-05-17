package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.Member;
import com.solarpred.solcaster.service.DashBoardService;
import com.solarpred.solcaster.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class  DashboardController {

    @Autowired
    private DashBoardService service;

    @Autowired
    private MemberService memberService;

    /**
     * 로그인 기능
     */
    @PostMapping("/dashboardLogin")
    public String dashboardLogin(Member vo, Model model, HttpServletRequest request){

        HttpSession session = request.getSession();
        Member member = memberService.login(vo);

        if(member != null){
            if(member.getMem_type().equals("Y")){
                session.setAttribute("member",member);
                return "/dashboard/todayDashboard";
            }
            model.addAttribute("member",member);
        }else {
            Member member2 = new Member();
            member2.setMem_purchase("F");
            model.addAttribute("member",member2);
        }

        return "/dashboard/dashboardLogin";
    }

    /**
     * 로그아웃 기능
     */
    @GetMapping("/dashboardLogOut")
    public String dashboardLogOut(HttpSession session){
        session.removeAttribute("member");
        return "redirect:/dashboardLoginPage";
    }

}
