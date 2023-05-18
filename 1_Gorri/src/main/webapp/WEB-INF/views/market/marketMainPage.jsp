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
		width:1000px;
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
</style>
</head>
<body>

<!-- 조각코드 -->
	<%@include file = "marketTop.jsp" %>
	<%@include file = "marketSearch.jsp" %>
	<%@include file = "marketCategory.jsp" %>

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
                <button type="button" class="btn btn-info" 
                onclick="location.href='${ pageContext.servletContext.contextPath }/MyProductBoard.market'">내가 등록한 상품</button>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-info"
                onclick="location.href='${ pageContext.servletContext.contextPath }/Register.market'">상품 등록</button>
            </div>
		</div>
	</div>




<!-- 게시판 하나만 빼기. 이 안에서 foreach 돌려라/ 
			list가 넘어오는 아이디라 가정하겠다. -->

<%-- 	<c:forEach items="${ list }" var="a" > --%>
<!-- 	<div class="prod"style="text-align:center; margin:30px; margin-left:auto; margin-right:auto;" > -->
<!-- 		<table class="bigGroupTable" style="border-color:white">	 -->
<!-- 			<tr> -->
<!-- 				<td> -->
<!-- 					<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;"> -->
<!-- 						<tr> -->
<!-- 							<td class="groupPic"><img src="#" class="gThumnail"></td> -->
<!-- 								이미지 src바꿔야함. -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<%-- 							<td class="groupTitle">${ a.productName }</td> --%>
<!-- 							페이지로 넘어갈 때, 그것의 속성을 가지고 넘어가야 합니다. -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<%-- 							<td class="groupIntro">${ a.productPrice }</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;"> -->
<!-- 								태그가 나오도록 수정하세요 -->
<!-- 								<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;">  -->
<!-- 								<span>10</span> -->
<!-- 								태그 나오게 수정. 완성되면 위 삭제하셈 -->
<%-- 								<span class="badge bg-secondary">${ a.productContent }</span> --%>
<!-- 							</td>  -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</div> -->
<%-- 	</c:forEach> --%>
	
	<div style="text-align:center; margin:30px; margin-left:auto; margin-right:auto;">
		<c:forEach items="${ list }" var="a" >			
		<table class="bigGroupTable" style="border-color:white">	
			<tr>
				<td>
					<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;"
					onclick="location.href='${contextPath}/Product.market?productId='+${ a.productNo }+'&page='+${pi.currentPage}">
<%-- 		원본 : 			onclick="location.href='${contextPath}/Product.market?bId=' + ${ a.productNo } + '&Writer=' + ${ a.productSellerId } + '&page=' + ${pi.currentPage}"> 칸 붙여 ㅄ아 --%>
						<tr>
							<td class="groupPic"><img src="#" class="gThumnail"></td>
						</tr>
						<tr>
							<td class="groupTitle"><a href="${ contextPath }/ProductDetail.market" class="groupLink">${ a.productName }</a></td>
						</tr>
						<tr>
							<td class="groupIntro">${ a.productPrice }</td>
						</tr>
						<tr>
							<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">
								<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
								<span>10</span>
							</td> 
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</c:forEach>
	</div>
	
	<!-- 마켓의 상품 번호도 추가해줘야합니다. -->

 <!-- 4. 페이지네이션-->
	
<!-- 	<nav aria-label="Page navigation example"> -->
<!-- 	  <ul class="pagination justify-content-center"> -->
<!-- 	    <li class="page-item disabled"> -->
<!-- 	      <a class="page-link">Previous</a> -->
<!-- 	    </li> -->
<!-- 	    <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 	    <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 	    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 	    <li class="page-item"> -->
<!-- 	      <a class="page-link" href="#">Next</a> -->
<!-- 	    </li> -->
<!-- 	  </ul> -->
<!-- 	</nav> -->
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
 
 	<script type="text/javascript">
// 		window.onload=()=> {
// 			/*행 어디를 클릭하든 글 번호를 추출해서 상세보기 페이지로 넘기기
// 			selectBoard.bo -->bId, writer, page
			
// 			1. board접근은
			
// 			*/
// 			const tables = document.querySelectorAll('.smGroupTable')
// 			for (let tb of tables) {
// 				let tds = tb.querySelectorAll('td');
// 				for(const td of tds) {
// 					td.addEventListener()
// 				}
// 			}
			
// 			//td에 접근하기
// // 			const tds = prod.querySelectorAll('td');	//쿼리셀렉터는 내가 원하는 범위에서 찾을 수 있다. 그런 장점 가짐
// 			//찍어보면, 배열로 잘 나옴.
// 			for (const td of tds) {
// 				td.addEventListener('click', function(){
// 					//부모에 가서, 자식의 몇번째인지인 것을 가져오는 것이 편함
// 					const trTds = this.parentElement.children;
// 					const boardId = trTds[0].innerText;
// 					const writer = trTds[2].innerText;
// 					location.href='${contextPath}/selectBoard.bo?bId=' + boardId + '&Writer=' + writer + '&page=' + ${pi.currentPage};
// 							//''안에는 띄어쓰기 있음 안되는건 알지? 이거 url만들어주는거니까.
// 				})
// 			}
// 		}
	</script>
 
 
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%@include file = "marketFooter.jsp" %>
</body>
</html>