package com.kh.gorri.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	
	@RequestMapping("adminDash.ad")
	public String adminDash() {
		return "adminDash";
	}
	
	@RequestMapping("adminMember.ad")
	public String adminMember() {
		return "adminMember";
	}
	@RequestMapping("adminContent.ad")
	public String adminContent() {
		return "adminContent";
	}
	@RequestMapping("adminMoim.ad")
	public String adminMoim() {
		return "adminMoim";
	}
	@RequestMapping("adminMarket.ad")
	public String adminMarket() {
		return "adminMarket";
	}
	
}
