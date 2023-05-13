package com.kh.gorri.hobby.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HobbyController {
	@RequestMapping("hobbyMain.hb")
	public String hobbyMain() {
		return "hobbyMain";
	}
	
	@RequestMapping("boardWrite.hb")
	public String boardWrite() {
		return "boardWrite";
	}
	
	@RequestMapping("updatePage.hb")
	public String updatePage() {
		return "boardUpdate";
	}
}
