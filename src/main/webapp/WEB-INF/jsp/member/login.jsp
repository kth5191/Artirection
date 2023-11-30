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
     <!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js"></script>
</head>
<body>
	<div id="container" class="container-fluid p-3">
        <div id="loginTitle">Login</div>
        	<div class="rememberId">
                <input type="checkbox" id="idSaveCheck">
                <div>아이디 기억하기</div>
            </div>
            
            <input type="text" id="id" placeholder="아이디" onkeyup="enterKey()">
            <input type="password" id="pw" placeholder="비밀번호" onkeyup="enterKey()">
            <div class="loginFail">
<!--             	로그인 결과 -->
            </div>
            <button id="login" class="colorWhite bColorLightGreen" type="button">
            	로그인
            </button>
            
            <div class="etc">
                <a href="/member/goSignup" id="signup">회원가입</a>
                <div>&nbsp; | &nbsp;</div>
<!--                 <a href="/member/findId" id="findId">아이디 찾기</a> -->
<!--                 <div>&nbsp; | &nbsp;</div> -->
                <a href="/member/gofindPw" id="findPw">비밀번호 찾기</a>
            </div>
    </div>
</body>

<script>

	//엔터키 눌렀을 때 login
	function enterKey(){
		if(window.event.keyCode == 13){
			if($("#id").val() == ""){
				alert("사번을 입력해주세요.");
				return false;
			}
			if($("#pw").val()==""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			$.ajax({
				url:"/member/login",
				data:{
					id:$("#id").val(),
					pw:$("#pw").val()
				}
			}).done(function(resp){
				console.log(resp);
				if(resp == false){
					$(".loginFail").html("로그인에 실패했습니다.");
				}else{
					location.href="/";
				}
			});
		};
	};
	
	
	// 버튼 클릭시 login
	$("#login").on("click",function(){
		
	//		login
		if($("#id").val() == ""){
			alert("사번을 입력해주세요.");
			return false;
		}
		if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		$.ajax({
			url:"/member/login",
			data:{
				id:$("#id").val(),
				pw:$("#pw").val()
			}
		}).done(function(resp){
			console.log(resp);
			if(resp == false){
				$(".loginFail").html("로그인에 실패했습니다.");
			}else{
				location.href="/";
			}
		});
		
	});



	//	아이디 기억 cookie
	$("#id").val(Cookies.get("key"));
	
	if ($("#id").val() !== "") {
        $("#idSaveCheck").attr("checked", true);
    }
		
	$("#idSaveCheck").change(function(){
		if($("#idSaveCheck").is(":checked")){
			console.log($("#id").val());
			Cookies.set("key",$("#id").val(),{expires:7});
		}else{
			Cookies.remove("key");
		}
	});
	
	$("#id").keyup(function () {
        if ($("#idSaveCheck").is(":checked")) {
        	console.log($("#id").val());
            Cookies.set("key", $("#id").val(), { expires: 7 });
        }
    });
</script>


</html>