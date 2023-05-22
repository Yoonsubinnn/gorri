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
				i의 댓글인 것도 받습니다 : irList-->
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
			
		</main>

		<footer class="my-5 pt-5 text-muted text-center text-small"></footer>
	</div>
</body>
</html>