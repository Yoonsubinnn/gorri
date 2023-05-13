<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
  	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/sign_in.css"></link>
    <title>내 정보 수정 폼</title>
    <style>
    #spanFind{text-align:center; color:black; text-decoration:none;}
    .ubirth{
    	position: relative;
  		height: 40px;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
  		
  		width: 50px;
    }
    .selectCate{
    	width:100%;
    	text-align:left;
    	background-image: none;
    }
    
    .selectCate::after {
	     display:none;
    
	}
    
    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
  	<%@include file="../common/memberTop.jsp" %>
	<div class="card align-middle" style="width:40rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">내 정보 수정</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" onSubmit="logincall();return false">
        
        <label for="uName">&nbsp;&nbsp;이름</label>
        <input type="text" id="uName" class="form-control" placeholder="Your Name" name="userName" required autofocus><BR>
        
        <label for="uid">&nbsp;&nbsp;아이디</label>
        <input type="text" id="uid" class="form-control" placeholder="Your ID" name="userId" required><BR>
        
        <label for="uid">&nbsp;&nbsp;닉네임</label>
        <input type="text" id="uNickName" class="form-control" placeholder="Your Nickname" name="nickName" required><BR>
        

        <label for="upw">&nbsp;&nbsp;비밀번호</label>
        <input type="password" id="upw" class="form-control" name="userPwd" placeholder="Password" required><br>
        <label for="upwc">&nbsp;&nbsp;비밀번호 확인</label>
        <input type="password" id="upwc" class="form-control" placeholder="Password Confirm" required><br>
        
        <label for="upwc">&nbsp;&nbsp;비밀번호 찾기 질문</label><br>
        <button type="button" class="btn btn-danger dropdown-toggle selectCate" data-bs-toggle="dropdown" aria-expanded="false"  style="background-color:white; border:1px solid lightgrey; color:black;">
   				 -------
  		</button> &nbsp;
  		<ul class="dropdown-menu">
    		<li><a class="dropdown-item cateSel">나의 보물 제 1호는?</a></li>
    		<li><a class="dropdown-item cateSel">나와 가장 친한 친구는?</a></li>
    		<li><a class="dropdown-item cateSel">가장 기억에 남는 장소는?</a></li>
  		</ul>
  		<input type="hidden" name="pwdQ">
        <br>
        
        <label for="pwfindA">&nbsp;&nbsp;비밀번호 찾기 답</label>
        <input type="password" id="pwfindA" class="form-control" name="pwdHint" required><br>
                
        <label for="uphone">&nbsp;&nbsp;핸드폰 번호</label>
        <input type="text" id="uphone" class="form-control" name="memberPhone" placeholder="01022223333"><br>
        
        	
        <br>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">정 보 수 정</button><br>
        <a href="${ contextPath }/main.do">
        	<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button">메 인 으 로</button>
      	</a>
      </form>
      
		</div>
	</div>

	<div class="modal">
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
  	<script>
	const label = document.querySelector('.selectCate');
	const options = document.querySelectorAll('.dropdown-item');
	// 클릭한 옵션의 텍스트를 라벨 안에 넣음
	const handleSelect = function(item) {
	  label.innerHTML = item.textContent;
	  label.parentNode.classList.remove('active');
	}
	// 옵션 클릭시 클릭한 옵션을 넘김
	options.forEach(function(option){
	  option.addEventListener('click', function(){handleSelect(option)})
	})
	
  	</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>
</html>