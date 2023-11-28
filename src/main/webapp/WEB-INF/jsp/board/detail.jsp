<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="/css/commons/font.css">
<link rel="stylesheet" href="/css/board/detail.css">
<title>나의 기록</title>
</head>
<body>
	<%@ include file="../commons/header.jsp"%>
	<div class="container">
		<div class="ImageBox col-6 p-0 m-0">
			<img src="img.png">
		</div>

		<div class="detailBox col-6">
			<h2 class="title">전시회 제목</h2>
			<div class="infoBox row p-0 m-0">
				<div class="myBox col-12">
					<div class="detailInfoBox periodBox row">
						<div class="name col-3 col-md-2">
							<div class="detailText">기간</div>
						</div>
						<div class="col-1 col-md-1">
							<span>|</span>
						</div>
						<div class="period col-8 col-md-9">
							<span>시작일 - 마감일</span>
						</div>
					</div>
					<div class="detailInfoBox placeBox row">
						<div class="phone col-3 col-md-2">
							<div class="detailText">장소</div>
						</div>
						<div class="col-1 col-md-1">
							<span>|</span>
						</div>
						<div class="place col-8 col-md-9">
							<span> 위치 </span>
						</div>
					</div>
					<div class="detailInfoBox categoriBox row">
						<div class="email col-3 col-md-2">
							<div class="detailText">분류</div>
						</div>
						<div class="col-1 col-md-1">
							<span>|</span>
						</div>
						<div class="categori col-8 col-md-9">
							<span>공연</span>
						</div>
					</div>
					<div class="detailInfoBox priceBox row">
						<div class="email col-3 col-md-2">
							<div class="detailText">요금</div>
						</div>
						<div class="col-1 col-md-1">
							<span>|</span>
						</div>
						<div class="price col-8 col-md-9">
							<span>무료</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
	<%@ include file="../commons/footer.jsp"%>
</body>
</html>