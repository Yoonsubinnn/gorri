<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- Bootstrap CSS -->
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




  </style>

</head>
<body>
	<!-- header -->
	<%@ include file="../common/top.jsp" %>
	
	
	<!-- 내가 등록한 상품 표시부분 div -->
	<div>
		<h1 align="center">내가 등록한 상품</h1>
		<!-- 서식 가져오는 것이 나음 -->
	</div>
	
	
	
	
	
	
	
	<!-- thumbnail board -->
	
	<!-- 1. 게시판 부분 -->
	<!-- foreach반복문 사용하여 표시 개수 구현해야 함. 
			추후 구현예정-->
	
	<div class="container w-75" >
	  <div class="row">
	    <div class="col-4">
	      <div class="thumbnail rounded-3" onclick="location.href='${ pageContext.servletContext.contextPath }/MyProduct.market'" >
	        <img src="your-image-url.jpg" alt="이미지" height="200">
	        <div class="caption text-start">
	          <div class="d-flex justify-content-between align-items-center">
	            <h4 class="mb-0">제품 이름</h4>
	            <p class="mb-0 text-right"><small><em>XX분 전</em></small></p>
	          </div>
	          <p>XX원</p>
	          <div class="btn-group" role="group">
	            <span class="badge text-bg-dark">Dark</span>
	            <span class="badge text-bg-dark">Dark</span>
	            <span class="badge text-bg-dark">Dark</span>
	          </div>
	        </div>
	      </div>
	    </div>
	   <!--  <div class="col-4">
	      <div class="thumbnail rounded-3" >
	        <img src="your-image-url.jpg" alt="이미지" height="200">
	        <div class="caption text-start">
	          <div class="d-flex justify-content-between align-items-center">
	            <h4 class="mb-0">제품 이름</h4>
	            <p class="mb-0 text-right"><small><em>XX분 전</em></small></p>
	          </div>
	          <p>XX원</p>
	          <div class="btn-group" role="group">
	            <span class="badge text-bg-dark">Dark</span>
	            <span class="badge text-bg-dark">Dark</span>
	            <span class="badge text-bg-dark">Dark</span>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="col-4">
	      <div class="thumbnail rounded-3" >
	        <img src="your-image-url.jpg" alt="이미지" height="200">
	        <div class="caption text-start">
	          <div class="d-flex justify-content-between align-items-center">
	            <h4 class="mb-0">제품 이름</h4>
	            <p class="mb-0 text-right"><small><em>XX분 전</em></small></p>
	          </div>
	          <p>XX원</p>
	          <div class="btn-group" role="group">
	            <span class="badge text-bg-dark">Dark</span>
	            <span class="badge text-bg-dark">Dark</span>
	            <span class="badge text-bg-dark">Dark</span>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div> -->
	
	
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
	
<!-- 	<h1>market-detail</h1> -->
<%-- 	<%@ include file="market-detail.jsp" %> --%>
<!-- 	<h1>market-detail-my</h1> -->
<%-- 	<%@ include file="market-detail-my.jsp" %> --%>
<!-- 	<h1>market-shop-end</h1> -->
<%-- 	<%@ include file="market-shop-end.jsp" %> --%>
	
<!-- 	<h1>footer</h1> -->
	<%@ include file="../common/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 부트스트랩 사용 위한 스크립트 태그-->
</body>
</html>