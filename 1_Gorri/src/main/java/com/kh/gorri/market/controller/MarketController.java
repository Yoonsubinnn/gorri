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
	
	
	/*sysout�� �׽�Ʈ�� ���� ���ܵξ����ϴ�. �������������� �ּ�ó���ϼ���
	 * TODO�� �ۼ��ؾ� �ϴ� �����Դϴ�. TODO�� ������ �ϼ��̶�� �����մϴ�.
	 * �� �޼��� ���� ���� �޼������� �ּ��� ���ܳ����ϴ�.
	 * */
//	----------------------------0
	/**
	 * �� �Խù��� ������ �Խù��� �󼼳������� �̵��մϴ�.
	 * @author lee94
	 */
	@RequestMapping("ProductDetail.market")
	public String marketProductDetail() {
		//TODO
		
		System.out.println("marketProductDetail");
		
		return "marketProductDetail";
	}
	/**
	 * ���� �������������� ����� ��ǰ ��ư ������
	 * ������ ����� ��ǰ �Խ������� �̵�
	 */
	@RequestMapping("MyProductBoard.market")
	public String marketMyProductBoard() {
		//TODO
		System.out.println("marketMyProductBoard");
		
		return "marketMyProductBoard";
	}
	
	/**
	 * ���� �������������� ��ǰ ��� ��ư ������
	 * ��ǰ ����ϴ� �Խñ� ��ϴ�.
	 */
	@RequestMapping("Register.market")
	public String marketRegister() {
		//TODO
		System.out.println("marketRegister");
		
		return "marketRegister";
	}
	
	/**
	 * ���� ����� ��ǰ �Խ��ǿ���, �Խñ� ������
	 * ������ ��� �Խù��� �Ѿ�� ��
	 */
	@RequestMapping("MyProduct.market")
	public String marketMyProduct() {
		//TODO
		System.out.println("marketMyProduct");
		
		return "marketMyProduct";
	}
	
	/**
	 * ���� ����� �Խù�����, �����ϱ� ������
	 * ����â���� �Ѿ�� ��.
	 */
	@RequestMapping("BuyingPage.market")
	public String marketBuyingPage() {
		//TODO
		System.out.println("marketBuyingPage");
		
		return "marketBuyingPage";
	}
	
	/**
	 * ���� ������������ �Ѿ�� �ϴ� ���
	 * ���� ������������ �Ѿ����,
	 * ���������̼ǰ� ��� ���� ����Ʈ�� �����;� �մϴ�.
	 */
	@RequestMapping("MainPage.market")
	public String marketMainPage(@RequestParam(value = "page", required = false) Integer currentPage,
								Model model
								) {
		//TODO
		System.out.println("marketMainPage");
		//1. ����������� ���ٰ� ���� �� ������ �⺻������ 1�� �־���
		if(currentPage == null) {
			currentPage = 1;
		}
		int listCount = mService.getListCount(1);
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		System.out.println(pi);
		//limit�� 9�� page
		
		//�ٽ� �̰� �������� �ѱ��.
		ArrayList<Product> list = mService.marketMainPage(pi, 1);
		System.out.println(list);
		
		if(list !=null) {
			//�� �������� ��.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "marketMainPage";
		} else {
			throw new MarketException("�Խñ� ��ȸ ����");
		}
		
		
		
	}
	
	// ���� ����� ����
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		//���� �̸� ���� ���� ����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		// ����� ���� �̸� ����
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
	
	
	// ��ǰ ���
	@PostMapping("insertProduct.market")
	public String insertProduct(@ModelAttribute Product p, HttpSession session) {
		
		int result = mService.insertProduct(p);
		
		if(result > 0) {
			return "redirect:MainPage.market";
		} else {
			throw new MarketException("��ǰ ����� �����߽��ϴ�.");
		}	
	
	}
	
//	@PostMapping("insertProduct.market")
//	public String insertProduct(@ModelAttribute Member m, @ModelAttribute Product p, HttpServletRequest request, 
//								@RequestParam("file") ArrayList<MultipartFile> files) {
//		
//	}
	
	
	
	
	
	
	
}
