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
	<%@include file = "marketTop.jsp" %>
	<div class="container py-4">
		<div class="bd-example-snippet bd-code-snippet">
			<div class="p-5 mb-4 bg-light rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">General Board</h1>
				</div>
			</div>
			<div class="bd-example">
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="80px">글 번호</th>
							<th>글 제목</th>
							<th width="130px">작성자</th>
							<th width="130px">작성일자</th>
							<th width="80px">조회수</th>
	          			</tr>
	          		</thead>
	         		<tbody> 
	          			<c:forEach items="${ list }" var="b">
	          				<tr>
	          					<td>${ b.boardId }</td>
	          					<td>${ b.boardTitle }</td>
	          					<td>${ b.nickName }</td>
	          					<td>${ b.modifyDate }</td>
	          					<td>${ b.boardCount }</td>
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
	
	<script type="text/javascript">
		window.onload=()=> {
			/*행 어디를 클릭하든 글 번호를 추출해서 상세보기 페이지로 넘기기
			selectBoard.bo -->bId, writer, page
			
			1. board접근은 tbody에서. querySelector로
			이건 일치하는것 맨 처음을 가져오는 것임.
			
			*/
// 			console.log(document.querySelector('tbody'));
			const tbody = document.querySelector('tbody')
			//td에 접근하기
			const tds = tbody.querySelectorAll('td');	//쿼리셀렉터는 내가 원하는 범위에서 찾을 수 있다. 그런 장점 가짐
			//찍어보면, 배열로 잘 나옴.
			for (const td of tds) {
				td.addEventListener('click', function(){
					//부모에 가서, 자식의 몇번째인지인 것을 가져오는 것이 편함
					const trTds = this.parentElement.children;
					const boardId = trTds[0].innerText;
					const writer = trTds[2].innerText;
					location.href='${contextPath}/selectBoard.bo?bId=' + boardId + '&Writer=' + writer + '&page=' + ${pi.currentPage};
							//''안에는 띄어쓰기 있음 안되는건 알지? 이거 url만들어주는거니까.
				})
			}
		}
	</script>
	
</body>
</html>