<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-light">
	<%@include file = "marketTop.jsp" %>
	<div class="container">
		<main>
			<div class="py-5 text-center">
			
			<!-- Inquire인 i를 받습니다.
				또한 그 i의 댓글인 것도 받습니다 : irList-->
				<h2>${ i.productNo }의 문의</h2>
			</div>
			<tr>
				<td>작성자 : ${ i.buyerId } 작성일자 : ${ i.inquirePostDate }</td>
				<br><br><br>
				<td>문의내용:</td>
				<td>${ i.inquireContent }</td>	
			</tr>
			<form action="${ contextPath }/ReplySubmit.market?productNo=${i.productNo}?inquireNo=${ i.inquireNo }" method="post">
			  <div class="input-group mb-3">
			    <input type="text" name="comment" class="form-control" placeholder="comment here" aria-label="comment here" aria-describedby="button-addon2">
			    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Submit</button>
			  </div>
			</form>
			
			
			
<!-- 			<div class="input-group mb-3"> -->
<!-- 			  <input type="text" class="form-control" placeholder="여기에 댓글 작성" aria-label="여기에 댓글 작성" aria-describedby="button-addon2"> -->
<!-- 			  <button class="btn btn-outline-secondary" type="button" id="button-addon2">제출하기</button> -->
<!-- 			</div> -->
		
			
			<%-- 			  onclick="location.href='${contextPath}/Product.market?productId='+${ a.productNo }+'&page='+${pi.currentPage}" --%>
			
			<div>
				<table>
					<tr class="top">
						<th class="no">번호</th>
						<th class="writer">작성자</th>
						<th class="title">댓글내용</th>
						<th class="date">작성일자</th>
					</tr>
					
					<c:forEach items="${ irList }" var="l">
					<tr>
						<td>${ l.replyNo }</td>
						<td>${ l.replyWriter }</td>
						<td>${ l.replyContent }</td>
						<td>${ l.replyCreateDate }</td>
					</tr>
					</c:forEach>			
					
				</table>
			</div>
			
			





<!-- 			<div style="margin-left: 350px; margin-right: 350px;"> -->
<%-- 				<form class="needs-validation" action="${ contextPath }/updateForm.bo" method="POST"> --%>
<%-- 					<input type="hidden" value="${ b.boardId }" name="boardId"> --%>
<%-- 					<input type="hidden" value="${ page }" name="boardId"> --%>
<!-- 					<div class="row g-3"> -->
<!-- 						<div class="col-12"> -->
<!-- 							<label for="boardTitle" class="form-label">TITLE</label> -->
<%-- 							<br>${ b.boardTitle } --%>
<!-- 						</div> -->

<!-- 						<div class="col-12"> -->
<!-- 							<div class="input-group"> -->
<!-- 					          <span class="input-group-text">CONTENT</span> -->
<%-- 					          <textarea class="form-control" rows="10" name="boardContent" style="resize: none;" readonly>${ b.boardContent }</textarea> --%>
<!-- 					        </div> -->
<!-- 						</div> -->
						
<!-- 						<br><br><br><br><br> -->
						
<!-- 						<button class="w-100 btn btn-success btn-lg">UPDATE</button> -->
<!-- 						<button class="w-100 btn btn-secondary btn-lg" type="button" id="deleteModal">DELETE</button> -->
<!-- 						<button class="w-100 btn btn-dark btn-lg" type="button"  -->
<%-- 						onclick="location.href='${contextPath}/list.bo?page='+${page}">GO TO LIST</button> --%>
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
		</main>

		<footer class="my-5 pt-5 text-muted text-center text-small"></footer>
	</div>
</body>
</html>