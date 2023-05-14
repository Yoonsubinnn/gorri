package com.kh.gorri.mini.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.member.model.vo.Member;
import com.kh.gorri.mini.model.exception.MiniException;
import com.kh.gorri.mini.model.service.MiniService;

@Controller
public class MiniController {
	
	@Autowired
	private MiniService mmService;
	
	@RequestMapping("miniMain.mi")
	public String miniMain(Model model, HttpServletRequest request) {
		
	// ���� �� �� ��ϵ��� �����;� �� (�̹����� ������ �ʿ�..)
		Member m = (Member) request.getSession().getAttribute("loginUser");
		List<Board> list = mmService.boardList(m);
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "miniMain";
	}
	
	@RequestMapping("miniMoim.mi")
	public String miniMoim() {
		return "miniMoim";
	}
	
	@RequestMapping("miniBuy.mi")
	public String miniBuy() {
		return "miniBuy";
	}
	
	@RequestMapping("miniBoard.mi")
	public String miniBoard() {
		return "miniBoard";
	}
	
	@RequestMapping("miniBoardContent.mi")
	public String miniBoardContent() {
		return "miniBoardContent";
	}
	
	@RequestMapping("updateIntro.mi")
	public String updateIntro(HttpServletRequest request) {
		String intro = request.getParameter("myIntro");
		
		Member m = (Member) request.getSession().getAttribute("loginUser"); //�α������� �ҷ���...
		
		m.setMyIntro(intro); // ���� �Է��� ������ �����...
		
		int update = mmService.updateIntro(m); 
		
		System.out.println(intro);
		if(update > 0 ) {
			return "miniMain";
		} else {
			throw new MiniException("�ڱ�Ұ��� ������Ʈ ����");
		}
	}
	

	

}
