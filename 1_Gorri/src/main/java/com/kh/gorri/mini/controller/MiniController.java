package com.kh.gorri.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MiniController {
	@RequestMapping("miniMain.mi")
	public String miniMain() {
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
}
