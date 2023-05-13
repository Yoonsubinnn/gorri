<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	

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
	
	
	/* 검색창 */
	.selectCate{
		width:100%;
	    text-align:left;
	    border-color:lightgrey;
	    }
	    
	.selectCate::after{
	    display:none;
		}
	.write{font-size: 25px; margin-left: 30px;}
	.empty{margin-left: 60px;}
	.icon{color: black;}
	.icon:hover{color: #ffaa00;}
	
</style>

</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<br>
	
	
	<!-- 검색창 -->
	<%@ include file="../common/searchHobby.jsp" %>
	
	
	<%@ include file="../common/category.jsp" %>
	<br><br>
			<!-- 미니홈 이미지 썸네일 부분 -->
		<div class="bottom"> 
			<div class="myhome-menu">	
				<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
								<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
								<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
				<div class="thum" onclick="#">
					<img src="${ contextPath }/resources/assets/pic1.jpg" class="thumb-img">
					<em>제목이나 태그...</em>
				</div>
			</div>
		</div>
		<br>
	

	<%@ include file="../common/footer.jsp" %>
	


</body>
</html>