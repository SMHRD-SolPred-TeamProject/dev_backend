package com.solarpred.solcaster.controller;

import com.solarpred.solcaster.domain.*;
import com.solarpred.solcaster.service.BoardService;
import com.solarpred.solcaster.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Controller
public class MemberController {

    @Autowired
    private MemberService service;

    @Autowired
    private BoardService boardService;

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
        return "join";
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
    public String login(Member vo, HttpServletRequest request, Model model) throws Exception{
        HttpSession session = request.getSession();
        Member member = service.login(vo);

        if(vo.getMem_id().equals("") && vo.getMem_pw().equals("")){
            Member member2 = new Member();
            member2.setMem_id("nullnull");
            model.addAttribute("member2",member2);
            return "login";
        }else if(member == null){
            Member member2 = new Member();
            member2.setMem_id("null");
            model.addAttribute("member2",member2);
            return "login";
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
    public String goManage(Criteria cri, Model model) {

        // 전체 회원 수
        int memberListCnt = service.memberListCnt();

        // 페이징 객체
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(memberListCnt);

        List<Map<String, Object>> list =  service.memberList(cri);

        model.addAttribute("list",list);
        model.addAttribute("paging",paging);

        return "manage";
    }

    /**
     * 회원 삭제
     */
    @GetMapping("/goMemDelete")
    public String goManage(@RequestParam("mem_id") String mem_id) {
        System.out.print(mem_id);

        // 회원이 남긴 게시글 조회
        List<Integer> qna_list = boardService.boardMemList(mem_id);

        // 게시글 삭제
        for (int i=0; i<qna_list.size()-1; i++) {
            boardService.boardDelete(qna_list.get(i));
        }

        // 회원 삭제
        service.memDelete(mem_id);

       return "redirect:/goManage";
    }

    /**
     * 회원 수정 페이지 이동
     */
    @GetMapping("/myprofile")
    public String myprofile(){
        return "myProfilePwCheck";
    }

    /**
     * 회원 정보 수정 전 비밀번호 체크
     */
    @PostMapping("/checkPW")
    public String checkPW(String mem_id, String mem_pw) {
        System.out.println("mem_id = " + mem_id);
        System.out.println("mem_pw : " + mem_pw);
        String real_mem_pw = service.checkPW(mem_id);
        if (mem_pw.equals(real_mem_pw)) {
            return "myProfileEditForm";
        }
        return "alertPW";
    }

    /**
     * 회원 정보 수정
     */
    @PostMapping("/goUpdateInfo")
    public String goUpdateInfo(Member vo, String pwcheck) {
        if (!vo.getMem_pw().equals(pwcheck)) {
            return "alertPW";
        }

        service.goUpdateInfo(vo);
        return "redirect:/";
    }

}
