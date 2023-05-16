<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 메인페이지</title>
<style>
	.gTitle{text-align:center; text-decoration:underline;}
/* 	.groupCARD{width:350px; margin-left:auto; margin-right:auto; margin-top:20px; margin-bottom:20px;} */
/* 	.groupName{font-size: 30px; font-weight:bold;} */
/* 	.groupInt{heigt:100px;} */
	
	.bigGroupTable{
		width:1000px;
		height:1450px;
		
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
	<%@include file = "../common/top.jsp" %>
	<%@include file = "../common/search.jsp" %>
	<%@include file = "../common/category.jsp" %>

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

	<c:forEach items="${ list }" var="a" >
	<div style="text-align:center; margin:30px; margin-left:auto; margin-right:auto;">
		<table class="bigGroupTable" style="border-color:white">	
			<tr>
				<td>
					<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
						<tr>
							<td class="groupPic">
								<img src="resources/assets/musical.jpg" class="gThumnail">
								<!-- 이미지 src바꿔야함. -->
							</td>
						</tr>
						<tr>
							<td class="groupTitle"><a href="${ contextPath }/ProductDetail.market" class="groupLink">${ a.productName }</a></td>
							<!-- 페이지로 넘어갈 때, 그것의 속성을 가지고 넘어가야 합니다. -->
						</tr>
						<tr>
							<td class="groupIntro">${ a.productPrice }</td>
						</tr>
						<tr>
							<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">
								<!-- 태그가 나오도록 수정하세요 -->
								<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
								<span>10</span>
							</td> 
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	</c:forEach>
	

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
 
 
 
 
 
<%@include file = "../common/footer.jsp" %>
</body>
</html>