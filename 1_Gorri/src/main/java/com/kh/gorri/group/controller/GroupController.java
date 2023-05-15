package com.kh.gorri.group.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.service.GroupService;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService gService;
	
	@RequestMapping("groupMain.gr")
	public String groupMain() {
		return "groupMain2";
	}
	
	//---------------------���� : 2023-05-14 : �������� �� ���� ȭ�� 
	@RequestMapping(value="groupDetailY.gr")
	public String groupDetailY(@RequestParam(value="membershipNo") int membershipNo) {
		System.out.println(membershipNo);
		return "redirect:selectGroupView.gr"; 
	}
	
	@RequestMapping(value="selectGroupView.gr")
	public String selectGroupView(@RequestParam(value="page", required=false) Integer currentPage, Model model) {
		
		ArrayList<Group> groups = gService.selectGroupView(1); //���� �� ȭ�� 
		model.addAttribute("list", groups); 
		
		//boardList �������� 
		if( currentPage == null) { //���� �� ������ 
			currentPage = 1;
		}
		
		//�� ���� ��������(���ڴ� ���� ��� ����Ʈ ���� �� ����)
		int listCount = gService.getListCount(1); 
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<GroupBoard> boardList = gService.selectBoardList(pi, 1);
		System.out.println(boardList);
		if(boardList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("boardList", boardList);
			return "group_yJoin";
		} else {
			return "groupMain2"; //�Խñ� ��ȸ ���� �� ������ ȭ�� ����� 
		}
	}
	
	//---------------------���� : 2023-05-14 : ���� �Խñ� �󼼺��� 
	@RequestMapping(value="groupDetailBoard.gr")
	public String groupDetailBoard(@ModelAttribute GroupBoard gb, @RequestParam("page") Integer page, Model model) {

		
		GroupBoard detailBoard = gService.selectDetailBoard(gb);
		if(detailBoard != null) {
			model.addAttribute("list", detailBoard);
			return "detailBoardNotice";
		} else {
			return "groupMain2"; //�Խñ� �� ��ȸ ���� �� ������ ȭ�� ����� 
		}
	}
	
	
	@RequestMapping(value="groupDetailN.gr")
	public String groupDetailN() {
		return "group_nJoin"; 
	}
	
	
	@RequestMapping(value="groupMaking.gr")
	public String groupMaking() {
		return "groupMaking"; 
	}
	
	@RequestMapping(value="groupJoin.gr")
	public String groupJoin() {
		return "groupJoin"; 
	}
	
	@RequestMapping(value="calendar.gr")
	public String calendar() {
		return "calendar"; 
	}
	
	@RequestMapping(value="groupAdmin.gr")
	public String groupAdmin() {
		return "groupAdmin"; 
	}
	
	@RequestMapping(value="groupDetailAdmin.gr")
	public String groupDetailAdmin() {
		return "group_Y_Admin"; 
	}
	
	@RequestMapping(value="groupUpdate.gr")
	public String groupUpdate() {
		return "groupUpdate"; 
	}
}
