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




<!-- 게시판 하나만 빼기. 이 안에서 foreach 돌려라/  -->
<div style="text-align:center; margin:30px; margin-left:auto; margin-right:auto;">
	<table class="bigGroupTable" style="border-color:white">	
		<tr>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">
							<img src="resources/assets/musical.jpg" class="gThumnail">
						</td>
					</tr>
					<tr>
						<td class="groupTitle"><a href="${ contextPath }/ProductDetail.market" class="groupLink">오페라의 유령</a></td>
					</tr>
					<tr>
						<td class="groupIntro">오페라의 유령 얘기할 사람</td>
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
 </div>



<!-- 모임 목록 입니다.  -->
<%-- <div style="text-align:center; margin:30px; margin-left:auto; margin-right:auto;">
	<table class="bigGroupTable" style="border-color:white">	
		<tr>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">
							<img src="resources/assets/musical.jpg" class="gThumnail">
						</td>
					</tr>
					<tr>
						<td class="groupTitle"><a href="${ contextPath }/groupDetailY.gr" class="groupLink">오페라의 유령</a></td>
					</tr>
					<tr>
						<td class="groupIntro">오페라의 유령 얘기할 사람</td>
					</tr>
					<tr>
						<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">
							<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
							<span>10</span>
						</td> 
					</tr>
				</table>
			</td>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">
							<img src="resources/assets/marvel.jpg" class="gThumnail">
						</td>
					</tr>
					<tr>
						<td class="groupTitle"><a href="${ contextPath }/groupDetailN.gr" class="groupLink">영화를 사랑하는 모임</a></td>
					</tr>
					<tr>
						<td class="groupIntro">같이 영화 볼 사람 모집</td>
					</tr>
					<tr>
						<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">
							<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
							<span>10</span>
						</td> 
					</tr>
				</table>
			</td>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">
							<img src="resources/assets/knitting.jpg" class="gThumnail">
						</td>					
					</tr>
					<tr>
						<td class="groupTitle"><a href="${ contextPath }/groupDetailAdmin.gr" class="groupLink">뜨개뜨개</a></td>
					</tr>
					<tr>
						<td class="groupIntro">뜨개질 정보 공유</td>
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
		
		
		<tr>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">thumnail</td>
					</tr>
					<tr>
						<td class="groupTitle">모임명</td>
					</tr>
					<tr>
						<td class="groupIntro">모임 한줄 소개</td>
					</tr>
					<tr>
						<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">
							<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
							<span>10</span>
						</td> 
					</tr>
				</table>
			</td>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">thumnail</td>
					</tr>
					<tr>
						<td class="groupTitle">모임명</td>
					</tr>
					<tr>
						<td class="groupIntro">모임 한줄 소개</td>
					</tr>
					<tr>
						<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">
							<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
							<span>10</span>
						</td> 
					</tr>
				</table>
			</td>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">thumnail</td>
					</tr>
					<tr>
						<td class="groupTitle">모임명</td>
					</tr>
					<tr>
						<td class="groupIntro">모임 한줄 소개</td>
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
		
		
		<tr>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">thumnail</td>
					</tr>
					<tr>
						<td class="groupTitle">모임명</td>
					</tr>
					<tr>
						<td class="groupIntro">모임 한줄 소개</td>
					</tr>
					<tr>
						<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">
							<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
							<span>10</span>
						</td> 
					</tr>
				</table>
			</td>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">thumnail</td>
					</tr>
					<tr>
						<td class="groupTitle">모임명</td>
					</tr>
					<tr>
						<td class="groupIntro">모임 한줄 소개</td>
					</tr>
					<tr>
						<td style="text-align:right; padding-right:20px; height:80px;paddding-bottom:20px;">
							<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
							<span>10</span>
						</td> 
					</tr>
				</table>
			</td>
			<td>
				<table class="smGroupTable"  style="border:2px solid #ffab00; border-radius:2em;">
					<tr>
						<td class="groupPic">thumnail</td>
					</tr>
					<tr>
						<td class="groupTitle">모임명</td>
					</tr>
					<tr>
						<td class="groupIntro">모임 한줄 소개</td>
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
 </div>
  --%>
 <!-- 4. 페이지네이션-->
	
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item disabled">
	      <a class="page-link">Previous</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#">Next</a>
	    </li>
	  </ul>
	</nav>
 
 
 
 
 
 
<%@include file = "../common/footer.jsp" %>
</body>
</html>