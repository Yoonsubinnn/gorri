package com.kh.gorri.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.exception.GroupException;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.member.model.exception.MemberException;
import com.kh.gorri.member.model.service.MemberService;
import com.kh.gorri.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
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
	

	//ȸ������ : ���� - 2023-05-12 23:08�� ----------------------------
	@RequestMapping("join.me")
	public String join() {
		return "join";
	}
	
	@RequestMapping("insertMember.me")
	public String insertMember(@ModelAttribute Member m) {
		
		String userPwd = bcrypt.encode(m.getUserPwd());
		m.setUserPwd(userPwd);
		System.out.println(m.getUserName());
		System.out.println(userPwd);
		
		int result = mService.insertMember(m);
		if(result > 0 ) {
			return "redirect:login.me";
		} else {
			throw new MemberException("ȸ�����Կ� �����ϼ̽��ϴ�.");
		}
	}
	
	//���� 2023-05-12 : ���̵� �ߺ� Ȯ�� 
	@RequestMapping("checkId.me") 
	@ResponseBody
	public String checkId(@RequestParam("id") String id) {
		
		int checkUid = mService.checkId(id);
		String result = checkUid == 0 ? "yes" : "no";
		return result;
	}
	
	//���� 2023-05-12 : �г��� �ߺ� Ȯ��
	@RequestMapping("checkNick.me")
	@ResponseBody
	public String checkNick(@RequestParam("nickName") String nickName) {
		
		int checkNick = mService.checkNick(nickName);
		String result = checkNick == 0 ? "yes" : "no";
			
		return result;
		
	}
	
	//���� 2023-05-12 : ���̵� ã�� 
	@RequestMapping("findId.me")
	public String findId() {
		return "findId";
	}
	
	@RequestMapping("findIdResult.me")
	public String findIdResult(@ModelAttribute Member m, Model model) {
//		
//		Member user = mService.findId(m);
//		System.out.println(user.getUserId());
		return null; //�� �̸� �ٽ� ���ֱ� join �� ;
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
			throw new MemberException("��й�ȣ ã�� ������ ���� �ٽ� Ȯ���ϼ���");
		}
		
	}
	
	@RequestMapping(value="changePwd.me")
	public String changePwd(@ModelAttribute Member m) {
		int result = mService.changePwd(m);
		
		if(result > 0) {
			return "redirect:findPwdResult.me";
		} else {
			throw new MemberException("��й�ȣ ������Ʈ�� �����߽��ϴ�");
		}
		
	}
	
	
	// ������ ������(ȸ�� ��ȸ)
	@RequestMapping("adminMember.me")
	public String adminMember(@RequestParam(value="page", required=false) Integer currentPage,
							  Model model) {
		
		if(currentPage == null) {
			currentPage = 1; 
		}
		
		int listCount = mService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		System.out.println(pi);
		
		ArrayList<Member> mList = mService.selectMemberList(pi);
		System.out.println(mList);
		if(mList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("mList", mList);
			return "adminMember";
			
		} else {
			throw new GroupException("ȸ�� ��ȸ�� �����߽��ϴ�.");
		}
		
		
		
	}
	
	
	
}
