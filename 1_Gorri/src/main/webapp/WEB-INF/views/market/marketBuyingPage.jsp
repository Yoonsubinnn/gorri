<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

h2{
	font-weight:bold;
}
h4{
	padding-left: 33%;
}
.product {
 	margin: 0 auto;   /* 상품정보 가운데 오게 함*/	 
    table-layout: fixed; /* 각 셀의 너비를 고정함 */
    border-collapse: collapse; /* 셀 사이의 간격을 없앰 */
}
.product td {
    padding: 10px; /* 각 셀의 안쪽 여백을 10px로 설정함 */
    text-align: center; /* 각 셀의 텍스트를 가운데 정렬함 */
}
.pro_text {
    font-weight: bold;
}
#pro_img {
	border-right: 2px solid gray; 
	padding-right:20px;
}
img {
	width: 150px; heigth: 75px;
	border-radius: 50%;
}
#quantity {
    display: inline-block;  /* 가운데 정렬을 위해 inline-block 속성을 적용합니다. */
    width: 50px;  /* 숫자 영역의 너비를 설정합니다. */
    text-align: center;  /* 숫자를 가운데 정렬합니다. */
}

button {
    display: inline-block;  /* 가운데 정렬을 위해 inline-block 속성을 적용합니다. */
    width: 30px;  /* 버튼의 너비를 설정합니다. */
    height: 30px;  /* 버튼의 높이를 설정합니다. */
    margin: 0 5px;  /* 버튼 사이에 10px 간격을 둡니다. */
    background-color: #ddd;  /* 버튼의 배경색을 설정합니다. */
    border: none;  /* 버튼의 테두리를 없앱니다. */
    cursor: pointer;  /* 마우스 커서를 손가락 모양으로 바꿉니다. */
}
.info_input{
	padding-left: 33%;
}
.info{
	display: block;
	box-sizing: border-box;
    width: 50%;
    height: 40px;
    margin-top: 8px;
    padding: 0 10px;
    border: 1px solid #e5e5e5;
    border-radius: 12px;
    background-color: white;
    font-size: 15px;
    color: black;
}

#refund_policy{
	height: 200px; 
	width: 690px; 
	resize: none;
}
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
</head>
<body>
<%@ include file="marketTop.jsp" %> <!-- header 파일 -->

	<br><br>
	
		<header style="text-align: center;">
		  <div class="header-container">
		    <h2>주문 / 결제</h2>
		    <hr style="width: 25%; margin: 20px auto; border-top : 2px solid black">
		  </div>
		</header>
	
	<br><br>
		
		<table class ="product">
			  <tr class = "pro_text">
				    <td id="pro_img" colspan="2" rowspan="2" >
				    	<img src="../assets/logo-bw.png" alt="상품 사진"/>
				    </td>
				    <td width = 180px; style="padding-left: 50px;">상품정보</td>
				    <td width = 150px;>판매자</td>
				    <td width = 130px;>수량</td>
				    <td width = 130px;>상품 금액</td>
			  </tr>
			  <tr>
				    <td width = 180px; style="padding-left: 50px;">밀가루없는 빵</td>
				    <td width = 150px;>판매자 닉네임</td>
				    <td width = 200px;>
				    	<button onclick="decrement()">-</button>
						<div id="quantity">0</div>	
						<button onclick="increment()">+</button>
				    </td>
				    <td width = 130px;>10,000 키링</td>
			  </tr>
		</table>
		
	<br><br>
		<hr style="width: 80%; margin: 20px auto; border-top : 2px solid black">
  	<br>
  		<h4>배송지 정보</h4>
  		<div class="info_input">
			  <input type="text" id="name" class="info" placeholder="이름 |" style="width: 350px;">
			  <input type="text" id="phone" class="info" placeholder="핸드폰 번호를 입력하세요" style="width: 350px;">
			  <input type="text" id="address" class="info" placeholder="주소 |" style="width: 690px;">
			  <input type="text" id="details" class="info" placeholder="상세 주소를 입력하세요" style="width: 690px;">
			  <input type="text" id="request" class="info" placeholder="배송 요청사항 |" style="width: 690px;">
		</div>
	<br>	
		<hr style="width: 80%; margin: 20px auto; border-top : 2px solid black">
	<br>

		<h4>결제</h4>
			<div class="info_input">
			  <div style="display: flex; align-items: center;">
			    <input type="text" id="name" class="info" placeholder="사용 |" style="width: 350px;">
			    <div style="margin-left: 10px; display: flex; align-items: center;">
			      <span style="margin-right: 10px; color:gray; font-size: 13px;">(보유 키링 : 15000개)</span>
			      <button style="font-size: 12px; min-width: 90px;">키링 충전</button>
			    </div>
			  </div>
			</div>
	<br>
		<hr style="width: 80%; margin: 20px auto; border-top : 2px solid black">
	<br>
		<h4>환불규정</h4>
			<div class="info_input">
			  <textarea id="refund_policy" class="info"></textarea>
			</div>
  	<br><br>
  	
  		<div class="container" style="text-align: center;">
			  <label>
			    <input type="checkbox" id="refund_agreement" name="refund_agreement">
			    주문 내용을 확인 하였으며, 환불 규정에 동의 합니다.
			  </label>
		</div>
  	
  	<br><br>
  		<div style="text-align: center;">
			  <button class="button" style="top-margin:50px;"><b>취소</b></button>
			  <button class="button" style="top-margin:50px;"><b>결제</b></button>
		</div>
  	
  	
<%@ include file="marketFooter.jsp" %> <!-- footer 파일 -->
</body>
<script>
	// 수량 버튼 - + 함수
	function increment() {
		var quantityElement = document.getElementById("quantity");
		var quantity = parseInt(quantityElement.innerText);
		quantityElement.innerText = quantity + 1;
	}

	function decrement() {
		var quantityElement = document.getElementById("quantity");
		var quantity = parseInt(quantityElement.innerText);
			if (quantity > 0) {
				quantityElement.innerText = quantity - 1;
			}
	}

</script>
</html>