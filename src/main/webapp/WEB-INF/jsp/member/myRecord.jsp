<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="/css/member/myRecord.css">
<title>나의 기록</title>
</head>
<body>
	<%@ include file="../commons/header.jsp"%>
	<div class="container">

		<div class="myInfoBox col-12">
			<h2 class="myInfo">내 정보</h2>
		</div>

		<div class="infoBox row p-0 m-0">
			<div class="myBox col-12">
				<div class="idBox row">
					<div class="id col-3 col-md-1">
						<span>아이디</span>
					</div>
					<div class="col-1 col-md-1">
						<span>|</span>
					</div>
					<div class="userID col-8 col-md-10">
						<span>${dto.mID }</span>
					</div>
				</div>
				<div class="nameBox row">
					<div class="name col-3 col-md-1">
						<span>이름</span>
					</div>
					<div class="col-1 col-md-1">
						<span>|</span>
					</div>
					<div class="userName col-8 col-md-10">
						<span>${dto.name }</span>
					</div>
				</div>
				<div class="phoneBox row">
					<div class="phone col-3 col-md-1">
						<span>연락처</span>
					</div>
					<div class="col-1 col-md-1">
						<span>|</span>
					</div>
					<div class="userPhone col-8 col-md-10">
						<span> ${fn:substring(dto.phone,0,3) }- ${fn:substring(dto.phone,3,7) }- ${fn:substring(dto.phone,7,11) } </span>
					</div>
				</div>
				<div class="emailBox row">
					<div class="email col-3 col-md-1">
						<span>이메일</span>
					</div>
					<div class="col-1 col-md-1">
						<span>|</span>
					</div>
					<div class="userEmail col-8 col-md-10">
						<span>${dto.email }</span>
					</div>
				</div>
				<div class="updateBtnBox row">
					<div class="col-9 col-md-10"></div>
					<div class="update col-3 col-md-2">
						<button class="updateBtn p-0">수정하기</button>
					</div>
				</div>

			</div>
		</div>

		<div class="myrecordBox">
			<h3 class="myrecord col-12">나의 기록</h3>
		</div>


		<c:forEach var="board" items="${boardList}">
			<div class="contentBox row p-0 m-0">
				<div class="imgBox col-5 col-sm-3 col-lg-2 p-0">
					<img src="img.png">
				</div>
				<div class="descBox col-7 col-sm-9 col-lg-10 p-0">
					<div class="row h-100">
						<div class="titleBox col-12">
							<div class="title">
								<span><h4 style="margin: 0;">전시회1</h4></span>
							</div>
						</div>
						<div class="placeBox col-12">
							<div class="place">
								<span>전시장소</span>
							</div>
						</div>
						<div class="dateBox col-12">
							<div class="row g-0">
								<div class="date col-7 col-md-10">
									<span>전시날짜</span>
								</div>
								<div class="star col-5 col-md-2" data-rating="${board.bGrade}">
									<c:forEach var="i" begin="1" end="5">
										<span data-value="${i}"> 
										<c:choose>
										<c:when test="${i <= board.bGrade}">
											<i class="fas fa-star" style="color: gold;"></i>
										</c:when>
										<c:otherwise>
											<i class="far fa-star"></i>
										</c:otherwise>
										</c:choose>
										</span>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<%@ include file="../commons/footer.jsp"%>
</body>
</html>