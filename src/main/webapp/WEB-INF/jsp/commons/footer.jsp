<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- css, js -->
	<link rel="stylesheet" href="/css/main.css">
	<link rel="stylesheet" href="/css/commons/footer.css">
	
	<!-- bootstrap 5 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</head>
<body>
	<footer class="footer bColorLightGreen p-3">
		<div class="footer_guide">
			<div class="footer_contents">
				<div class="quick conDiv">
					<div class="footer_title colorWhite">QUICK LINKS</div>
					<div class="footer_con">
						<a href="/preview" class="con colorWhite">관람하기</a>
						<a href="/board/favorite" class="con colorWhite">찜한 목록</a>
						<c:choose>
							<c:when test="${loginID == null }">
								<a href="/member/gologin" class="con colorWhite">로그인</a>
							</c:when>
							<c:otherwise>
								<a href="/member/myRecord" class="con colorWhite">마이페이지</a>
								<a href="/member/logout" class="con colorWhite"> 로그아웃 </a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="developers conDiv">
					<div class="footer_title colorWhite">Developers</div>
					<div class="footer_con">
						<div class="con colorWhite">Kim Dong-Hoon</div>
						<div class="con colorWhite">Jang Yu-na</div>
						<div class="con colorWhite">Hwang Min-Kyeong</div>
					</div>
				</div>
				<div class="contact conDiv">
					<div class="footer_title colorWhite">CONTACTS</div>
					<div class="footer_con">
						<div class="con colorWhite">kth5541915@gmail.com</div>
						<div class="con colorWhite">anuygnaj@gmail.com</div>
						<div class="con colorWhite">cypher_1013@naver.com</div>
					</div>
				</div>
			</div>
			<div class="copy colorWhite">COPYRIGHT © Artirector. ALL
				RIGHT RESERVED</div>
		</div>
	</footer>
</body>
</html>