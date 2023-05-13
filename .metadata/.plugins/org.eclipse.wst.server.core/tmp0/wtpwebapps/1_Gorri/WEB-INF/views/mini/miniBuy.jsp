<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
   <!-- Required meta tags -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->

   <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

   <title>Gorri</title>
<style>
	
	/* 주황 테두리 부분 */
	.border-line{
		border : 2px solid #ffaa00; width : 1200px; 
		margin-top: 100px;
		margin-left:auto; margin-right:auto;
		border-radius: 30px;
		}


	/* 구매내역 (영수증모양)*/
	.bottom{
		width: 1030px;
		margin-left: auto; margin-right: auto;
		display: flex; 
		flex-wrap: wrap;
		}
	.border{
		width : 320px;
		border: border: 1.5px solid lightgray; border-radius: 5px; 
		box-shadow: 2px 2px 8px 2px lightgray;
		text-align: center;
		padding: 20px;
		margin-left: 11px; margin-right: 11px; margin-bottom: 20px;}
	.border>div{margin-bottom: 2px;}
	
	.menu-icon{font-size: 30px; margin-top: 20px; margin-left: auto; margin-right: auto;} /* 아이콘관련 (없어도 됨)*/
	.bi{margin-left:auto; margin-right:auto;}
	.menu{font-size: 12px; text-align: left;}	/* 항목 글씨 크기*/
	.title{
		display: flex; 
		justify-content: center;
		align-items : center;
		}
	
	.text-center{text-align: center;}
	.name{width: 110px; text-align: center;}
	.price,  .sum-price{width: 60px;}
	.num{width: 30px;}
	
	.product{color: black; text-decoration: none;}

	.all-price{width: 130px; font-size: 15px; font-weight: bold;}


