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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.market.model.exception.MarketException;
import com.kh.gorri.market.model.service.MarketService;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.InquireReply;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;

@Controller
public class MarketController {

	@Autowired
	private MarketService mService;
	
	/**
	 * ���� ������������ �Ѿ�� �޼ҵ�
	 * �⺻������ ��� ��ǰ�� �����ְԲ� �ϰ�,
	 * �ʿ�� ������Ʈ������ ���޹��� ���� ���� �������� �ѱ�.
	 */
	@RequestMapping("MainPage.market")
	public String marketMainPage(@RequestParam(value = "page", required = false) Integer currentPage,
								 @RequestParam(value = "category", required = false) String category,
								 @RequestParam(value = "search", required = false) String search,
								 Model model) {
	
		System.out.println("marketMainPage �۵�");
		
		
		
		//1. ����������� ���ٰ� ���� �� ������ �⺻������ 1�� �־���
		if(currentPage == null) {
			currentPage = 1;
		}
		
		if(category.equals("��ü")) {
			category = null;
		}
		
		int listCount = mService.getListCount(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		System.out.println("listCount: "+listCount);
		System.out.println("pi: "+pi);
		
		//ī�װ��� ����ְų� ���ϴ� ���� �ƴ϶��, �߸��� �����ϵ���.
		if(category == null || category.equals("����") || category.equals("�") || 
								category.equals("����") || category.equals("����") || 
								category.equals("â��") || category.equals("�ڱ���")) {
			ArrayList<Product> list = mService.marketMainPage(pi, category, search);		
			if(list !=null) {
				//�� �������� ��.
				model.addAttribute("pi", pi);
				model.addAttribute("list", list);
				return "marketMainPage";
			} else {
				throw new MarketException("�Խñ� ��ȸ ����");
			}
		} else {
			throw new MarketException("URL �߸� �Է� : ī�װ���" + category + "��� �Է��߽��ϴ�. ������ ī�װ��θ� �˻� �����մϴ�.");
		}
	}
	/**
	 * ��ǰ�� ��� ���Ǹ� �޾ƿ��� �޼ҵ�, �� ���� �������� ��Ÿ����.
	 * 
	 * @param currentPage ���������̼��� ���� ���� ������
	 * @param productId ��ǰ id
	 * @param inquireNo ���� ��ȣ
	 * @param model
	 * @return
	 */
	@RequestMapping("InquireBoard.market")
	public String ProductAllInquire(@RequestParam(value = "page", required = false) Integer currentPage,
								 @RequestParam(value = "productId") Integer productId,
								 Model model) {
		
		System.out.println("ProductAllInquire �۵�");
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = mService.getListCount(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		System.out.println("listCount: "+ listCount);
		System.out.println("pi: "+ pi);
		
		Product p = mService.getProductInfo(productId);
		ArrayList<Inquire> list = mService.ProductAllInquire(pi, productId);		
		
		if(list !=null) {
			//�� �������� ��.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("p", p);

			return "marketInquireBoard";
		} else {
			throw new MarketException("�Խñ� ��ȸ ����");
		}
	}
	
	/**
	 * ��ǰ�� ��� ���並 �޾ƿ��� �޼ҵ�, �� ����Խ������� �Ѿ
	 * @param currentPage
	 * @param productId
	 * @param reviewNo
	 * @param model
	 * @return
	 */
	@RequestMapping("ReviewBoard.market")
	public String ProductAllReview(@RequestParam(value = "page", required = false) Integer currentPage,
			@RequestParam(value = "productId", required=false) Integer productId,
			Model model) {
		
		System.out.println("ProductAllReview �۵�");
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = mService.getListCount(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		System.out.println("listCount: "+ listCount);
		System.out.println("pi: "+ pi);
		
		Product p = mService.getProductInfo(productId);
		ArrayList<Review> list = mService.ProductAllReview(pi, productId);
		
		
		
		if(list !=null) {
			//�� �������� ��.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("p", p);
			return "marketReviewBoard";
		} else {
			throw new MarketException("�Խñ� ��ȸ ����");
		}
	}
	
	/**
	 * � ��ǰ�� �޸� �� ������ ���������� �̵� 
	 * @param productId
	 * @param reviewNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("ProductReview.market")
	public ModelAndView ProductOneReview(@RequestParam(value = "productId") Integer productId,
								   		 @RequestParam("reviewNo") Integer reviewNo,
								   		 ModelAndView mv) {
		System.out.println("ProductReview �۵�");
		Review r = mService.ProductOneReview(productId, reviewNo);
		
		if(r != null) {
			mv.addObject("r", r);
			mv.setViewName("marketReview");
			return mv;
		} else {
			throw new MarketException("���� �󼼺��⸦ �����Ͽ����ϴ�.");
		}
	}
	
	/**
	 * ��� ��ǰ�� ���� ���������� �̵�
	 * @param productId
	 * @param inquireNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("ProductInquire.market")
	public ModelAndView ProductOneInquire(@RequestParam("productId") Integer productId,
											@RequestParam("inquireNo") Integer inquireNo,
											ModelAndView mv) {
		System.out.println("ProductInquire �۵�");
		Inquire i = mService.ProductOneInquire(productId, inquireNo);
		ArrayList<InquireReply> irList = mService.ProductOneInquireReply(productId,inquireNo);
		
		if(i != null) {
			mv.addObject("i", i);
			mv.addObject("irList", irList);
			mv.setViewName("marketInquireDetail");
			return mv;
		} else {
			throw new MarketException("���� �󼼺��⸦ �����Ͽ����ϴ�.");
		}
	}
	
	/**
	 * �� �Խù��� ������ �Խù��� �󼼳������� �̵��մϴ�.
	 * 
	 * @author lee94
	 */
	@RequestMapping("Product.market")
	public ModelAndView marketProduct(HttpSession session,
											ModelAndView mv,
											@RequestParam("productId") int productId,	//��ǰ��ȣ(productId)
//											@RequestParam("writer") String writer, 
											@RequestParam(value = "page", required = false) Integer page) {
		
		
		Member m = (Member)session.getAttribute("loginUser");	//���� �α����� �� ��ü ����� �Լ�
		//���� ������ �ʿ������, ���ֿ� ���Ͻ��� �־ ��������.
		Product p = mService.getProductInfo(productId);
		System.out.println(p);
		Member seller = mService.getSellerInfo(p.getProductSellerId());	//�Ǹ��� ����(���̵�)�� ���� �����ü�� �����ϴ�, �Ǹ��� ������ ��������  �Լ�
		//���ǿ� ��� �α����� ��� ��ü�� �����ϰ�, ��ǰ��ȣ�� ���� ��ǰ��ü�� ����.
		
		/*����, �ٸ��������� �ѱ� ��, �� �������� if���� ���� ������ �̰� �ۼ��մϴ�.
		 * ���⼭ p�� getProductSellerId��  m.userid�� ���ؼ�
		 * ������ ����, Ʋ���� ����� �Ѿ�� �մϴ�.*/
		//������, �׳� ������������ ����ϱ�� �Ѵٸ� �Ʒ��� ���� �մϴ�.
		
				/*�ؾ��� ��:��
				 * 1. ��ǰ�� id�� ���� ����, �ı⸦ ��������*/
		
		if(page == null) {
			page = 1;
		}
		
		
		//1. ����
		ArrayList<Inquire> productInq = mService.ProductAllInquire(productId);
		System.out.println(productInq); 
		
		//2. �ı�
		
		ArrayList<Review> productReview = mService.ProductAllReview(productId);
		System.out.println(productInq); 
		
		
		if (p != null) {		//����� �����Դٸ�, ������ ���� �����մϴ�. �� ���� product���������� ����մϴ�.
			mv.addObject("p", p);
			mv.addObject("page", page);
			mv.addObject("seller", seller);
			mv.addObject("productInq", productInq);
			mv.addObject("productReview", productReview);
//			mv.addObject("list", list);
			mv.setViewName("marketProduct");	//��� jsp�� ���������� ���� ��

			return mv;
		} else {
			throw new MarketException("�Խñ� �󼼺��⸦ �����Ͽ����ϴ�.");
		}
	}
	
	/**
	 * ���� �������������� ����� ��ǰ ��ư ������
	 * ������ ����� ��ǰ �Խ������� �̵�
	 */
	@GetMapping("MyProductBoard.market")
	public ModelAndView marketMyProductBoard(HttpSession session,
									   ModelAndView mv) {
		//TODO
		/*�ܼ��� ��ũ�� �Ѿ�鼭, ���ǿ��� �α����� ������ ���̵� ������
		 * �� ���̵�� ����� ��ǰ�� ã�� ������ ������, �װ� �������� ��.
		 * �𵨿� ��ƾ߰ڳ�. ���� ��Ƽ� �Ѿ�� �ϴϱ�.*/
		System.out.println("marketMyProductBoard ����");
		String id = ((Member)session.getAttribute("loginUser")).getUserId();
		ArrayList<Product> list = mService.UserAllProduct(id);
		
		if(id != null) {
			mv.addObject("list", list);
			mv.setViewName("marketMyProductBoard");
			return mv;
		} else {
			throw new MarketException("���� ����� ��ǰ ��ȸ�� �����Ͽ����ϴ�.");
		}	
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
	
	@PostMapping("ReplySubmit.market")
	public ModelAndView marketMyProductBoard(HttpSession session, 
											    @RequestParam("comment") String comment, 
											    @RequestParam("productNo") String productNo, 
											    @RequestParam("inquireNo") String inquireNo, 
											    ModelAndView mv) {
	  
	  System.out.println("Received comment: " + comment);

	  Member m = (Member)session.getAttribute("loginUser");
	  int result = mService.addReply(comment, m, productNo, inquireNo);
	  
	  // Rest of your code...

	  // Return the ModelAndView as required
	  return mv;
	}
	
	
	
	
	
	/////////////////////////////////////����� ���⼭���� �ۼ����ּ���
	
	
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
		public String insertProduct(@ModelAttribute Product p, HttpSession session,
									HttpServletRequest request, @RequestParam("file") ArrayList<MultipartFile> files) {
			
			ArrayList<Attachment> list = new ArrayList<>();
			for(int i = 0; i < files.size(); i ++) {
				MultipartFile upload = files.get(i);
				if(upload != null && !upload.isEmpty()) {
					String[] returnArr = saveFile(upload, request);
					if(returnArr[1] != null) {
						Attachment a = new Attachment();
						
						a.setSavePath(returnArr[0]);
						a.setOriginalName(upload.getOriginalFilename());
						a.setRenameName(returnArr[1]);
						
						list.add(a);
					}
				}
			}
			
			// list�� attachment table�� insert
			
			
			// �ߵǸ� p mapper table�� ��� => result = 1
			
			// 
			
			
			
			
			
			
			String id = ((Member)session.getAttribute("loginUser")).getUserId();
			p.setProductSellerId(id);
			System.out.println("ī�װ� :"+p.getProductCategory());
			int result = mService.insertProduct(p);
			
			if(result > 0) {
				return "redirect:MainPage.market";
			} else {
				throw new MarketException("��ǰ ����� �����߽��ϴ�.");
			}	
		
		}
		
		// ��ǰ ���� ���
		@PostMapping("insertProductattm.market")
		public String insertProudctattm(@ModelAttribute Product p,HttpServletRequest request, @RequestParam("file") ArrayList<MultipartFile> files
									) {
			
			String id = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			p.setProductSellerId(id);
			
			ArrayList<Attachment> list = new ArrayList<>();
			for(int i = 0; i < files.size(); i ++) {
				MultipartFile upload = files.get(i);
				if(upload != null && !upload.isEmpty()) {
					String[] returnArr = saveFile(upload, request);
					if(returnArr[1] != null) {
						Attachment a = new Attachment();
						
						a.setSavePath(returnArr[0]);
						a.setOriginalName(upload.getOriginalFilename());
						a.setRenameName(returnArr[1]);
						
						list.add(a);
					}
				}
			}
			
			int result = 0;
			result = mService.insertProudctattm(list);
			if(result > 0) {
				return "redirect:MainPage.market";
			} else {
				throw new MarketException("��ǰ����� �����߽��ϴ�.");
			}
			
		}
	
	
	
	
}
