package com.kh.gorri.market.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.exception.MarketException;
import com.kh.gorri.market.model.service.MarketService;
import com.kh.gorri.market.model.vo.Product;

@Controller
public class MarketController {

	@Autowired
	private MarketService mService;
	
	
	/*sysout은 테스트를 위해 남겨두었습니다. 최종버전에서는 주석처리하세요
	 * TODO는 작성해야 하는 로직입니다. TODO가 없으면 완성이라고 간주합니다.
	 * 각 메서드 위에 무슨 메서드인지 주석도 남겨놨습니다.
	 * */
//	----------------------------0
	/**
	 * 각 게시물을 누르면 게시물의 상세내용으로 이동합니다.
	 * @author lee94
	 */
	@RequestMapping("ProductDetail.market")
	public String marketProductDetail() {
		//TODO
		
		System.out.println("marketProductDetail");
		
		return "marketProductDetail";
	}
	/**
	 * 마켓 메인페이지에서 등록한 상품 버튼 누르면
	 * 유저가 등록한 상품 게시판으로 이동
	 */
	@RequestMapping("MyProductBoard.market")
	public String marketMyProductBoard() {
		//TODO
		System.out.println("marketMyProductBoard");
		
		return "marketMyProductBoard";
	}
	
	/**
	 * 마켓 메인페이지에서 상품 등록 버튼 누르면
	 * 상품 등록하는 게시글 뜹니다.
	 */
	@RequestMapping("Register.market")
	public String marketRegister() {
		//TODO
		System.out.println("marketRegister");
		
		return "marketRegister";
	}
	
	/**
	 * 내가 등록한 상품 게시판에서, 게시글 누르면
	 * 유저의 등록 게시물로 넘어가게 함
	 */
	@RequestMapping("MyProduct.market")
	public String marketMyProduct() {
		//TODO
		System.out.println("marketMyProduct");
		
		return "marketMyProduct";
	}
	
	/**
	 * 남이 등록한 게시물에서, 구매하기 누르면
	 * 구매창으로 넘어가게 함.
	 */
	@RequestMapping("BuyingPage.market")
	public String marketBuyingPage() {
		//TODO
		System.out.println("marketBuyingPage");
		
		return "marketBuyingPage";
	}
	
	/**
	 * 마켓 메인페이지로 넘어가게 하는 기능
	 * 마켓 메인페이지로 넘어가려면,
	 * 페이지네이션과 모든 마켓 리스트를 가져와야 합니다.
	 */
	@RequestMapping("MainPage.market")
	public String marketMainPage(@RequestParam(value = "page", required = false) Integer currentPage,
								Model model
								) {
		//TODO
		System.out.println("marketMainPage");
		//1. 어느페이지로 간다고 지정 안 했으면 기본적으로 1을 넣어줌
		if(currentPage == null) {
			currentPage = 1;
		}
		int listCount = mService.getListCount(1);
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		System.out.println(pi);
		//limit가 9인 page
		
		//다시 이걸 페이지에 넘긴다.
		ArrayList<Product> list = mService.marketMainPage(pi, 1);
		System.out.println(list);
		
		if(list !=null) {
			//잘 가져왔을 때.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "marketMainPage";
		} else {
			throw new MarketException("게시글 조회 실패");
		}
		
		
		
	}
	
	// 파일 저장소 지정
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		//파일 이름 변경 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		// 변경된 파일 이름 저장
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
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	
	// 상품 등록
	@PostMapping("insertProduct.market")
	public String insertProduct(@ModelAttribute Product p, HttpSession session) {
		
		int result = mService.insertProduct(p);
		
		if(result > 0) {
			return "redirect:MainPage.market";
		} else {
			throw new MarketException("상품 등록을 실패했습니다.");
		}	
	
	}
	
//	@PostMapping("insertProduct.market")
//	public String insertProduct(@ModelAttribute Member m, @ModelAttribute Product p, HttpServletRequest request, 
//								@RequestParam("file") ArrayList<MultipartFile> files) {
//		
//	}
	
	
	
	
	
	
	
}
