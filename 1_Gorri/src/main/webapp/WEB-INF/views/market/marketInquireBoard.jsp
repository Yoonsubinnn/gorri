<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>td:hover{cursor: pointer;}</style>
</head>
<body>
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
							<th width="80px">�� ��ȣ</th>
							<th>�� ����</th>
							<th width="130px">�ۼ���</th>
							<th width="130px">�ۼ�����</th>
							<th width="80px">��ȸ��</th>
	          			</tr>
	          		</thead>
	         		<tbody> 
	          			<tr>
	            			<td>Default</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	          			</tr>
	          			<tr>
	            			<td>Default</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	          			</tr>
	          			<tr>
	            			<td>Default</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	          			</tr>
	          			<tr>
	            			<td>Default</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	          			</tr>
	          			<tr>
	            			<td>Default</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	          			</tr>
	          			<tr>
	            			<td>Default</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	          			</tr>
	          			<tr>
	            			<td>Default</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	            			<td>Cell</td>
	          			</tr>
	          		</tbody>
	        	</table>
	       	</div>
		</div>
        <nav aria-label="Standard pagination example" style="float: right;">
        	<ul class="pagination">
	            <li class="page-item">
	            	<a class="page-link" href="#" aria-label="Previous">
	            		<span aria-hidden="true">&laquo;</span>
	              	</a>
	            </li>
	            <li class="page-item"><a class="page-link" href="#">1</a></li>
	            <li class="page-item"><a class="page-link" href="#">2</a></li>
	            <li class="page-item"><a class="page-link" href="#">3</a></li>
	            <li class="page-item">
	            	<a class="page-link" href="#" aria-label="Next">
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