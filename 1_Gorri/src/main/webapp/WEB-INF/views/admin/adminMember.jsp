<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<title>Insert title here</title>
<style>
	
	/* 제일 바깥쪽 여백 범위 위한 div */
	.div{
		width : 80%;  min-width: 800px;
		margin-left: auto; margin-right: auto;
		text-align: center;} /* 가운데정렬 */
		
	.center-div{
		display: flex; 
		justify-content: center;
		align-items : top;
		margin-top: 20px;}
		
		
	/* 관리자 메뉴랑 관리자 게시판 넓이 비율.. */
	.admin-menu{width: 15%; margin-right: 30px;}
	.admin-board{width: 900px;}
	
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
		
	
	
	.div1{margin: auto; width: 800px; margin-top: 20px;}
	li{text-align: left;}
	table{border-collapse: collapse; text-align: center;}
	table tr{height: 40px; border-bottom: 2px solid lightgray;}
	.tr-hover:hover{background: rgba(0, 0, 0, 0.05);}
	.top{background-color: rgba(250, 170, 0, 0.3);}
	.sel{width: 80px;}
	.no{width: 80px;}
	.date{width: 200px;}
	.nick{width: 150px;}
	.grade{width: 100px;}
	.yn{width: 80px;}	
	
	.button{margin-left: 600px;}	
	.kick{
		width: 140px; height: 45px;
		font-size: 15px;
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
		margin: 5px;
		}
	.kick:hover {
		background-color: #ffaa00;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		color: #fff;
		transform: translateY(-7px);
		}
	
	
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<br>
	
	<div class="div"> <!-- 제일 바깥쪽 여백 범위 위한 div -->
		<div class="center-div">
			<div class="admin-menu">
			 	<div>
					<img id="profile-img" src="resources/assets/face.png">
				</div>
				<div class="admin-id">관리자아이디</div><br>
				<div>
					<button class="non-click click" onclick="location.href='${ contextPath }/adminDash.ad'"><i class="bi bi-grid-fill"></i> 대시보드</button>
					<button class="non-click" onclick="location.href='${ contextPath }/adminMember.ad'"><i class="bi bi-person-fill"></i> 회원관리</button>
					<button class="non-click" onclick="location.href='${ contextPath }/adminContent.ad'"><i class="bi bi-pencil-square"></i> 게시글 관리</button>
					<button class="non-click" onclick="location.href='${ contextPath }/adminMoim.ad'"><i class="bi bi-people-fill"></i> 모임 관리</button>
					<button class="non-click" onclick="location.href='${ contextPath }/adminMarket.ad'"><i class="bi bi-cart-fill"></i> 마켓 관리</button>
				</div>
			</div>
			
			
			<!-- 회원관리 -->
			<div class="admin-board">
			 	<div class="div1">
					<ul>
						<li>회원 관리</li>
					</ul>
					<table>
						<tr class="top">
							<th class="sel">선택</th>
							<th class="no">번호</th>
							<th class="date">가입일</th>
							<th class="nick">아이디</th>
							<th class="date">비밀번호 찾기 질문</th>
							<th class="date">비밀번호 찾기 답</th>
							<th class="yn">활동</th>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
						<tr class="tr-hover">
							<td><input type="checkbox"></td>
							<td>1234</td>
							<td>2023.00.00</td>
							<td>닉네임1</td>
							<td>내 보물 1호는</td>
							<td>댕댕이</td>
							<td>Y</td>
						</tr>
					</table>
					<br>
					<div class="button"><button class="kick">멤버추방</button></div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>



	<%@ include file="../common/footer.jsp" %>



</body>
</html>