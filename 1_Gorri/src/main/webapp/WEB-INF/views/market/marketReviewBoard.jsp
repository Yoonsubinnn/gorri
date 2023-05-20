<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>td:hover{cursor: pointer;}</style>
</head>
<body>




						<!-- 마찬가지로 pi, list 받음 -->
	<%@include file = "marketTop.jsp" %>
	<div class="container py-4">
		<div class="bd-example-snippet bd-code-snippet">
			<div class="p-5 mb-4 bg-light rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">리뷰 게시판</h1>
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
	          				<tr onclick="location.href='${contextPath}/ProductReview.market?productId=${ b.productNo }&reviewNo=${ b.reviewNo }'">
	          					<td>${ b.reviewNo }</td>
	          					<td>${ b.reviewContent }</td>
	          					<td>${ b.buyerId }</td>
	          					<td>${ b.reviewPostDate }</td>
	          				</tr>
	          			</c:forEach>
	          		</tbody>
	        	</table>
	       	</div>
		</div>
        <nav aria-label="Standard pagination example" style="float: right;">
        	<ul class="pagination">
	            <li class="page-item">
	            	<c:url value="${ loc }" var="goBack">
	            		<c:param name="page" value="${ pi.currentPage - 1 }"/>
	            	</c:url>
	            	<a class="page-link" href="${ goBack }" aria-label="Previous">
	            		<span aria-hidden="true">&laquo;</span>
	              	</a>
	            </li>
	            
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	            	<c:url var="goNum" value="${ loc }">
	            		<c:param name="page" value="${ p }"/>
	            	</c:url>
	            	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	            </c:forEach>
	            
	            <li class="page-item">
	            	<c:url value="${ loc }" var="goNext">
	            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
	            	</c:url>
	            	<a class="page-link" href="${ goNext }" aria-label="Next">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </li>
	    	</ul>
        </nav>
		<c:if test="${ !empty loginUser }">
        	<button class="btn btn-outline-success" type="button" onclick="location.href='${ contextPath }/writeBoard.bo'">WRITE BOARD</button>
        </c:if>
	</div>
	
	
</body>
</html>