<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
   <!-- Required meta tags -->
   <meta charset="UTF-8">
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
	

	/* 썸네일 부분 */
	.bottom{width: 100%; 
		display: flex; 
		justify-content: center;
		align-items : center;
		
		}
	.myhome-menu{
		width: 1030px;
		display: flex; 
		flex-wrap: wrap;
		margin-left: 0 auto; margin-right: 0 auto;
		}
	
	.thum{
		position: relative; dicplay: block; width: 200px; height: 200px; 
		margin-left: 3px; margin-right: 3px; margin-bottom: 6px; overflow : hidden}
	.thumb-img{width:200px; height:200px; margin-bottom: 4px;}
	.thum:hover .thumb-img{transform: scale(1.2, 1.2);}
	
	em{ /* 마우스 올렸을때 나오는 글자부분...*/
		width: 100%; height: 100%;
		display:none; position:absolute;
		left:0; top:0px;
		background: rgba(0, 0, 0, .5); color: #eee;
		text-align: center; padding-top: 45%; font-weight: bold;
		}
	.thum:hover em{display: block;}
	
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<br>


   <!-- Option 2: Separate Popper and Bootstrap JS -->
   <!--
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
   -->
   
   <div class="border-line"> <!-- 겉에 주황색 테두리 -->
   
 		<%@ include file="minihome-nav.jsp" %> <!-- 프로필사진, 닉넴, 자기소개글, 메뉴버튼 -->
	
		
		<!-- 미니홈 이미지 썸네일 부분 -->
		<div class="bottom"> 
			<div class="myhome-menu">	
				<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${contextPath}/resources/assets/pic2.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${contextPath}/resources/assets/pic2.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${contextPath}/resources/assets/pic2.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${contextPath}/resources/assets/pic2.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${contextPath}/resources/assets/pic2.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
					<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${contextPath}/resources/assets/pic2.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${contextPath}/resources/assets/pic2.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${contextPath}/resources/assets/pic2.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${contextPath}/resources/assets/pic2.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
			</div>
			

		
		</div>
		<br>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	

<script>

</script>
</body>
</html>