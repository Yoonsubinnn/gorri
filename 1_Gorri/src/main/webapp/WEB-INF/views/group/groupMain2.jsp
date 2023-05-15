<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.gTitle{text-align:center; text-decoration:underline;}
/* 	.groupCARD{width:350px; margin-left:auto; margin-right:auto; margin-top:20px; margin-bottom:20px;} */
/* 	.groupName{font-size: 30px; font-weight:bold;} */
/* 	.groupInt{heigt:100px;} */
	
	
	.groupTable2{
		border-collapse:separate;
		border-spacing:0;
		margin: 20px;
		width:880px;
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
		font-size:30px;
		font-weight:bold;
		text-align:left;
		padding-left:30px;
		padding-top:15px;
	
	}
	.groupIntro{
		height:35px;
		font-size:20px;
		font-weight:bold;
		text-align:left;
		padding-left:30px;
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

<%@include file = "../common/top.jsp" %>
		<br><br>
		<br>
		
		
		
	<!-- 모임 검색창 + 모임 개설 버튼 -->
		<%@include file = "../common/searchGroup.jsp" %>
        <br>
        <div class="gTitle">
		<a href="${ contextPath }/groupMaking.gr"><button class="btn btn-outline-success" type="button" style="background-color:#ffab00; color:white; border:1px solid #ffab00">모임 개설</button></a>
		</div><br>


<%@include file = "../common/categoryGroup.jsp" %>

<!-- 모임 목록 입니다.  --> 화이팅.....
<div align="center" style="margin:30px; margin-left:auto; margin-right:auto;">
   	
   	
   	<c:forEach items="${ gList }" var="g">
	   	<table class="groupTable2"  style="border:2px solid #ffab00; border-radius:2em;" >
					<tr>
						<td class="groupPic" rowspan ="3">
							<c:forEach items="${ gAttm }" var="a">							
								<c:if test="${ g.membershipNo eq a.boardNo }">									
									<img src="${ contextPath }/resources/uploadFiles/${a.renameName}"  class="gThumnail">
								</c:if>	
							</c:forEach>	
						</td>
						<td class="groupTitle"><a href="${ contextPath }/groupDetailY.gr" class="groupLink">${ g.membershipName }</a></td>
					</tr>				
					<tr>
						<td class="groupIntro">${ g.membershipContent }</td>
					</tr>
					<tr>
						<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">
							<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
							<span>${ g.capacity }</span>
							<input type="hidden" value="${ g.membershipNo }">
						</td> 
					</tr>
		</table> 
	   	
   	</c:forEach>
   	
<!--    	<table class="groupTable2"  style="border:2px solid #ffab00; border-radius:2em;" > -->
<!-- 				<tr> -->
<!-- 					<td class="groupPic" rowspan ="3"> -->
<!-- 						<img src="resources/assets/marvel.jpg" class="gThumnail"> -->
<!-- 					</td> -->
<%-- 					<td class="groupTitle"><a href="${ contextPath }/groupDetailN.gr" class="groupLink">영화를 사랑하는 모임</a></td> --%>
<!-- 				</tr>				 -->
<!-- 				<tr> -->
<!-- 					<td class="groupIntro">같이 영화 볼 사람 모집</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;"> -->
<!-- 						<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;">  -->
<!-- 						<span>10</span> -->
<!-- 					</td>  -->
<!-- 				</tr> -->
<!-- 	</table>  -->
<!--    	<table class="groupTable2"  style="border:2px solid #ffab00; border-radius:2em;" > -->
<!-- 				<tr> -->
<!-- 					<td class="groupPic" rowspan ="3"> -->
<!-- 						<img src="resources/assets/knitting.jpg" class="gThumnail"> -->
<!-- 					</td> -->
<%-- 					<td class="groupTitle"><a href="${ contextPath }/groupDetailAdmin.gr" class="groupLink">뜨개뜨개</a></td> --%>
<!-- 				</tr>				 -->
<!-- 				<tr> -->
<!-- 					<td class="groupIntro">뜨개질 정보 공유</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;"> -->
<!-- 						<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;">  -->
<!-- 						<span>10</span> -->
<!-- 					</td>  -->
<!-- 				</tr> -->
<!-- 	</table>  -->
<!--    	<table class="groupTable2"  style="border:2px solid #ffab00; border-radius:2em;" > -->
<!-- 				<tr> -->
<!-- 					<td class="groupPic" rowspan ="3"> -->
<!-- 						<img src="resources/assets/musical.jpg" class="gThumnail"> -->
<!-- 					</td> -->
<%-- 					<td class="groupTitle"><a href="${ contextPath }/groupDetailY.gr" class="groupLink">오페라의 유령</a></td> --%>
<!-- 				</tr>				 -->
<!-- 				<tr> -->
<!-- 					<td class="groupIntro">오페라의 유령 얘기할 사람</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;"> -->
<!-- 						<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;">  -->
<!-- 						<span>10</span> -->
<!-- 					</td>  -->
<!-- 				</tr> -->
<!-- 	</table>  -->
<!--    	<table class="groupTable2"  style="border:2px solid #ffab00; border-radius:2em;" > -->
<!-- 				<tr> -->
<!-- 					<td class="groupPic" rowspan ="3"> -->
<!-- 						<img src="resources/assets/musical.jpg" class="gThumnail"> -->
<!-- 					</td> -->
<%-- 					<td class="groupTitle"><a href="${ contextPath }/groupDetailY.gr" class="groupLink">오페라의 유령</a></td> --%>
<!-- 				</tr>				 -->
<!-- 				<tr> -->
<!-- 					<td class="groupIntro">오페라의 유령 얘기할 사람</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;"> -->
<!-- 						<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;">  -->
<!-- 						<span>10</span> -->
<!-- 					</td>  -->
<!-- 				</tr> -->
<!-- 	</table>  -->
				<nav aria-label="Standard pagination example" style="float: right;">
					<ul class="pagination">
	           				<li class="page-item">
	            					<c:url var="goBack" value="${ loc }">
	            						<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
	            					</c:url>
	            					<a class="page-link" href="${ goBack }" aria-label="Previous">
	            						<span aria-hidden="true">&laquo;</span>
	              					</a>
	            				</li>
	            				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	           					<c:url var="goNum" value="${ loc }">
	           						<c:param name="page" value="${ p }"></c:param>
	           					</c:url>
	            					<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	            				</c:forEach>
	            				<li class="page-item">
	            					<c:url var="goNext" value="${ loc }">
	            						<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
	            					</c:url>
	            					<a class="page-link" href="${ goNext }" aria-label="Next">
	            						<span aria-hidden="true">&raquo;</span>
	            					</a>
	            				</li>
	    				</ul>
        			</nav>

 </div>
<%@include file = "../common/footer.jsp" %>
<script>
	window.onload=()=>{
		
		const cateName = document.getElementsByClassName('categorys');
		
		for(cn of cateName){
			cn.addEventListener('click',function(){
				const category = this.querySelector('.category-name').innerText;
				console.log(category);
				location.href="${contextPath}/selectCate.gr?category=" + category;
			})
					
		}
		
	}

</script>
</body>
</html>