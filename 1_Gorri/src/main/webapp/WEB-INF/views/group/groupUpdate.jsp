<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 개설하기</title>
<style>
.aligncenterhae{text-align:center;}

.tdtwwo{width:155px; height:100px; font-size:20px; font-weight:bold; padding-left:30px}
.groupPic{width:200px; height:200px; background-color:lightgray; margin:auto;}

.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #fff;
  background-color: black;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #ffab00;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
HTML CSSResult Skip Results Iframe
EDIT ON
#groupStatusLabel {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  cursor: pointer;
}

.groupStatus {
  appearance: none;
  position: relative;
  border: max(2px, 0.1em) solid gray;
  border-radius: 1.25em;
  width: 2.25em;
  height: 1.25em;
}

.groupStatus::before {
  content: "";
  position: absolute;
  left: 0;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  transform: scale(0.8);
  background-color: gray;
  transition: left 250ms linear;
}

.groupStatus:checked {
  background-color: #ffab00;
  border-color: #ffab00;
}

.groupStatus:checked::before {
  background-color: white;
  left: 1em;
}

.groupStatus:disabled {
  border-color: lightgray;
  opacity: 0.7;
  cursor: not-allowed;
}

.groupStatus:disabled:before {
  background-color: lightgray;
}

.groupStatus:disabled + span {
  opacity: 0.7;
  cursor: not-allowed;
}

.groupStatus:focus-visible {
  outline-offset: max(2px, 0.1em);
  outline: max(2px, 0.1em) solid #ffab00;
}

.groupStatus:enabled:hover {
  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
}

/* Global CSS */
/* body { */
/*   display: grid; */
/*   justify-content: center; */
/*   align-items: center; */
/*   height: 100vh; */
/* } */

#groupStatusField {
  border: none;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

*,
*::before,
*::after {
  box-sizing: border-box;
}
</style>

</head>

<body>
<%@include file = "../common/top.jsp" %>
<br><br><br>

<div class="aligncenterhae">
<h1>모임 수정하기</h1>
</div>
<br><br><br>

<div class="aligncenterhae" style="height:1000px; width:1000px; border:2px solid #ffab00; margin-left:auto; margin-right:auto; border-radius:2em; padding:90px;">
	<!-- 모임이름, 카테고리 -->
	<table style="text-align:left;">
		<tr>
			<td rowspan="2"><div class="groupPic" style="border-radius:2em;"> 모임 사진</div></td>
			<td class="tdtwwo">모임 이름</td>
			<td colspan="4"><input class="form-control me-2" aria-label="Search" style="width:200px; border: 1px solid gray;"></td>
		</tr>
		
		<tr>
			<td class="tdtwwo">카테고리</td>
			<td>
  				<button type="button" class="btn btn-danger dropdown-toggle selectCate" data-bs-toggle="dropdown" aria-expanded="false"  style="background-color:white; border:1px solid gray; color:black;">
   				 -------
  				</button> &nbsp;
  				<ul class="dropdown-menu">
    				<li><a class="dropdown-item cateSel">예술</a></li>
    				<li><a class="dropdown-item cateSel">운동</a></li>
    				<li><a class="dropdown-item cateSel">음식</a></li>
    				<li><a class="dropdown-item cateSel">여행</a></li>
    				<li><a class="dropdown-item cateSel">창작</a></li>
    				<li><a class="dropdown-item cateSel">자기계발</a></li>
  				</ul>
			</td>
			<td class="tdtwwo" style="padding-left:80px">모집중</td>
			<td style="text-align:left; padding-top:8px;">
				<fieldset id="groupStatusField">
					  <label id="groupStatusLabel">
					    <input role="switch" type="checkbox" class="groupStatus" />					    
					  </label>
			    </fieldset>
			</td>
		</tr>
	</table>
	
	<br><hr>
	
	<table>
		<tr>
			<td colspan="6" class="tdtwwo" style="height:70px; text-align:left;"> 모임장 정보 수정</td>
		</tr>
		
		<tr style="text-align:left;">
			<td class="tdtwwo" style="height:50px; weight:10px; font-size:20px">이름</td>
			<td><input class="form-control me-2" aria-label="Search" placeholder="이름 입력" style="width:170px; border: 1px solid grey;"></td>
			<td class="tdtwwo" style="padding-left:8px; height:50px; weight:10px; font-size:20px">연락처</td>
			<td><input class="form-control me-2" aria-label="Search" placeholder="연락처 입력" style="width:170px; border: 1px solid grey;"></td>
			<td class="tdtwwo"  style="padding-left:8px; height:50px; weight:10px; font-size:20px">이메일</td>
			<td><input class="form-control me-2" aria-label="Search" placeholder="이메일 입력" style="width:170px; border: 1px solid grey;"></td>
		</tr>
		<tr style="height:50px; padding-top:20px;">
			<td colspan="6" class="tdtwwo" style="text-align:left; padding-left:30px;">모임 한줄 소개</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:left; padding-left:30px;">
				<input class="form-control me-2" aria-label="Search" placeholder="모임 한줄 소개" style="width:500px; border: 1px solid black;">
			</td>
		</tr>
	</table>
	
	<br><br>
	<button class="button" style="50px;"><b>수정하기</button>
	
</div>	

<br>
<%@include file = "../common/footer.jsp" %>
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
</body>
</html>