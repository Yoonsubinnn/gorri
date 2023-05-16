<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
	
	
<!-- 	<h1>footer</h1> -->
	<%@ include file="../common/footer.jsp" %>

</body>
</html>