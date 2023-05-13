<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->

    <title>Gorri</title>
    
    <style>
	
	/* 주황 테두리 부분 */
	.border-line{
		border : 2px solid #ffaa00; width : 1200px; 
		margin-top: 100px;
		margin-left:auto; margin-right:auto;
		border-top-left-radius: 30px; border-top-right-radius: 30px; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px;
	}
	
	
	/* 미니홈-모임탭 */
	.table-border{
		border: 1px solid lightgray; width: 1030px; border-radius: 5px; border-collapse: separate; 
		box-shadow: 0 2px 4px rgba(0,0,0,0.1), 0 2px 6px rgba(0,0,0,0.1);;
		margin: 0 auto;
		transition: all 0.3s cubic-bezier(.25,.8,.25,1);
		}
	.table-border:hover{
	  box-shadow: 0 10px 10px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);}
	.moim-img{width: 200px; height: 200px; padding:10px;} /* 모임 썸네일 */
	.moim-name-td{width: 70%; padding-left: 3%; height: 65px; vertical-align: bottom;}
	.moim-itro-td{padding-left: 3%; vertical-align: top;}
	.moim-name-{font-size: 20px; text-decoration: none; font-weight: bold; color: black;}
	
	
	/* 모임-드롭다운 메뉴 관련 */
	.drop-btn{background: none; color: gray; border: none;} /* 드롭다운 아이콘*/
	.drop-btn:hover{color: black;} /* 드롭다운 아이콘에 마우스 올렸을때*/
	.dropdown-menu{text-align: center; background: white; border: 1px solid lightray;} /* 드옵다운 메뉴창 */
	.dropdown-item{color: black; margin-top: 2px; margin-bottom: 2px;} /* 드롭다운 모임탈퇴*/
	.dropdown-item:hover{background: rgba(255, 170, 0, 0.3); color: dimgray;} /* 드롭다운메뉴 항목에 마우스 올렸을때 */
	.dropdown-menu-icon{font-size: 10px; margin-right: 12px;} /* 드롭다운 메뉴 글씨 옆에 있는 아이콘*/
		
	.moim-img{width: 200px; height: 200px; padding:10px;} /* 모임 썸네일 */
	.moim-itro{margin-top: 10px;} /* 모임소개글 나오는 부분 */
	
	
	/* 탈퇴 확인 */
	.modal-body{text-align: center;}
	.bi-emoji-frown-fill{font-size: 60px; color: #fa0;}
	.footer{
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-top: 30px; margin-bottom: 30px;
		padding-top: 20px;
		border-top: 1px solid lightgray;
		}
	

	
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<br>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    
    
    <div class="border-line"> <!-- 주황 테두리 시작 -->
    
		<%@ include file="minihome-nav.jsp" %> <!-- 프로필사진, 닉넴, 자기소개글, 메뉴버튼 -->
		
			
		<!-- 미니홈-모임탭 -->
		<div class="bottom">
			<table class="table-border">
				<tr>
					<td rowspan="2">
						 <img class="moim-img" src="https://us.123rf.com/450wm/mathier/mathier1905/mathier190500002/134557216-%EC%8D%B8%EB%84%A4%EC%9D%BC-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%97%86%EC%9D%8C-%ED%8F%AC%EB%9F%BC-%EB%B8%94%EB%A1%9C%EA%B7%B8-%EB%B0%8F-%EC%9B%B9%EC%82%AC%EC%9D%B4%ED%8A%B8%EC%9A%A9-%EC%9E%90%EB%A6%AC-%ED%91%9C%EC%8B%9C%EC%9E%90.jpg?ver=6">
					</td>
					<td class="moim-name-td">
						<a class="moim-name-">모임 이름11111</a><!-- 모임이름 -->
					</td>
					<td>	
						<div class="dropdown">
							<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
							<ul class="dropdown-menu">
								<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-x-circle-fill dropdown-menu-icon"></i>모임 탈퇴</button></li>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td class="moim-itro-td" colspan="2">
						<p class="moim-itro">모임에서 설정한 간단 소개 나오는 부분</p>
					</td>
				</tr>
			</table>
		
			<br>
		
			<table class="table-border">
				<tr>
					<td rowspan="2">
						 <img class="moim-img" src="https://us.123rf.com/450wm/mathier/mathier1905/mathier190500002/134557216-%EC%8D%B8%EB%84%A4%EC%9D%BC-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%97%86%EC%9D%8C-%ED%8F%AC%EB%9F%BC-%EB%B8%94%EB%A1%9C%EA%B7%B8-%EB%B0%8F-%EC%9B%B9%EC%82%AC%EC%9D%B4%ED%8A%B8%EC%9A%A9-%EC%9E%90%EB%A6%AC-%ED%91%9C%EC%8B%9C%EC%9E%90.jpg?ver=6">
					</td>
					<td class="moim-name-td">
						<a class="moim-name-">모임 이름11111</a><!-- 모임이름 -->
					</td>
					<td>	
						<div class="dropdown">
							<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
							<ul class="dropdown-menu">
								<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-x-circle-fill dropdown-menu-icon"></i>모임 탈퇴</button></li>
							</ul>
						</div>
					</td>
				</tr>
				<tr> 
					<td class="moim-itro-td" colspan="2">
						<p class="moim-itro">모임에서 설정한 간단 소개 나오는 부분</p>
					</td>
				</tr>
			</table>
		
			<br>
		
			<table class="table-border">
				<tr>
					<td rowspan="2">
						 <img class="moim-img" src="https://us.123rf.com/450wm/mathier/mathier1905/mathier190500002/134557216-%EC%8D%B8%EB%84%A4%EC%9D%BC-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%97%86%EC%9D%8C-%ED%8F%AC%EB%9F%BC-%EB%B8%94%EB%A1%9C%EA%B7%B8-%EB%B0%8F-%EC%9B%B9%EC%82%AC%EC%9D%B4%ED%8A%B8%EC%9A%A9-%EC%9E%90%EB%A6%AC-%ED%91%9C%EC%8B%9C%EC%9E%90.jpg?ver=6">
					</td>
					<td class="moim-name-td">
						<a class="moim-name-">모임 이름11111</a><!-- 모임이름 -->
					</td>
					<td>	
						<div class="dropdown">
							<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
							<ul class="dropdown-menu">
								<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-x-circle-fill dropdown-menu-icon"></i>모임 탈퇴</button></li>
							</ul>
						</div>
					</td>
				</tr>
				<tr> 
					<td class="moim-itro-td" colspan="2">
						<p class="moim-itro">모임에서 설정한 간단 소개 나오는 부분</p>
					</td>
				</tr>
			</table>
		</div> 
		
		<br>
		
	</div> <!-- 주황 테두리 끝 -->
	
	<%@ include file="../common/footer.jsp" %>

    
    <!-- 탈퇴확인 알림창 -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">모임 탈퇴</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<i class="bi bi-emoji-frown-fill"></i><br><br>
				        탈퇴하기 버튼을 누르면 모임에서 즉시 탈퇴 됩니다.<br>
				        정말 탈퇴하시겠습니까?
				</div>
				<div class="footer">
					<div><button type="button" class="button btn-n" data-bs-dismiss="modal">취소</button></div>
			        <div><button type="button" class="button btn-y">탈퇴하기</button></div>
				</div>
			</div>
		</div>
	</div>
    
<script>
</script>
</body>
</html>




    