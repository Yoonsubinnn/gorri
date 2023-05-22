<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<title>마켓 메인페이지</title>
<style>
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

<!-- 조각코드 -->
	<%@include file = "marketTop.jsp" %>
	<%@include file = "marketSearch.jsp" %>

	<!-- 카테고리 조각코드 시작 -->
	<br>
	<div class="category">
		<table>
			<tr>
				<td class="margin"></td>
				<td class="categorys" onclick=""><i class="fa-solid fa-paintbrush"></i><br><a class="category-name">예술</a></td>
				<td class="categorys"><i class="fa-solid fa-baseball"></i><br><a class="category-name">운동</a></td>
				<td class="categorys"><i class="fa-solid fa-utensils"></i><br><a class="category-name">음식</a></td>
				<td class="categorys"><i class="fa-solid fa-suitcase-rolling"></i><br><a class="category-name">여행</a></td>
				<td class="categorys"><i class="fa-solid fa-pencil"></i><br><a class="category-name">창작</a></td>
				<td class="categorys"><i class="fa-solid fa-graduation-cap"></i><br><a class="category-name">자기계발</a></td>
				<td class="margin"></td>
			</tr>
		</table>
	</div>
  	<br>
  	<!-- 카테고리 조각코드 종료 -->
  	<script type="text/javascript">
  		/*카테고리별 선택 알고리즘. 
  		그리고 클릭 시, 각 카테고리의 text에 맞게 어디로 링크 넘어가게끔. */
  		window.onload =() => {
  			const categories = document.querySelectorAll("td.categorys");
  			const contextPath = "${ pageContext.servletContext.contextPath }";
//   			console.log("정상작동 확인");
//   			console.log("categories");
//   			console.log("contextPath");
  			 categories.forEach(function(category) {
  			      category.addEventListener("click", function() {
  			        let url = "/MainPage.market?category=" + encodeURIComponent(this.innerText.trim());
  			        window.location.href = contextPath + url;
  			      });
  			 });
  		}
  	</script>
  	
  	<!-- 검색창 아래 부분. -->
	<div class="container">
		<div class="row align-items-center">
           <div class="dropdown">
			  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    양식수정예정
			  </button>
			  <!-- 이 버튼을 위한 자바스크립트 태그 구현해야함 -->
			  
			  <ul class="dropdown-menu">
			  <!-- 이 드롭다운을 위한 자바스크립트 태그 구현해야함 -->
			    <li><a class="dropdown-item" href="#">회원 수</a></li>
			    <li><a class="dropdown-item" href="#">최신 순</a></li>
			    <li><a class="dropdown-item" href="#">인기 순</a></li>
			  </ul>
			</div>

            <!-- 2 buttons aligned in the middle -->
            <div class="col d-flex justify-content-center">
            	<c:if test="${ !empty loginUser }">
<!--             		<button type="button" class="btn btn-info"  -->
<%-- 	                onclick="location.href='${ pageContext.servletContext.contextPath }/MyProductBoard.market'">내가 등록한 상품</button> --%>
	                
	                <form action="${contextPath}/MyProductBoard.market" method="get">
					    <button type="submit" class="btn btn-info">내가 등록한 상품</button>
					</form>
	                 &nbsp;&nbsp;&nbsp;&nbsp;
	                <button type="button" class="btn btn-info"
	                onclick="location.href='${ pageContext.servletContext.contextPath }/Register.market'">상품 등록</button>
            	</c:if>
            </div>
		</div>
	</div>

	<!-- 드롭다운 정렬 알고리즘 짜야 함. 버튼을 누르면 시간순 정렬, 이름 순 정렬. -->

	<!-- 게시판-->	
	<div style="text-align:center; margin:30px; margin-left:auto; margin-right:auto;">
		<c:forEach items="${ list }" var="a" >			
		<table class="bigGroupTable" style="border-color:white">	
			<tr>
				<td>
					<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;"
					onclick="location.href='${contextPath}/Product.market?productId='+${ a.productNo }+'&page='+${pi.currentPage}">
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

	
	<!-- 마켓의 상품 번호도 추가해줘야합니다. -->

 <!-- 4. 페이지네이션-->
	
 		<nav aria-label="Standard pagination example" style="float: right;">
        	<ul class="pagination">
	            <li class="page-item">
	            	<c:url value="${ loc }" var="goBack">
	            		<c:param name="page" value="${ pi.currentPage - 1 }"/>
	            	</c:url>
	            	<a class="page-link" href="${ goBack }" aria-label="Previous">
	            		<span aria-hidden="true">&laquo;</span>
	              	</a>
	            </li>
	            
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	            	<c:url var="goNum" value="${ loc }">
	            		<c:param name="page" value="${ p }"/>
	            	</c:url>
	            	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	            </c:forEach>
	            
	            <li class="page-item">
	            	<c:url value="${ loc }" var="goNext">
	            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
	            	</c:url>
	            	<a class="page-link" href="${ goNext }" aria-label="Next">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </li>
	    	</ul>
        </nav>
 
 
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%@include file = "marketFooter.jsp" %>
</body>
</html>