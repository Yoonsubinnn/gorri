<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<title>Insert title here</title>
<style>
	
	#bottom {
		margin:0 auto; margin-top: -30px; border-bottom:2px solid black; width:300px; padding-bottom: 5px;
	}
	
	/* 버튼 css */
	.button {
	  margin-top : -30px;
	  margin-left: 600px;
	  width: 140px;
	  height: 45px;
	  font-family: 'Roboto', sans-serif;
	  font-size: 15px;
	  text-transform: uppercase;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #fff;
	  border: white;
	  border-radius: 45px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  }
	
	.button:hover {
	  background-color: #FFAB00;
	  color: #fff;
	  transform: translateY(-7px);
	}

	/* 제일 바깥쪽 여백 범위 위한 div */
	.div{
		width : 80%;  min-width: 800px;
		margin-left: auto; margin-right: auto;
		text-align: center;} /* 가운데정렬 */
		
	.center-div{
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-top: 20px;}
		
		
	/* 관리자 메뉴랑 관리자 게시판 넓이 비율.. */
	.admin-menu{width: 15%; margin-right: 10px;}
	.admin-board{width: 80%;}
	
	#profile-img{width: 100px; height: 100px;
		border: 3px solid #ffaa00; 
		border-radius: 50%;
		object-fit: cover;
		object-position: center;
		overflow: hidden;
		 margin-bottom: 5px;
		}
	.admin-id{font-weight: bold;}
	
	
	/* 왼쪽 관리자 메뉴관련 */
    .non-click{
	    background-color: rgba(250, 170, 0, 0.3);
	    cursor: pointer;
		padding: 16px;
		width: 100%;
		border: none;
		text-align: left;
		font-size: 16px;
		transition: 0.4s;
		}
    .non-click:hover{
        background-color: rgba(250, 170, 0, 0.5);
        font-weight: bold;
   		}
	.click { /* 클릭해서 선택된 메뉴창 관련 */
		background-color: rgba(250, 170, 0, 0.9);
		font-weight: bold;
		}
		
	
	
	.div1{margin: auto; width: 750px;}
	table{border-collapse: collapse; text-align: center;}
	tr{height: 40px; border-bottom: 2px solid lightgray;}
	.top{background-color: rgba(250, 170, 0, 0.3);}
	.sel{width: 80px;}
	.no{width: 80px;}
	.date{width: 200px;}
	.nick{width: 150px;}
	.grade{width: 100px;}
	.yn{width: 80px;}
	.kick{background-color: black; color: white; border-radius: 5px; margin-left:80%}
	.content{width:500px}
	.category{width:100px;}
	.class{width:100px;}
	.check{border:none;  background-color:white;}
</style>
</head>

<body>
	<%@ include file="../common/top.jsp" %><br>
	
	<div class="div"> <!-- 제일 바깥쪽 여백 범위 위한 div -->
		<div class="center-div" >
			<div class="admin-menu">
			 	<div>
					<img id="profile-img" src="../photo/face.png">
				</div>
				<div class="admin-id">관리자아이디</div><br>
				<div>
					<button class="non-click"><i class="bi bi-grid-fill"></i> 대시보드</button>
					<button class="non-click"><i class="bi bi-person-fill"></i> 회원관리</button>
					<button class="non-click"><i class="bi bi-pencil-square"></i> 게시글 관리</button>
					<button class="non-click"><i class="bi bi-people-fill"></i> 모임 관리</button>
					<button class="non-click"><i class="bi bi-cart-fill"></i> 마켓 관리</button>
				</div>
			</div> <!-- admin-menu 닫기 -->
			<div class="admin-board"> <!-- 모임 관리~버튼까지 div -->
			 	<div class="div1"><br><br>
		 	
				<!-- 멤버 관리 테이블 -->			 	
				<h2 id="bottom">모임 관리하기</h2><br><br>
				<ul>
					<li style="text-align:left;">멤버 관리</li>
				</ul>
				
				<table style="width:750px">
					<tr class="top" style="border-bottom: 2px solid lightgray;">
						<th class="yn">선택</th>
						<th class="no">멤버번호</th>
						<th class="date">가입일</th>
						<th class="nick">닉네임</th>
						<th class="grade">등급</th>
						<th class="form">가입 폼</th>
						<th class="yn">활동</th>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
					<tr style="border-bottom: 2px solid lightgray;">
						<td><input type="checkbox"></td>
						<td>23</td>
						<td>2023-04-05</td>
						<td>뽀리</td>
						<td>멤버</td>
						<td><button class="check"><img src="resources/assets/docum.png" style="width:25px; height:25px"></button></td>
						<td>Y</td>
					</tr>
				</table>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;<button class="button">멤버 추방</button>
				</div>	 	
			</div>
		</div> <!-- center -->
	</div> <!-- 바깥쪽 여백  -->
	<br><br><br>
	
	<%@ include file="../common/footer.jsp" %>


	<script>
		const nonClick = document.querySelectorAll(".non-click");
		
		function handleClick(event) {
		  // div에서 모든 "click" 클래스 제거
		  nonClick.forEach((e) => {
		    e.classList.remove("click");
		  });
		  // 클릭한 div만 "click"클래스 추가
		  event.target.classList.add("click");
		}
		
		nonClick.forEach((e) => {
		  e.addEventListener("click", handleClick);
		});
	</script>

	<script>
		const check = document.getElementsByClassName('check');
		for(const checks of check) {
			checks.addEventListener('click', function() {
				location.href = "${ contextPath}/groupJoin.gr";
			})	
		}
		
	</script>


</body>
</html>