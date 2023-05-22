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
	 * 마켓 메인페이지로 넘어가는 메소드
	 * 기본적으로 모든 상품을 보여주게끔 하고,
	 * 필요시 쿼리스트링으로 전달받은 값을 통해 그쪽으로 넘김.
	 */
	@RequestMapping("MainPage.market")
	public String marketMainPage(@RequestParam(value = "page", required = false) Integer currentPage,
								 @RequestParam(value = "category", required = false) String category,
								 @RequestParam(value = "search", required = false) String search,
								 Model model) {
	
		System.out.println("marketMainPage 작동");
		
		
		
		//1. 어느페이지로 간다고 지정 안 했으면 기본적으로 1을 넣어줌
		if(currentPage == null) {
			currentPage = 1;
		}
		
		if(category.equals("전체")) {
			category = null;
		}
		
		int listCount = mService.getListCount(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		System.out.println("listCount: "+listCount);
		System.out.println("pi: "+pi);
		
		//카테고리가 비어있거나 원하는 것이 아니라면, 잘못된 접근하도록.
		if(category == null || category.equals("예술") || category.equals("운동") || 
								category.equals("음식") || category.equals("여행") || 
								category.equals("창작") || category.equals("자기계발")) {
			ArrayList<Product> list = mService.marketMainPage(pi, category, search);		
			if(list !=null) {
				//잘 가져왔을 때.
				model.addAttribute("pi", pi);
				model.addAttribute("list", list);
				return "marketMainPage";
			} else {
				throw new MarketException("게시글 조회 실패");
			}
		} else {
			throw new MarketException("URL 잘못 입력 : 카테고리에" + category + "라고 입력했습니다. 지정된 카테고리로만 검색 가능합니다.");
		}
	}
	/**
	 * 상품의 모든 문의를 받아오는 메소드, 즉 문의 페이지를 나타낸다.
	 * 
	 * @param currentPage 페이지네이션을 위한 현재 페이지
	 * @param productId 상품 id
	 * @param inquireNo 문의 번호
	 * @param model
	 * @return
	 */
	@RequestMapping("InquireBoard.market")
	public String ProductAllInquire(@RequestParam(value = "page", required = false) Integer currentPage,
								 @RequestParam(value = "productId") Integer productId,
								 Model model) {
		
		System.out.println("ProductAllInquire 작동");
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
			//잘 가져왔을 때.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("p", p);

			return "marketInquireBoard";
		} else {
			throw new MarketException("게시글 조회 실패");
		}
	}
	
	/**
	 * 상품의 모든 리뷰를 받아오는 메소드, 즉 리뷰게시판으로 넘어감
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
		
		System.out.println("ProductAllReview 작동");
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
			//잘 가져왔을 때.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("p", p);
			return "marketReviewBoard";
		} else {
			throw new MarketException("게시글 조회 실패");
		}
	}
	
	/**
	 * 어떤 상품에 달린 한 리뷰의 상세페이지로 이동 
	 * @param productId
	 * @param reviewNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("ProductReview.market")
	public ModelAndView ProductOneReview(@RequestParam(value = "productId") Integer productId,
								   		 @RequestParam("reviewNo") Integer reviewNo,
								   		 ModelAndView mv) {
		System.out.println("ProductReview 작동");
		Review r = mService.ProductOneReview(productId, reviewNo);
		
		if(r != null) {
			mv.addObject("r", r);
			mv.setViewName("marketReview");
			return mv;
		} else {
			throw new MarketException("리뷰 상세보기를 실패하였습니다.");
		}
	}
	
	/**
	 * 어느 상품의 질문 상세페이지로 이동
	 * @param productId
	 * @param inquireNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("ProductInquire.market")
	public ModelAndView ProductOneInquire(@RequestParam("productId") Integer productId,
											@RequestParam("inquireNo") Integer inquireNo,
											ModelAndView mv) {
		System.out.println("ProductInquire 작동");
		Inquire i = mService.ProductOneInquire(productId, inquireNo);
		ArrayList<InquireReply> irList = mService.ProductOneInquireReply(productId,inquireNo);
		
		if(i != null) {
			mv.addObject("i", i);
			mv.addObject("irList", irList);
			mv.setViewName("marketInquireDetail");
			return mv;
		} else {
			throw new MarketException("리뷰 상세보기를 실패하였습니다.");
		}
	}
	
	/**
	 * 각 게시물을 누르면 게시물의 상세내용으로 이동합니다.
	 * 
	 * @author lee94
	 */
	@RequestMapping("Product.market")
	public ModelAndView marketProduct(HttpSession session,
											ModelAndView mv,
											@RequestParam("productId") int productId,	//상품번호(productId)
//											@RequestParam("writer") String writer, 
											@RequestParam(value = "page", required = false) Integer page) {
		
		
		Member m = (Member)session.getAttribute("loginUser");	//지금 로그인한 놈 객체 만드는 함수
		//지금 당장은 필요없지만, 나주엥 쓰일스도 있어서 만들어놓음.
		Product p = mService.getProductInfo(productId);
		System.out.println(p);
		Member seller = mService.getSellerInfo(p.getProductSellerId());	//판매자 정보(아이디)를 통해 멤버객체를 생성하는, 판매자 정보를 가져오는  함수
		//세션에 담긴 로그인한 멤버 객체를 생성하고, 상품번호를 통해 상품객체를 만듦.
		
		/*만일, 다른페이지로 넘길 때, 그 페이지에 if문을 쓰기 싫으면 이걸 작성합니다.
		 * 여기서 p의 getProductSellerId랑  m.userid랑 비교해서
		 * 맞으면 여기, 틀리면 저기로 넘어가게 합니다.*/
		//하지만, 그냥 같은페이지를 사용하기로 한다면 아래와 같이 합니다.
		
				/*해야할 것:ㅣ
				 * 1. 상품의 id를 통해 문의, 후기를 가져오기*/
		
		if(page == null) {
			page = 1;
		}
		
		
		//1. 문의
		ArrayList<Inquire> productInq = mService.ProductAllInquire(productId);
		System.out.println(productInq); 
		
		//2. 후기
		
		ArrayList<Review> productReview = mService.ProductAllReview(productId);
		System.out.println(productInq); 
		
		
		if (p != null) {		//제대로 가져왔다면, 다음과 같이 매핑합니다. 이 값은 product페이지에서 사용합니다.
			mv.addObject("p", p);
			mv.addObject("page", page);
			mv.addObject("seller", seller);
			mv.addObject("productInq", productInq);
			mv.addObject("productReview", productReview);
//			mv.addObject("list", list);
			mv.setViewName("marketProduct");	//어느 jsp로 보내는지에 대한 것

			return mv;
		} else {
			throw new MarketException("게시글 상세보기를 실패하였습니다.");
		}
	}
	
	/**
	 * 마켓 메인페이지에서 등록한 상품 버튼 누르면
	 * 유저가 등록한 상품 게시판으로 이동
	 */
	@GetMapping("MyProductBoard.market")
	public ModelAndView marketMyProductBoard(HttpSession session,
									   ModelAndView mv) {
		//TODO
		/*단순히 링크로 넘어가면서, 세션에서 로그인한 유저의 아이디를 가져와
		 * 그 아이디로 등록한 상품을 찾는 쿼리문 돌려서, 그걸 가지고가면 됨.
		 * 모델에 담아야겠네. 같이 담아서 넘어가야 하니까.*/
		System.out.println("marketMyProductBoard 실행");
		String id = ((Member)session.getAttribute("loginUser")).getUserId();
		ArrayList<Product> list = mService.UserAllProduct(id);
		
		if(id != null) {
			mv.addObject("list", list);
			mv.setViewName("marketMyProductBoard");
			return mv;
		} else {
			throw new MarketException("내가 등록한 상품 조회를 실패하였습니다.");
		}	
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
	
	
	
	
	
	/////////////////////////////////////선우님 여기서부터 작성해주세용
	
	
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
			
			// list를 attachment table에 insert
			
			
			// 잘되면 p mapper table에 등록 => result = 1
			
			// 
			
			
			
			
			
			
			String id = ((Member)session.getAttribute("loginUser")).getUserId();
			p.setProductSellerId(id);
			System.out.println("카테고리 :"+p.getProductCategory());
			int result = mService.insertProduct(p);
			
			if(result > 0) {
				return "redirect:MainPage.market";
			} else {
				throw new MarketException("상품 등록을 실패했습니다.");
			}	
		
		}
		
		// 상품 사진 등록
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
				throw new MarketException("상품등록을 실패했습니다.");
			}
			
		}
	
	
	
	
}
