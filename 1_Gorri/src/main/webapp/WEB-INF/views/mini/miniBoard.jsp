<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
	
<title>Gorri</title>
<style>
	
	/* 주황 테두리 부분 */
	.border-line{
		border : 2px solid #ffaa00; width : 1200px; 
		margin-top: 100px;
		margin-left:auto; margin-right:auto;
		border-top-left-radius: 30px; border-top-right-radius: 30px; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px;
	}
	
	
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="border-line"> <!-- 겉에 주황색 테두리 -->
   
   		<%@ include file="minihome-nav.jsp" %> <!-- 프로필사진, 닉넴, 자기소개글, 메뉴버튼 -->
	
		
		<div class="bottom">
			여기에 글쓰는 게시판 만들기
		</div>
		
		<table>
			<tr></tr>
		</table>
		
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	
</body>
</html>