<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Gorri의 소중한 상품</title>
<style>

	/* 제일 겉에 마켓 상세 범위 */
	.div{
		width : 70%;  min-width: 800px;
		margin-left: auto; margin-right: auto;} /* 가운데정렬 */
	.center-div{margin-left: auto; margin-right: auto; width : 95%; }

	
	/* section 1: 상품 사진, 이름, 가격, 구매버튼 부분 */
	.section1{ 
		width: 100%;
		display: flex; 
		justify-content: center;
		margin-top: 50px; /* 위에 메뉴탭이랑 여백 */
		}
	.sec1-img{text-align: center; width: 50%;}
	
	.div-big{ /* 큰 상품이미지-div */
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-bottom: 10px;
		}
	.img-big{width: 400px; height: 400px;} /* 큰 상품이미지*/
	.img-mini{width: 60px; height: 60px; cursor: pointer;} /* 작은 상품이미지*/
	.img-mini:hover{border: 2.5px solid #fa0;}
	
	.info{padding: 20px; margin-top: 10px;} /* 상품 이미지 옆에 판매정보관련 */
	.title{
		font-weight: bold; color: black; 
		padding-left: 15px;}
	.class0{font-weight: bold; font-size: 20px;}
	.class1{margin-top: 20px; font-size: 18px; cursor: default;}
	.left{text-align: left; color: gray;}
	.right{text-align: right;}
	
	.class-btn{text-align: center; margin-top: 40px;}

	
	/* section 2: 판매자가 입력한 상품 상세정보 입력부분 */
	.product-info{font-weight: bold; font-size: 20px; margin-top: 10px; margin-bottom: 20px;}
	.product-text{
		padding-left: 15px; padding-right: 15px;
		text-align: justify; /* 양쪽정렬 */
		white-space: pre-line; /* 엔터 인식 */
		}
	
	/* 구매버튼 관련 설정*/
	.button {
		width: 140px; height: 45px;
		font-family: ;
		font-size: 11px;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: #000;
		background-color: #fff;
		border: none;
		border-radius: 45px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
		margin: 5px;
		}
	.button:hover {
		background-color: #ffaa00;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		color: #fff;
		transform: translateY(-7px);
		}
	.like{width: 45px; font-size: 15px;}
	
	/* 중간 줄*/ 
 	.line{ 
 		border : 1px solid gray; width: 100%; 
 		margin-left:auto; margin-right:auto; margin-top: 40px; margin-bottom: 40px;}

	
	.profile{text-align: center;}
	#profile-img{
		width: 100px; height: 100px;
		margin-left:auto; margin-right:auto;
	}
	#pro-img{
		width: 100%; height: 100%; 
		border-radius: 50%;
		object-fit: cover;
		object-position: center;
	}
	#id{margin-top: 5px; margin-bottom: 5px;}
	
	
	/* 상품 문의, 구매 후기 게시판 관련*/
	.section4, .section5{ 
		width: 100%;
		justify-content: center;
		margin-top: 50px; /* 위에 메뉴탭이랑 여백 */
		 margin-left: 0 auto; margin-right: 0 auto;
		}
	table{border-collapse: collapse; text-align: center; width: 100%;}
	table tr{height: 40px; border-bottom: 1px solid lightgray;}
	.top{background-color: rgba(250, 170, 0, 0.3);}
	.no{width: 80px;}
	.title{width: 500px;}
	.writer{width: 100px;}
	.date{width: 150px;}
	.count{width: 80px;}
	
	
	
	/* 삭제 확인 */
	.modal-body{text-align: center;}
	.bi-emoji-frown-fill{font-size: 60px; color: #fa0;}
	.footer{
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-top: 30px; margin-bottom: 30px;
		padding-top: 20px;
		border-top: 1px solid lightgray;
		}
	
	
</style>
</head>

				<!-- 작성중입니다. 로직을 위해.
				현재 버전으로 서버 돌리면  이 페이지로 넘어가지진 않습니다. -->






<body>
	<%@ include file="../common/top.jsp" %>
	<br>
	<div class="div"> <!-- 제일 바깥쪽 여백 범위 위한 div -->
		<div class="center-div"> <!-- 얘네는 다 수직정렬 되야함 -->
			<div class="section1"> <!-- section 1: 상품 사진, 이름, 가격, 구매버튼 -->
				<div class="sec1 sec1-img">
					<div class="div-big">
						<img class="img-big" src="assets/pic1.jpg">
					</div>
					<div class="div-mini">
						<img class="img-mini" src="assets/pic1.jpg">
						<img class="img-mini" src="assets/pic2.jpg">
						<img class="img-mini" src="assets/pic3.jpg">
					</div>
				</div>
				<div class="sec1 info">
					<div class="class0">달고 맛있는 키위~~ 함 드셔보셔요</div>
					<div class="class1 left"><i class="bi bi-list"> </i>카테고리<i class="bi bi-chevron-compact-right"></i>요리</div>
					<div class="class1 right"><a class="title">가격 : </a><a> 10,000원</a></div>
					
					<!-- 얘도 만약 내꺼라면 뜨지 않게 해야함. -->
					<c:if test="${ !empty loginUser && loginUser.userId == product.productSellerID }">
					<div class="class1 right"><a class="title">수량 : </a><a><i class="bi bi-dash-square-fill"></i></a> 00 <a><i class="bi bi-plus-square-fill"></i></a></div>
					</c:if>
					
					<div class="class1 right"><a class="title">등록일 : </a><a>2023-05-03</a></div>
					<div class="class-btn">
					<!-- 만약 페이지가 내 페이지라면, 수정하기/삭제하기 버튼이 나와야 하고, 상대라면, 구매하기 버튼만 나오게 한다. -->
					
					
					<c:if test="${ !empty loginUser && loginUser.userId == product.productSellerID }">	<!-- 내 상품을 클릭한 경우. -->
						<button class="button" onclick="location.href='#"><b>수정하기</b></button>
						<button class="button" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><b>삭제하기</b></button>
					</c:if>
					<c:if test="${ empty loginUser || loginUser.userId != product.productSellerId }">	<!--  내 상품이 아닌 경우 -->
						<button class="button"
							onclick="location.href='${ pageContext.servletContext.contextPath }/BuyingPage.market'">
						<b>구매하기</b></button>
						<button class="button like" onclick="location.href='#"><i class="bi bi-heart-fill"></i></button>
					</c:if>
					
					
					</div>
				</div>
			</div>
		</div>
			
		<div class="line"></div>
			
			
		<!-- 상품정보 :
			상품의 이름,
			상품의 설명 들어감-->
		<div class="center-div"> <!-- 얘네는 다 수직정렬 되야함 --> 
			<div class="section2"> <!-- section 2: 판매자가 입력한 상품 상세정보 입력부분 -->
				<div class="product-info"><i class="bi bi-caret-right-fill"></i> 상품정보</div>
				<div class="product-text">여기에 판매자가 입력한 상품정보내역 출력
				것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은
				</div>
			</div>
		</div>	
			
		<div class="line"></div>
			
			
			
		<!-- 판매자의 정보. 마이홈 링크 -->
		<div class="center-div"> <!-- 얘네는 다 수직정렬 되야함 -->	
			<div class="section3"> <!-- 판매자 정보관련 -->
				<div class="profile">
					<div id="profile-img"><img id="pro-img" src="assets/no-img.png"></div>
					<div id="id">닉네임</div>
					<div><button class="button" onclick="location.href='#"><b>미니홈</b></button></div>
				</div>
			</div>
		</div>		
			
		<div class="line"></div>
		
		
		<!-- 문의내역 -->
		<div class="center-div"> <!-- 얘네는 다 수직정렬 되야함 -->
			<div class="section4">
				<div class="product-info"><i class="bi bi-pencil-fill"></i> 상품 문의</div>
				<table>
					<tr class="top">
						<th class="no">번호</th>
						<th class="writer">작성자</th>
						<th class="title">문의내용</th>
						<th class="date">작성일자</th>
					</tr>
					<!-- foreach로 5개만 보이게 반복 돌리며 페이지네이션 
						근데 이거 aJax로 구현해야 할 것 같은데. -->
						
					<c:forEach items="#" var="#">
						<tr>
							<td>1</td>
							<td>작성자1</td>
							<td>어쩌고 저쩌고 궁금합니다.....</td>
							<td>2023.00.00</td>
						</tr>
					</c:forEach>
				</table>
				
				
				<!-- 문의등록 버튼, 이 친구는 로그인을 했을 때만 존재하도록 -->
				<c:if test="#" var="#">
					<div class="reply re-input">
						<div class="re-id">작성자ID</div> <!-- 로그인한 사용자 프로필 주소로 변경하기.. -->
						<div class="re-text"><input class="re-text" type="text" placeholder="내용을 입력하세요."></div>
						<div class="re-submit"><button type="submit" class="button2">문의등록</button></div>
					</div>
				</c:if>
				
			</div>
		</div>		
			
		<div class="line"></div>
			
		<!-- 후기 
			얘는 그냥 마이페이지에서만 작성할 수 있어서. 작성버튼 따로 없음.
			얘는 그냥 보여지는거임.-->
		<div class="center-div"> <!-- 얘네는 다 수직정렬 되야함 -->	
			<div class="section5">
				<div class="product-info"><i class="bi bi-pencil-fill"></i> 구매 후기</div>
				<table>
					<tr class="top">
						<th class="no">번호</th>
						<th class="writer">작성자</th>
						<th class="title">내용</th>
						<th class="date">작성일자</th>
					</tr>
					
					<c:forEach items="#" var="#">
						<tr>
						<td>1</td>
						<td>작성자1</td>
						<td>너무너무 맛이ㅣㅆ어요~</td>
						<td>2023.00.00</td>
					</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
	</div>
		
		
	<%@ include file="../common/footer.jsp" %>
	
	
	<!-- 삭제확인 알림 모달 -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">게시글 삭제</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<i class="bi bi-emoji-frown-fill"></i><br><br>
				        삭제하기 버튼을 누르면 게시글이 즉시 삭제 됩니다.<br>
				        정말 삭제하시겠습니까?
				</div>
				<div class="footer">
					<div><button type="button" class="button btn-n" data-bs-dismiss="modal">취소</button></div>
			        <div><button type="button" class="button btn-y">삭제하기</button></div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	<script>
		window.onload = function() {
		    let bigPic = document.querySelector('.img-big');
		    let smallPics = document.querySelectorAll('.img-mini');
		
		    for(let i = 0; i < smallPics.length; i++) {
		        smallPics[i].onclick = changepic;
		    }
		
		    function changepic() {
		        let smallPicsAttribute = this.getAttribute('src');
		        bigPic.setAttribute('src', smallPicsAttribute);
		    }
		}
	
	</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>