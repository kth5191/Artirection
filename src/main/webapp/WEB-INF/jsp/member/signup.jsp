<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- main.css -->
 <link rel="stylesheet" href="/css/main.css">
 <!-- signup.css -->
 <link rel="stylesheet" href="/css/member/signup.css">

 <!-- jquery -->
 <script src="https://code.jquery.com/jquery-3.7.0.js"></script>

 <!-- bootstrap 5 -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
     integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
     crossorigin="anonymous"></script>
<title>회원가입</title>
</head>
<body>
	<div id="container" class="container-fluid p-5">
        <form action="/member/signup" method="post" onsubmit="return checkNull()">
            <div id="signupTitle">Sign up</div>
            <div id="idBox">
                <div class="inputTitle">아이디</div>
                <div class="inputBox"> 
                    <input type="text" id="id" name="mID">
                	<button type="button" class="idDup ">중복 확인</button>
                </div>
            </div>
            <div id="pwBox">
                <div class="inputTitle">비밀번호</div>
                <input type="password" id="pw" name="pw">
            </div>
            <div id="pw2Box">
                <div class="inputTitle">비밀번호 확인</div>
                <input type="password" id="pw2">
            </div>
            <div class="correctBox" id="correctBox">

            </div>
            <div id="nameBox">
                <div class="inputTitle">이름</div>
                <input type="text" id="name" name="name">
            </div>
            <div id="phoneBox">
                <div class="inputTitle">연락처</div>
                <input type="text" id="phone" name="phone">
            </div>
            <div id="emailBox">
                <div class="inputTitle">이메일</div>
                <input type="text" id="email" name="email">
            </div>
            <div class="correctBox" id="correctBox2"></div>
            <button id="signup" class="colorWhite bColorLightGreen signup">회원가입</button>
        </form>
    </div>
</body>

<script>
		// 아이디 중복 확인 변수
		let idDup = false;

		// 아이디 중복 확인
		$(".idDup").on("click",function(){
			$.ajax({
				url:"/member/idDup",
				data:{
					mID : $("#id").val()
				}
			}).done(function(resp){
				if(resp == "중복됨"){
					alert("아이디가 중복됩니다.");
					idDup = false;
					return;
				}else{
					alert("사용가능한 아이디입니다.");
					idDup=true;
				}
			})
		})



        // 아이디
        let regexId = /^[\w]{8,14}$/; // 8~14자로 구성, 알파벳 대소문자, 숫자, _로만 구성
        $("#id").on("keyup", function(){
            let resultId = regexId.test($("#id").val());
            if(!resultId) {
                $("#id").css("border", "1px solid red");
                $("#correctBox").html("아이디 형식이 맞지 않습니다. (영어 대소문자, 숫자, _로 구성)");
            } else {
                $("#id").css("border", "1px solid forestgreen");
                $("#correctBox").html("");
            }
        });

        // 비밀번호
        let regexPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$/;  // 알파벳 대소문자, 숫자, 특수문자를 한 글자 이상 포함
        $("#pw").on("keyup", function(){
            let resultPw = regexPw.test($("#pw").val());
            if(!resultPw) {
                $("#pw").css("border", "1px solid red");
                $("#correctBox").html("비밀번호 형식이 맞지 않습니다. (알파벳 대소문자, 숫자, 특수문자를 한 글자 이상 포함)");
            } else {
                $("#pw").css("border", "1px solid forestgreen");
                $("#correctBox").html("");
            }
        });

        // 비밀번호 확인
        $("#pw2").on("keyup", function(){
            if($("#pw").val() != $("#pw2").val()) {
                $("#pw2").css("border", "1px solid red");
                $("#correctBox").html("비밀번호가 일치하지 않습니다.");
            } else {
                $("#pw2").css("border", "1px solid forestgreen");
                $("#correctBox").html("");
            }
        });

        // 이름
        let regexName = /^[가-힣]{2,5}$/; // 한글 2~5자로 구성
        $("#name").on("keyup", function(){
            let resultName = regexName.test($("#name").val());
            if(!resultName) {
                $("#name").css("border", "1px solid red");
                $("#correctBox2").html("이름 형식이 맞지 않습니다. (한글 2~5자로 구성)");
            } else {
                $("#name").css("border", "1px solid forestgreen");
                $("#correctBox2").html("");
            }
        });

        // 연락처
        let regexPhone = /^01\d(-?\d{4}){2}$/;
        $("#phone").on("keyup", function(){
            let resultPhone = regexPhone.test($("#phone").val());
            if(!resultPhone) {
                $("#phone").css("border", "1px solid red");
                $("#correctBox2").html("연락처 형식이 맞지 않습니다.");
            } else {
                $("#phone").css("border", "1px solid forestgreen");
                $("#correctBox2").html("");
            }
        });

        // 이메일
        let regexEmail = /^(.+?)@(.+?)com$/;
        $("#email").on("keyup", function(){
            let resultEmail = regexEmail.test($("#email").val());
            if(!resultEmail) {
                $("#email").css("border", "1px solid red");
                $("#correctBox2").html("연락처 형식이 맞지 않습니다.");
            } else {
                $("#email").css("border", "1px solid forestgreen");
                $("#correctBox2").html("");
            }
        });

        // null값 체크
        function checkNull() {
        	
        	if(idDup == true){
        		if($("#id").val() == "") {
                    alert("아이디를 입력하세요.");
                    return false;
                }
                
                if($("#pw").val() == "" || $("#pw2").val() == "") {
                    alert("비밀번호를 입력하세요.");
                    return false;
                }
                
                if($("#name").val() == "") {
                    alert("이름을 입력하세요.");
                    return false;
                }

                if($("#phone").val() == "") {
                    alert("연락처를 입력하세요.");
                    return false;
                }
                
                if($("#email").val() == "") {
                    alert("이메일을 입력하세요.");
                    return false;
                }
        	}else{
        		alert("아이디를 다시 확인해주세요");
        		return false;
        	}
        	
            
        }
    </script>




</html>