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
<link rel="stylesheet" href="/css/board/detail.css">
<title>나의 기록</title>
</head>
<body>
	<%@ include file="../commons/header.jsp"%>
	<div class="container">
		<div class="contentBox col-6 p-0 m-0">
			<img src="img.png">
		</div>

		<div class="detailBox col-6">
			<h2 class="detail">상세정보</h2>
			<div class="infoBox row p-0 m-0">
				<div class="myBox col-12">
					<div class="idBox row">
						<div class="id col-3 col-md-2">
							<span>제목</span>
						</div>
						<div class="col-1 col-md-1">
							<span>|</span>
						</div>
						<div class="userID col-8 col-md-9">
							<span>Title</span>
						</div>
					</div>
					<div class="nameBox row">
						<div class="name col-3 col-md-2">
							<span>날짜</span>
						</div>
						<div class="col-1 col-md-1">
							<span>|</span>
						</div>
						<div class="userName col-8 col-md-9">
							<span>시작일 - 마감일</span>
						</div>
					</div>
					<div class="phoneBox row">
						<div class="phone col-3 col-md-2">
							<span>장소</span>
						</div>
						<div class="col-1 col-md-1">
							<span>|</span>
						</div>
						<div class="userPhone col-8 col-md-9">
							<span> 어디 </span>
						</div>
					</div>
					<div class="emailBox row">
						<div class="email col-3 col-md-2">
							<span>분류</span>
						</div>
						<div class="col-1 col-md-1">
							<span>|</span>
						</div>
						<div class="userEmail col-8 col-md-9">
							<span>공연</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../commons/footer.jsp"%>
</body>
</html>