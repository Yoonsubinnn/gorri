<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mar1{margin-left: 180px; margin-right: 180px;}
.bo1{border-bottom: 1px solid black;}
.tpd{padding-top: 100px;}
.mar2{margin-left: 230px; margin-right: 230px;}
.divgap{gap: 50px 10px;}
.bor{border: 1px solid black;}
.title{font-weight: bold; display: inline-block; width: 200px;}
</style>
</head>
<body>
	<!-- 탑 -->
	<jsp:include page="../common/top.jsp"/>
	
	<!-- 슬라이드 -->
	<div id="myCarousel" class="carousel slide mar" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
			<svg class="bd-placeholder-img" width="100%" height="300px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></svg>
				<div class="container">
					<div class="carousel-caption text-start">
						<h1>Example headline.</h1>
							<p>Some representative placeholder content for the first slide of the carousel.</p>
							<p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
			<svg class="bd-placeholder-img" width="100%" height="300px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
				<div class="container">
					<div class="carousel-caption">
						<h1>Another example headline.</h1>
							<p>Some representative placeholder content for the second slide of the carousel.</p>
							<p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="300px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
				<div class="container">
					<div class="carousel-caption text-end">
						<h1>One more for good measure.</h1>
							<p>Some representative placeholder content for the third slide of this carousel.</p>
							<p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	
	<!-- 취미 -->
	<div>
		<div class="nav-scroller py-1 mb-2 mar1">
			<nav class="nav d-flex justify-left bo1 tpd">
	       		<h3 class="fw-light">다른 사람의 취미를 둘러보세요~</h3>
	        </nav>
		</div>
		
		<div class="container mar1">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach begin="1" end="9">
					<div class="col-xl-2 col-lg-4 col-md-5">
						<a href="#"><img src="resources/assets/flower1.PNG" class="img-fluid"></a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 모임 -->
	<div>
		<div class="nav-scroller py-1 mb-2 mar1">
			<nav class="nav d-flex justify-left bo1 tpd">
	       		<h3 class="fw-light">모임에 참가해 취미를 함께 즐겨보세요~</h3>
	        </nav>
		</div>
	
		<div class="album py-1 bg-light mar1">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:forEach begin="1" end="6">
						<div class="col">
							<div class="card shadow-sm">
							<a href=""><img src="resources/assets/flower1.PNG" class="img-fluid"></a>
								<div class="card-body">
									<div class="sub-title">
										<p class="title">모임명</p>
										<small class="d-inline-block">모집중(4/99)</small>
										<div class="d-flex justify-content-between align-items-center">
											<small class="text-muted">Content</small>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>