package com.kh.gorri.group.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.exception.GroupException;
import com.kh.gorri.group.model.service.GroupService;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupMember;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService gService;
	
	@RequestMapping("groupMain.gr")
	public String groupMain(@RequestParam(value="page", required=false) Integer page, Model model) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		
		ArrayList<Group> gList = gService.selectGroupList(pi);
		ArrayList<Attachment> gAttm = gService.selectAttmGroupList();
		if(gList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("gList", gList);
			model.addAttribute("gAttm", gAttm);
			
		} else {
			throw new GroupException("모임 조회를 실패했습니다.");
		}
		
		
		return "groupMain2";
	}
	
	@RequestMapping(value="groupDetailY.gr")
	public String groupDetailY() {
		return "group_yJoin"; 
	}
	
	@RequestMapping(value="groupDetailN.gr")
	public String groupDetailN(@RequestParam("membershipNo") int membershipNo, Model model) {
		System.out.println(membershipNo);
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
	
	@RequestMapping("insertGroup.gr")
	public String insertGroup(@ModelAttribute Group g,@ModelAttribute GroupMember gm,
							  Model model, HttpServletRequest request,
							  @RequestParam("file") ArrayList<MultipartFile> file) {
		
		MultipartFile upload = file.get(0);
		gm.setMemberId(g.getHostId());
		gm.setGrade("모임장");
		String[] returnArr = saveFile(upload, request);
		Attachment a = new Attachment();
		if(returnArr[1] != null) {
			 a.setSavePath(returnArr[0]);
			 a.setOriginalName(upload.getOriginalFilename());
			 a.setRenameName(returnArr[1]);
			 a.setAttmLevel(0);
		 }
				
		int result1 = gService.insertGroup(g);
		int result2 = gService.insertAttm(a);
		int result3 = gService.insertGroupMember(gm);
		
		return "redirect:groupMain.gr";
	}
	
	
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources"); 
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 파일 이름 변경 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum 
								+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		// 변경된 이름의 파일을 저장 
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		return returnArr;
	
	}
	
	
	// 카테고리 검색
	@RequestMapping("selectCate.gr")
	public String selectCate(@RequestParam(value="page", required=false) Integer page,
							 @RequestParam("category") String category, Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		
		ArrayList<Group> gList = gService.selectGroupList(pi);
		ArrayList<Attachment> gAttm = gService.selectAttmGroupList();
		if(gList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("gList", gList);
			model.addAttribute("gAttm", gAttm);
			model.addAttribute("category", category);
			
		} else {
			throw new GroupException("모임 조회를 실패했습니다.");
		}
		
		
		return "groupCateSelect";
	}
	
	
	
	// 그룹 검색
	@RequestMapping("searchGroup.gr")
	public String searchGroup(@RequestParam("searchCate") String searchCate, 
							  @RequestParam("searchWord") String searchWord,
							  @RequestParam(value="page", required=false) Integer page,
							  Model model) {
		
		Properties search = new Properties();
		search.put("searchCate", searchCate);
		search.put("searchWord", searchWord);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		
		ArrayList<Group> searchGroupList = gService.searchGroup(search);
		ArrayList<Attachment> gAttm = gService.selectAttmGroupList();
		if(searchGroupList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("gList", searchGroupList);
			model.addAttribute("gAttm", gAttm);
			
		} else {
			throw new GroupException("모임 조회를 실패했습니다.");
		}
		
		
		
		return "groupMain2";
	}
}