</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<br>


   <!-- Option 2: Separate Popper and Bootstrap JS -->
   <!--
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
   -->
   
	<div class="border-line"> <!-- 겉에 주황색 테두리 -->
   
		<%@ include file="minihome-nav.jsp" %> <!-- 프로필사진, 닉넴, 자기소개글, 메뉴버튼 -->
		
		<!-- 구매내역 -->
		<div class="bottom">
			<div class="border">  <!-- 얘가 영수증 한개씩 되는거... -->
				<div class="menu-icon"><i class="bi bi-balloon-fill"></i></div>
				<div class="">Gorri Market</div>
				<div class="">------------------------------------------</div>
				<div class="menu">2023-04-23(일) 22:10</div>
				<div class="menu"><a>주문번호 : </a><a>20230423148461</a></div>
				<div class="menu"><a>판매자 : </a><a>판매자닉네임</a></div>
				<div class="menu"><a>배송지 : </a><a>서울시 어쩌구 저쩌구 배송받는 우리집 주소가 여기 뜨게</a></div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center">상품명</div>
					<div class="price text-center">단가</div>
					<div class="num text-center">수량</div>
					<div class="sum-price text-center">금액</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center"><a class="product" href="#">밀가루없는 빵</a></div>
					<div class="price text-center">10,000</div>
					<div class="num text-center">1</div>
					<div class="sum-price text-center">10,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="all-price text-center">총 금액</div>
					<div class="all-price text-center">10,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<br>
				<div>Thank You!</div>
				<br><br>
			</div>
		
			<div class="border">
				<div class="menu-icon"><i class="bi bi-arrow-through-heart-fill"></i></div>
				<div class="">Gorri Market</div>
				<div class="">------------------------------------------</div>
				<div class="menu">2023-04-23(일) 22:10</div>
				<div class="menu"><a>주문번호 : </a><a>20230423148461</a></div>
				<div class="menu"><a>판매자 : </a><a>판매자닉네임</a></div>
				<div class="menu"><a>배송지 : </a><a>서울시 어쩌구 저쩌구 배송받는 우리집 주소가 여기 뜨게</a></div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center">상품명</div>
					<div class="price text-center">단가</div>
					<div class="num text-center">수량</div>
					<div class="sum-price text-center">금액</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center"><a class="product" href="#">내가 그린 고양이</a></div>
					<div class="price text-center">5,000</div>
					<div class="num text-center">1</div>
					<div class="sum-price text-center">5,000</div>
				</div>
				<div class="menu title">
					<div class="name text-center"><a class="product" href="#">내가 그린 강아지</a></div>
					<div class="price text-center">5,000</div>
					<div class="num text-center">2</div>
					<div class="sum-price text-center">10,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="all-price text-center">총 금액</div>
					<div class="all-price text-center">15,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<br>
				<div>Thank You!</div>
				<br><br>
			</div>
			
			<div class="border">  <!-- 얘가 영수증 한개씩 되는거... -->
				<div class="menu-icon"><i class="bi bi-emoji-wink-fill"></i></div>
				<div class="">Gorri Market</div>
				<div class="">------------------------------------------</div>
				<div class="menu">2023-04-23(일) 22:10</div>
				<div class="menu"><a>주문번호 : </a><a>20230423148461</a></div>
				<div class="menu"><a>판매자 : </a><a>판매자닉네임</a></div>
				<div class="menu"><a>배송지 : </a><a>서울시 어쩌구 저쩌구 배송받는 우리집 주소가 여기 뜨게</a></div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center">상품명</div>
					<div class="price text-center">단가</div>
					<div class="num text-center">수량</div>
					<div class="sum-price text-center">금액</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center"><a class="product" href="#">직접만든 키링</a></div>
					<div class="price text-center">8,000</div>
					<div class="num text-center">2</div>
					<div class="sum-price text-center">16,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="all-price text-center">총 금액</div>
					<div class="all-price text-center">16,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<br>
				<div>Thank You!</div>
				<br><br>
			</div>
		
			<div class="border">
				<div class="menu-icon"><i class="bi bi-balloon-fill"></i></div>
				<div class="">Gorri Market</div>
				<div class="">------------------------------------------</div>
				<div class="menu">2023-04-23(일) 22:10</div>
				<div class="menu"><a>주문번호 : </a><a>20230423148461</a></div>
				<div class="menu"><a>판매자 : </a><a>판매자닉네임</a></div>
				<div class="menu"><a>배송지 : </a><a>서울시 어쩌구 저쩌구 배송받는 우리집 주소가 여기 뜨게</a></div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center">상품명</div>
					<div class="price text-center">단가</div>
					<div class="num text-center">수량</div>
					<div class="sum-price text-center">금액</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center"><a class="product" href="#">내가 그린 고양이</a></div>
					<div class="price text-center">5,000</div>
					<div class="num text-center">1</div>
					<div class="sum-price text-center">5,000</div>
				</div>
				<div class="menu title">
					<div class="name text-center"><a class="product" href="#">내가 그린 강아지</a></div>
					<div class="price text-center">5,000</div>
					<div class="num text-center">2</div>
					<div class="sum-price text-center">10,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="all-price text-center">총 금액</div>
					<div class="all-price text-center">15,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<br>
				<div>Thank You!</div>
				<br><br>
			</div>
			
			<div class="border">
				<div class="menu-icon"><i class="bi bi-balloon-fill"></i></div>
				<div class="">Gorri Market</div>
				<div class="">------------------------------------------</div>
				<div class="menu">2023-04-23(일) 22:10</div>
				<div class="menu"><a>주문번호 : </a><a>20230423148461</a></div>
				<div class="menu"><a>판매자 : </a><a>판매자닉네임</a></div>
				<div class="menu"><a>배송지 : </a><a>서울시 어쩌구 저쩌구 배송받는 우리집 주소가 여기 뜨게</a></div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center">상품명</div>
					<div class="price text-center">단가</div>
					<div class="num text-center">수량</div>
					<div class="sum-price text-center">금액</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="name text-center"><a class="product" href="market-detail.jsp">달고 맛있는 키위</a></div>
					<div class="price text-center">5,000</div>
					<div class="num text-center">1</div>
					<div class="sum-price text-center">5,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<div class="menu title">
					<div class="all-price text-center">총 금액</div>
					<div class="all-price text-center">15,000</div>
				</div>
				<div class="">------------------------------------------</div>
				<br>
				<div>Thank You!</div>
				<br><br>
			</div>
			
		</div>
		<br>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
<script>

</script>
</body>
</html>