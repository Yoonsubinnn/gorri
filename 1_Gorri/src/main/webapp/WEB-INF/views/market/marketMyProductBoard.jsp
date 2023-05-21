<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <style>
    .thumbnail {
      text-align: center;
      border: 1px solid #333;
      padding: 10px;
      margin: 10px;
    }
    .thumbnail.rounded-3 {
      height: 300px;
      background-color: #fff1a0
    }
		.gTitle{text-align:center; text-decoration:underline;}
/* 	.groupCARD{width:350px; margin-left:auto; margin-right:auto; margin-top:20px; margin-bottom:20px;} */
/* 	.groupName{font-size: 30px; font-weight:bold;} */
/* 	.groupInt{heigt:100px;} */
	
	.bigGroupTable{
		width:800px;
		height:550px;
		
	}
	.groupTable2{
		border-collapse:separate;
		border-spacing:0;
		margin: 20px;
		width:500px;
	}
	
	.groupPic{
		width:300px;
		height:300px;
		position:relative;
		overflow:hidden;
		-webkit-clip-path: padding-box;
    	clip-path: padding-box;
	}
	.groupTitle{
		height:40px;
		font-size:25px;
		font-weight:bold;
		text-align:left;
		padding-left:20px;
		padding-top:15px;
	
	}
	.groupIntro{
		height:35px;
		font-size:15px;
		font-weight:bold;
		text-align:left;
		padding-left:20px;
		padding-top:20px;
		
	}
	
	.groupButtons{
		height:50px;
		font-size:10px;
		text-align:left;
		padding-top:20px;
		padding-left:20px;
	}
	
	.gThumnail{
		position:absolute;
		transform:translate(-50%, -50%);
		max-width:100%; 
		max-height:100%;
		-webkit-clip-path: inherit;
    	clip-path: inherit;
    	width: 100%;
   		height: 100%;
    	object-fit: cover;
    	border-top-left-radius:2em;
    	border-bottom-left-radius:2em;
	}

	a.groupLink{
		text-decoration: none; /* 밑줄 없애기 */
  		color: black;
	}
	a.groupLink:hover{
		color:#ffab00
	}
	table{
		margin:0 auto; text-align: center; width: 90%;
		border-top: 1.5px solid darkgray; border-bottom: 1.5px solid darkgray;
		}
	
	.category{margin-left:100px; margin-right: 100px;}
	.categorys{width: 70px; cursor: pointer;  padding-top: 25px; padding-bottom: 20px;}
  	.category-name{font-size: 13px; text-decoration: none; color: black;} /* 카테고리 항목 글자크기 */
  	.fa-solid{font-size: 25px;} /* 아이콘 크기 */
  	.categorys:hover{color: #ffaa00;}
  	.categorys:active {color: #ff0044;}



  </style>

</head>
<body>
	<!-- header -->
	<%@include file = "marketTop.jsp" %>
	
	
	<!-- 내가 등록한 상품 표시부분 div -->
	<div>
		<h1 align="center">내가 등록한 상품</h1>
		<!-- 서식 가져오는 것이 나음 -->
	</div>
	
	
	<div style="text-align:center; margin:30px; margin-left:auto; margin-right:auto;">
		<c:forEach items="${ list }" var="a" >			
		<table class="bigGroupTable" style="border-color:white">	
			<tr>
				<td>
					<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;"
					onclick="location.href='${contextPath}/Product.market?productId='+${ a.productNo }">
						<tr>
							<td class="groupPic"><img src="#" class="gThumnail"></td>
						</tr>
						<tr>
							<td class="groupTitle">${ a.productName }</td>
						</tr>
						<tr>
							<td>등록자 : ${ a.productSellerId } 이름은 ${ a.productName } 제품번호는 ${ a.productNo }</td>
						</tr>
						<tr>
							<td class="groupIntro">${ a.productPrice }원</td>
						</tr>
						<tr>
							<td class="tags" style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">태그 : ${ a.productCategory }</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</c:forEach>
	</div>

	
	
	
	
	<%@include file = "marketFooter.jsp" %>

</body>
</html>