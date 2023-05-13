package com.kh.gorri.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.gorri.member.model.exception.MemberException;
import com.kh.gorri.member.model.service.MemberService;
import com.kh.gorri.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value="login.me")
	public String login() {
		return "login";
	}
	
	@RequestMapping("loginConfirm.me")
	public String loginConfirm(@ModelAttribute Member m,
							   Model model) {
		
		Member loginUser = mService.login(m);
		model.addAttribute("loginUser", loginUser);
		if(loginUser.getIsAdmin().equals("Y")) {
			return "redirect:adminDash.ad";
		} else {			
			return "redirect:main.do";
		}
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();		
		return "redirect:main.do";
	}
	
	@RequestMapping("updateMyInfo.me")
	public String updateMyInfo() {
		return "updateMyInfo";
	}
	
	@RequestMapping(value="join.me")
	public String Join() {
		return "join";
	}
	
	@RequestMapping(value="findId.me")
	public String findId() {
		return "findId";
	}
	
	@RequestMapping(value="findPwd.me")
	public String findPwd() {
		return "findPwd";
	}
	
	@RequestMapping(value="findIdResult.me")
	public String findIdResult() {
		return "findIdResult";
	}
	
	@RequestMapping(value="findPwdResult.me")
	public String findPwdResult() {
		return "resetPwdResult";
	}
	
	@RequestMapping(value="resetPwd.me")
	public String resetPwd(@ModelAttribute Member m,
							Model model) {
		
		System.out.println(m.getPwdQ());
		System.out.println(m.getPwdHint());
		System.out.println(m.getUserId());
		int result = mService.findPwd(m);
		if(result > 0) {			
			model.addAttribute("userId",m.getUserId());
			return "resetPwd";
		} else {
			throw new MemberException("비밀번호 찾기 질문과 답을 다시 확인하세요");
		}
		
	}
	
	@RequestMapping(value="changePwd.me")
	public String changePwd(@ModelAttribute Member m) {
		int result = mService.changePwd(m);
		
		if(result > 0) {
			return "redirect:findPwdResult.me";
		} else {
			throw new MemberException("비밀번호 업데이트에 실패했습니다");
		}
		
	}
	
	
	
	
}
