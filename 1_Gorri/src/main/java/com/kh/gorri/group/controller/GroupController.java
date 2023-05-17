package com.kh.gorri.group.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.kh.gorri.group.model.vo.GroupBoard;
import com.kh.gorri.group.model.vo.GroupMember;
import com.kh.gorri.member.model.vo.Member;

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
		
		System.out.println(gList);
		if(gList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("gList", gList);
			model.addAttribute("gAttm", gAttm);
			
		} else {
			throw new GroupException("���� ��ȸ�� �����߽��ϴ�.");
		}
		
		
		return "groupMain2";
	}
	
	
	@RequestMapping(value="groupDetailN.gr")
	public String groupDetailN(@RequestParam("membershipNo") int membershipNo, Model model) {
		model.addAttribute("membershipNo", membershipNo);
		return "group_nJoin"; 
	}
	
	
	@RequestMapping(value="groupMaking.gr")
	public String groupMaking(HttpServletRequest request) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		System.out.println(loginUser);
		if(loginUser != null) {			
			return "groupMaking"; 
		} else {
			throw new GroupException("�߸��� �����Դϴ�");
		}
	}
		
	@RequestMapping(value="calendar.gr")
	public String calendar() {
		return "calendar"; 
	}
	
	
	
	@RequestMapping(value="groupDetailAdmin.gr")
	public String groupDetailAdmin() {
		return "group_Y_Admin"; 
	}
		
	@RequestMapping("insertGroup.gr")
	public String insertGroup(@ModelAttribute Group g,@ModelAttribute GroupMember gm,
							  Model model, HttpServletRequest request,
							  @RequestParam("file") ArrayList<MultipartFile> file) {
		
			
			MultipartFile upload = file.get(0);
			gm.setMemberId(g.getHostId());
			gm.setGrade("������");
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
		
		// ���� �̸� ���� ���� ����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum 
								+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		// ����� �̸��� ������ ���� 
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
	
	
	// ī�װ� �˻�
	@RequestMapping("selectCate.gr")
	public String selectCate(@RequestParam(value="page", required=false) Integer page,
							 @RequestParam("category") String category, Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getCategoryListCount(category);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		
		ArrayList<Group> gList = gService.selectCategoryGroupList(category, pi);
		ArrayList<Attachment> gAttm = gService.selectAttmGroupList();
		if(gList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("gList", gList);
			model.addAttribute("gAttm", gAttm);
			model.addAttribute("category", category);
		} else {
			throw new GroupException("���� ��ȸ�� �����߽��ϴ�.");
		}		
		return "groupCateSelect";
	}
	
	
	
	// �׷� �˻�
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
			throw new GroupException("���� ��ȸ�� �����߽��ϴ�.");
		}
		
		
		
		return "groupMain2";
	}
	
	
	
	     
	   //---------------------���� : 2023-05-14 : �������� �� ���� ȭ�� 
	   @RequestMapping(value="groupDetailY.gr")
	   public String groupDetailY() {	      
	      return "redirect:selectGroupView.gr"; 
	   }

	   
	   @RequestMapping(value = "selectGroupView.gr")
	   public String selectGroupView(
	         @RequestParam("membershipNo") int membershipNo,
	         @RequestParam(value = "page", required = false) Integer currentPage, Model model
	         , HttpSession session) {
	      
	      System.out.println("���ӹ�ȣ : " + membershipNo);
	      
	      //�̰�����-������ ȭ�� ������ 
	      Member m = (Member)session.getAttribute("loginUser");
	      String login = null;
	      if( m != null) { 
	         login = m.getUserId();
	      }
	      int checkStatus = gService.checkStatus(login, membershipNo); 
	      
	      //�������-������
	      int checkAdmin = gService.checkAdmin(login, membershipNo);
	      
	      //membershipNo�� �ش�Ǵ� ȭ�� 
	      ArrayList<Group> groups = gService.selectGroupView(membershipNo); //���� �̰� 0������ ���ͼ� �׷�...
	      model.addAttribute("list", groups);
	      
	      // boardList ��������
	      if (currentPage == null) { // ���� �� ������
	         currentPage = 1;
	      }
	      // �� ���� ��������
	      int listCount = gService.getListCount(membershipNo);
	      PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
	      ArrayList<GroupBoard> boardList = gService.selectBoardList(pi, membershipNo);
	      System.out.println("boardList : " + boardList);
	      
	      //������, �Խñ�, �̰�����/������, �������/������ ���� 
	      if (boardList != null) {
	         model.addAttribute("pi", pi);
	         model.addAttribute("boardList", boardList); //�Խñ� 
	         model.addAttribute("status", checkStatus);
	         model.addAttribute("adminStatus", checkAdmin);
	         model.addAttribute("membershipNo", membershipNo);
	         model.addAttribute("page", currentPage);
	         return "group_yJoin";
	      } else {
	         return "groupMain2"; // �Խñ� ��ȸ ���� �� ������ ȭ�� �����
	      }
	   }
	   
	// ---------------------���� : 2023-05-14 : ���� �Խñ� �󼼺���
	   @RequestMapping(value = "groupDetailBoard.gr")
	   public String groupDetailBoard(@RequestParam("boardNo") int boardNo,  @RequestParam("page") Integer page, Model model) {
	      System.out.println("groupDetailBoard");
	      //���� �۹�ȣ�� ������ ���� ��ȣ�� ��ġ�ϴ� �� �� ��ȸ 
	      GroupBoard detailBoard = gService.selectDetailBoard(boardNo);
	      //�۹�ȣ�� �´� ��ȸ 
	      ArrayList<Attachment> gAttm = gService.selectAttm(boardNo);
	      System.out.println("gAttm : " + gAttm);
	      
	      System.out.println("boardNo : " + boardNo);
	      if (detailBoard != null) {
	         model.addAttribute("list", detailBoard);
	         model.addAttribute("gList", gAttm);
	         return "detailBoardNotice";
	      } else {
	         return "groupMain2"; // �Խñ� �� ��ȸ ���� �� ������ ȭ�� �����
	      }
	   }

	   
	   // ������ ���� ������
	   @RequestMapping("adminMoim.gr")
	   public String adminMember(@RequestParam(value="page", required=false) Integer page, Model model) {
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = gService.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
			
			ArrayList<Group> gList = gService.selectGroupListWithHost(pi);
			if(gList != null) {
				model.addAttribute("pi", pi);
				model.addAttribute("gList", gList);
				return "adminMoim";
				
			} else {
				throw new GroupException("���� ��ȸ�� �����߽��ϴ�.");
			}
			
			
			
		}	   
		
		@RequestMapping("deleteMember.gr")
		public String deleteMember(@ModelAttribute GroupMember gc, Model model) {
			int result = gService.deleteMember(gc);
			int membershipNo = gc.getMembershipNo();
			if(result>0) {
				model.addAttribute("membershipNo", membershipNo);
				return "redirect:groupAdmin.gr";
			} else {
				throw new GroupException("��� �߹濡 �����߽��ϴ�.");
			}
		}
		
		
		// ���� ����
		@RequestMapping(value="groupUpdate.gr")
		public String groupUpdate(@RequestParam("membershipNo") int membershipNo, Model model) {
			
			Attachment a = gService.getGroupPic(membershipNo);
			Group membership = gService.getGroupInfo(membershipNo);
			System.out.println(membership);
			
			model.addAttribute("groupPic", a );
			model.addAttribute("groupInfo", membership );
			model.addAttribute("membershipNo", membershipNo);
			return "groupUpdate"; 
		}
		
		
		// ---------------------���� : 2023-05-15 : ���� �Խñ� �ۼ��ϱ�
		// �� ���������� �ۼ��ϱ� ��ư
		@RequestMapping("groupBoardWrite.gr")
		public String groupBoardWrite(@RequestParam(value = "page", required = false) Integer page,
				@RequestParam("membershipNo") int groupNo, Model model) {

			model.addAttribute("groupNo", groupNo);
			model.addAttribute("page", page);

			return "boardWrite"; // �� �ۼ� ȭ�鿡�� ������ ���� submit������
		}

		
		
		// �ۼ� �������� submit Ŭ��
		@RequestMapping("insertBoard.gr")
		public String groupBoardWrite(@ModelAttribute GroupBoard groupBoard, HttpServletRequest request,
				@RequestParam(value = "page", required = false) Integer page,
				@RequestParam("file") ArrayList<MultipartFile> file, Model model) {

			int currentPage = 1;
			if (page != null) {
				currentPage = page;
			}

			String id = ((Member) request.getSession().getAttribute("loginUser")).getUserId();
			groupBoard.setUsersId(id);
			System.out.println("�α��ΰ��� : " + id);

			// ÷������
			Attachment attachment = new Attachment();
			ArrayList<Attachment> list = new ArrayList<>();
			for (int i = 0; i < file.size(); i++) {
				MultipartFile upload = file.get(i); // ������ �� ���ϵ� ����
				// [MultipartFile[field="file", filename=¯��.png, contentType=image/png,
				// size=1174898]]
				if (upload != null && !upload.isEmpty()) { // �߰� ������ �ִٸ�
					String[] returnArr = saveFile(upload, request); // saveFile�޼ҵ忡 �Ѱ� �̸� ����/����ҿ� ����

					if (returnArr[1] != null) { // ������ �ִ� ���ϸ� list�� ���
						attachment.setSavePath(returnArr[0]); // ��� ����
						attachment.setOriginalName(upload.getOriginalFilename());
						attachment.setRenameName(returnArr[1]); // ���� �̸� �ֱ�
						attachment.setAttmLevel(1);
						attachment.setBoardType("����");
						attachment.setUserId(id);
						list.add(attachment);
					}
				}
			}
			System.out.println("attachment : " + attachment);
			System.out.println("groupBoard : " + groupBoard);

			// -------------------------------------------�� insert
			// GroupBoard - Attachment ���� �ϳ��� ����
			int result1 = gService.insertBoard(groupBoard); // �� ���
			System.out.println("result1 : " + result1);
			// �ֽ� �۹�ȣ ��ȸ
			int newBoardNo = gService.selectNewBoardNo(id);
			System.out.println("Ư�� ���̵��� �ֽ� �� ��ȣ ��ȸ : " + newBoardNo);

			int result2 = gService.insertGroupAttm(attachment); // ���� ���
			System.out.println("���� �߰� : " + result2);

			System.out.println("�׷��ȣ : " + groupBoard.getGroupNo());
			// �� ��� ���� ����� �Խñ� �ٷ� �� �� �ֵ��� boardNo �ѱ��
			return "redirect:groupDetailBoard.gr?page=" + currentPage + "&boardNo=" + newBoardNo;

		}
		
		// ���� : ���� ���� ������ 23.05.17
		@RequestMapping(value = "groupJoin.gr")
		public String groupJoin(@RequestParam("membershipNo") int membershipNo, @RequestParam("page") int page, HttpSession session, Model model) {
			Member m = (Member)session.getAttribute("loginUser");
			GroupMember gm = new GroupMember();
			gm.setMemberId(m.getUserId());
			gm.setMembershipNo(membershipNo);
			int result = gService.groupJoin(gm);
			if(result > 0) {				
				return "redirect:selectGroupView.gr?membershipNo=" + membershipNo + "&page=" + page;
			} else {
				throw new GroupException("���� ���Կ� �����߽��ϴ�");
			}
		}
		
		// ���� : ������ ������ ���� 23.05.17
		@RequestMapping(value="groupAdmin.gr")
		public String groupAdmin(@RequestParam("membershipNo") int membershipNo,
								@RequestParam(value="page", required=false) Integer page, Model model, HttpSession session) {
			
		    Member loginUser = (Member)session.getAttribute("loginUser");
		   	GroupMember gm = new GroupMember();
		   	gm.setMemberId(loginUser.getUserId());
			gm.setMembershipNo(membershipNo);
			int result = gService.checkGroupAdmin(gm);		
			
			if(result > 0) {
				int currentPage = 1;
				if(page != null) {
					currentPage = page;
				}
				
				int memberCount = gService.getMemberCount(membershipNo);
				PageInfo pi = Pagination.getPageInfo(currentPage, memberCount, 10);
				
				ArrayList<Member> mList = gService.getGroupMemberList(membershipNo, pi);
				if(mList != null) {
					model.addAttribute("pi", pi);
					model.addAttribute("mList", mList);
					model.addAttribute("membershipNo", membershipNo);
					return "groupAdmin";
					
				} else {
					throw new GroupException("���� ȸ�� ��ȸ�� �����߽��ϴ�.");
				}
				
			} else {
				throw new GroupException("�߸��� �����Դϴ�");
			}
		}		
		
}
