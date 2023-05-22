<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-light">
<%-- 	<%@include file = "marketTop.jsp" %> --%>
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<a href="${ contextPath }/home.do"><img class="d-block mx-auto mb-4" src="${ contextPath }/resources/image/spring.png" width="130"></a>
				<h2>BOARD DETAIL</h2>
			</div>

			<div style="margin-left: 350px; margin-right: 350px;">
				<form class="needs-validation" action="${ contextPath }/updateForm.bo" method="POST">
					<input type="hidden" value="${ b.boardId }" name="boardId">
					<input type="hidden" value="${ page }" name="boardId">
					<div class="row g-3">
						<div class="col-12">
							<label for="boardTitle" class="form-label">TITLE</label>
							<br>${ b.boardTitle }
						</div>

						<div class="col-12">
							<div class="input-group">
					          <span class="input-group-text">CONTENT</span>
					          <textarea class="form-control" rows="10" name="boardContent" style="resize: none;" readonly>${ b.boardContent }</textarea>
					        </div>
						</div>
						
						<br><br><br><br><br>
						
						<button class="w-100 btn btn-success btn-lg">UPDATE</button>
						<button class="w-100 btn btn-secondary btn-lg" type="button" id="deleteModal">DELETE</button>
						<button class="w-100 btn btn-dark btn-lg" type="button" 
						onclick="location.href='${contextPath}/list.bo?page='+${page}">GO TO LIST</button>
					</div>
				</form>
			</div>
		</main>

		<footer class="my-5 pt-5 text-muted text-center text-small"></footer>
	</div>
</body>
</html>