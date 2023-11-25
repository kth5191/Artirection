<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

    <!-- main.css -->
    <link rel="stylesheet" href="/css/main.css">
    <!-- login.css -->
    <link rel="stylesheet" href="/css/member/login.css">

    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</head>
</head>
<body>
	<div id="container" class="container-fluid p-3">
        <div id="loginTitle">Login</div>
        <form action="/member/login" method="post">
            <input type="text" id="id" placeholder="아이디">
            <input type="text" id="pw" placeholder="비밀번호">
            <div class="rememberId">
                <input type="checkbox" id="idSaveCheck">
                <div>아이디 기억하기</div>
            </div>
            <button id="login" class="colorWhite bColorLightGreen">로그인</button>
            <div class="etc">
                <a href="/member/goSignup" id="signup">회원가입</a>
                <div>&nbsp; | &nbsp;</div>
<!--                 <a href="/member/findId" id="findId">아이디 찾기</a> -->
<!--                 <div>&nbsp; | &nbsp;</div> -->
                <a href="/member/gofindPw" id="findPw">비밀번호 찾기</a>
            </div>
        </form>
    </div>
</body>

<script>
	//	아이디 기억 cookie
	$("#id").val(Cookies.get('key'));
	if($("#id").val() != ""){
		$("#idSaveCheck").attr("checked",true);
	}
		
	$("#idSaveCheck").change(function(){
		
		if($("#idSaveCheck").is(":checked")){
			Cookies.set("key",$("#id").val(),{expires:7});
		}else{
			Cookies.remove("key");
		}
	});
	
	$("#userID").keyup(function(){
		if($("#idSaveCheck").is(":checked")){
			Cookies.set("key",$("#userId").val(),{expires:7});
		}
	});
</script>


</html>