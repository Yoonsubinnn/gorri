<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{border-collapse: collapse; text-align: center;}
	tr{height: 40px; border-bottom: 1px solid lightgray;}
	.top{background-color:  rgba(250, 170, 0, 0.3);}
	.no{width: 80px;}
	.title{width: 500px;}
	.writer{width: 100px;}
	.date{width: 150px;}
	.count{width: 80px;}


   body {background:white;}
   #wrap {width:1000px; height:900px; margin:0 auto; color:gray; text-align:center;}
   #side {float: left; margin-right:200px; width:300px; height:600px; line-height:600px; background:pink; border-radius: 2em;}
   #tung {float:left; width:100px; height:600px; line-height:600px; background:white; } 
   #contents {float: left; width: 600px; height:600px; line-height:600px; background:lightgray; border-radius: 2em;}
   
   
   #left{ width:400px; height:600px;  margin:auto; background-color:pink;}
   #right{ width:500px; height:600px; margin-left:500px; background-color:gray; }
 	#center{ width:100px; height:600px; margin:auto;}
/* 	.container {margin-right:400px;} */
	
/* 	<!-- 버튼 css --> */

.button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


</head>

<body>
<%@include file="../common/top.jsp" %>
<br><br><br><h3 style="text-align:center"><b name="groupName">${ list[0].membershipName }</b></h3>



<hr style="border:solid 10px black; margin:auto; width:30%; border-width:2px;"> <!-- 모임명 중앙 선 -->
<br><br><br>

	<table width="60%" style="margin-top:200px; margin:auto; text-align:center; "> 
	    <tr>
        	<td>
        		<div style="border:3px solid #FFAA00; width:350px; height:600px; border-radius:2em;" > <!-- 1번째 블럭 -->
	        		<div style="border:5px solid #FFAA00; border-radius:8em;  margin:auto; margin-top:30px; width:210px; height:210px; overflow:hidden">
	        			<img src="resources/assets/face.png" style="210px; height:210px;">
	        		</div> <!-- 사진 블럭 -->
	        		<br>
	        		<div>
	        			<p>멤버수(${ list[0].capacity})</p> 
	        		</div>
	        		
	        		<br><p img src="">${ list[0].category }</p> <!-- 설정한 카테고리에 맞는 카테고리와 아이콘 보임 -->
	        		<div 
	        			style="border-radius:2em; margin:0 auto; width:290px; height:100px; 
	        			border:1px solid #FFAA00; padding:35px;">${ list[0].membershipContent }</div> <!-- 모임 소개 글 --> 
       	 			<br><button class="button" style=""><b>모임장 프로필</button>
					
       	 		</div> <!-- 1번째 블럭 끝  -->
       	 	</td> <!-- 1번째 블럭 끝 -->
       	 
       	 
	        <td><div style="background-color:white; width:100px; height:600px;"></div></td> <!-- 2번째 블럭  -->
	        <td> <!-- 3번째 블럭 -->
	        	<div style=" border:3px solid #FFAA00; position:relative; width:500px; height:600px; border-radius: 2em;">
	        		<h4 style="text-align:center;"><br>모임 일정 확인</h4><hr style="width:80%; margin:auto"></p>
	        		<div style="transform:scale(0.6); position:absolute; margin:0 auto;"><a href="calendar.jsp" style="color:inherit; text-decoration: none;"><%@include file="calendar2.jsp" %></a></div>
	        			<a href="${ contextPath }/calendar.gr"><button class="button" id="calUI" style="margin-top:450px;"><b>일정 보기</button></a>
	        			
	        	</div>
	        </td>
	     
	    </tr>
	</table> <!-- 모임 소개, 달력 블럭 끝  -->
	
	
	
	<!-- 게시글  -->
	<br><br><br>
	<div style="position:relative;">
		<table style="margin:0 auto; id="boardList">
			<thead>
				<tr class="top">
					<th class="no">번호</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="date">작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ boardList }" var="b">
					<tr style="border-bottom: 2px solid lightgray;">
						<td>${ b.boardNo }</td>
		       			<td>${ b.title }</td>
		       			<td>${ b.usersId }</td>
		       			<td>${ b.modifyDate }</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	<br><div style="position:absolute; margin: 30px; right:300px; top:1200px"><button onclick="writeBoard()" >작성하기</button></div>
	<br>
	 <nav aria-label="Standard pagination example" style="position:absolute; margin:0 auto;">
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
            		<c:param name="page" value="${ p }"	/>
            	</c:url>
            	 <li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
            </c:forEach>
           
            <li class="page-item">
            	<c:url value=" ${ loc }" var="goNext">
            		<c:param name="page" value=" ${ pi.currentPage + 1 }"/>
            	</c:url>
            	<a class="page-link" href="${ goNext }" aria-label="Next">
            		<span aria-hidden="true">&raquo;</span>
            	</a>
            </li>
    	</ul>
     </nav>
	
	<br><br><br><br><br><br>
	<%@include file="../common/footer.jsp" %>

	
	<script>
		document.getElementById("calUI").addEventListener("click", function() {
			  window.location.href = "calendar.jsp";
			});
		
		//게시글 상세보기 
			window.onload = () => {
				
				const tbody = document.getElementById('boardList').querySelector('tbody'); 
				const tds = tbody.querySelectorAll('td');
				for(const td of tds) {
					td.addEventListener('click', function() { 
						const trTds = this.parentElement.children;
						console.log(trTds);
						const boardNo = trTds[0].innerText; //bId 
// 						console.log(boardId);
						const usersId = trTds[2].innerText; //writer
						const groupNo = ${list[0].membershipNo };
						location.href='${ contextPath}/groupDetailBoard.gr?boardNo=' + boardNo + '&usersId=' + usersId + '&page=' + ${pi.currentPage} + '&groupNo=' + groupNo;
						
				});
				
			}
			
		}
	</script>
	
	
</body>
</html>