<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Gorri 마켓 메인페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <!-- 임시 스타일입니다. -->
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
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="../common/top.jsp" %>
	
	<!-- 상품검색 조각코드 -->
	<%@ include file="../common/search.jsp" %>
	
	<!-- 카테고리 조각코드 -->
	<%@ include file="../common/category.jsp" %>
	<!-- 카테고리 조각코드 구현해야합니다 -->
	
	<!-- thumbnail board -->
	<!-- 1. 상단 부분 -->

	<!-- 왼쪽에 드롭다운, 가운데에는 버튼 2개 있는 div -->
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
	
	
	
	

	<!-- 2. 게시판 부분 -->
	<!-- foreach반복문 사용하여 표시 개수 구현해야 함. 
			추후 구현예정
			양식도 추후 바꿀예정-->
	<h1>양식 나중에 바꿀거임</h1>
	
	<div class="container w-75" >
	  <div class="row">
	    <div class="col-4" >
	    	<!-- 게시글 아이디 for문에 의해 알아서 만들어지고,
	    		이 게시글이 반복되게 만들어지도록 하자.
	    		
	    		1. 먼저 db에서 전체 게시글 개수를 받아온다
	    		2. 한 페이지에 게시글을 3x4로 구현한다. 따라서 총 게시글을 12로 나누어 한 페이지씩 페이지네이션을 구현.
	    		3. 1번째for문 > 각각 게시글 구역에 
	    		 -->
	      <div class="thumbnail rounded-3" onclick="location.href='${ pageContext.servletContext.contextPath }/ProductDetail.market'">
	      <!-- 로직에 맞게 이동하는 속성 바꿔주세요. 지금은 product.info로 이동합니다. -->
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
	    
	    <!-- 아래는 그냥 반복입니다. 계속 이런식으로 들어가는 것을 표현한 것입니다. -->
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
	
<!-- 
	
<!-- 	<h1>footer</h1> -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>