<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 ${ p.productName }의 문의 게시판</title>
<style>td:hover{cursor: pointer;}</style>
</head>
<body>




						<!-- 마찬가지로 pi, list 받음 -->
	<%@include file = "marketTop.jsp" %>
	
	<div class="container py-4">
		<div class="bd-example-snippet bd-code-snippet">
			<div class="p-5 mb-4 bg-light rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">상품 ${ p.productName }의 문의 게시판</h1>
					
					<c:if test="${ !empty loginUser && (loginUser.userId == p.productSellerId) }">
						<h6>게시글 클릭 시 답변 남길 수 있습니다.</h6>
					</c:if>	
					
					
				</div>
			</div>
			<div class="bd-example">
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="80px">글 번호</th>
							<th>내용</th>
							<th width="130px">작성자</th>
							<th width="130px">작성일자</th>
	          			</tr>
	          		</thead>
	         		<tbody> 
	          			<c:forEach items="${ list }" var="b">
	          				<tr onclick="location.href='${contextPath}/ProductInquire.market?productId=${ b.productNo }&inquireNo=${ b.inquireNo }'"> 
	          					<td>${ b.inquireNo }</td>
	          					<td>${ b.inquireContent }</td>
	          					<td>${ b.buyerId }</td>
	          					<td>${ b.inquirePostDate }</td>
	          					<c:if test="${ !empty loginUser && (loginUser.userId == p.productSellerId) }">
	          					<td width="60px ">클릭해서 답변하기</td>
	          					</c:if> 
	          				</tr>
	          			</c:forEach>
	          		</tbody>
	        	</table>
	       	</div>
		</div>
	</div>

	<%@include file = "marketFooter.jsp" %>
	
	
</body>
</html>