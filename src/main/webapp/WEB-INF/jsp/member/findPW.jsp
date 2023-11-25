<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- main.css -->
 <link rel="stylesheet" href="/css/main.css">
 <!-- findPW.css -->
<link rel="stylesheet" href="/css/member/findPW.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>비밀번호 찾기</title>
</head>
<body class="findPw_body">
    <div class="container">
        <div class="findPwBox">
            <div class="findPwBox__inner">
                <div class="findPwBox__logoBox">
                    <div class="logo">
                        <div class="logo__desc-pw">비밀번호 찾기</div>
                        <div class="logo__desc-des">아이디과 인증 코드를 받을 이메일을 입력해주세요.</div>
                    </div>
                </div>
                

	
			<form action="/member/findPW">
                <div class="findPwBox__idBox">
                    <div class="findPwBox__idBox-inner">
                        <div class="idBox">
                            <input class="in-idBox" id="id" type="text" placeholder="  아이디">
                        </div>
                        <div class="authBtnBox">
                            <button class="idDup" type="button">아이디 확인</button>
                        </div>
                    </div>
                </div>

                <div class="findPwBox__emailBox">
                    <div class="findPwBox__email-inner">
                        <div class="emailBox">
                            <input class="in-emailBox" type="text" id="email" placeholder="  이메일" readonly>
                        </div>
                        <div class="authBtnBox">
                            <button class="authBtn" type="button">인증코드 발송</button>
                        </div>
                    </div>
                </div>

                <div class="findPwBox__authBox">
                    <div class="findPwBox_authBox-inner">
                        <div class="auth_codBox">
                            <input class="auth_cod" type="text" placeholder="  인증 코드" readonly>
                        </div>
                        <div class="auth_chkBox">
                            <button class="auth_chk" type="button">확인</button>
                        </div>
                    </div>
                </div>

                 <div class="findPwBox__authChk">
<!--                     <div>인증되었습니다</div> -->
                </div> 

                <div class="findPwBox__line">

                </div>
                
                <div class="findPwBox__changePwBox">
					<input type="password" class="changePwBox" id="pw" name="pw"
						placeholder="변경할 비밀번호">
				</div>

				<div class="findPwBox__changePwChkBox">
					<input type="password" class="changePwChkBox" id="pw_re"
						placeholder="비밀번호 확인">
				</div>

				<div class="findPwBox__pwChk"></div>

				<div class="findPwBox__pwEq"></div>

				<div class="findPwBox__changePwBtnBox">
					<button type="button" class="changePwBtn colorWhite bColorLightGreen">비밀번호 변경</button>
				</div>
            </form>
             </div>
        </div>
    </div>
</body>

<script>

//		아이디 존재하는지 확인 변수
		let idDup = false;

//		아이디 존재하는지 확인
		$(".idDup").on("click",function(){
			
			if($("#id").val()==""){
				alert("아이디를 입력해주세요.");
				return;
			}
			
			
			$.ajax({
				url:"/member/idDup",
				data:{
					mID : $("#id").val()
				}
			}).done(function(resp){
				if(resp == "중복됨"){
					// 아이디가 DB에 존재함
					alert("이메일 인증을 진행해주세요.");
					idDup = true;
					$(".in-emailBox").attr("readonly",false);
					$(".auth_cod").attr("readonly",false);
					
				}else{
					alert("해당하는 아이디가 존재하지 않습니다.");
					idDup=false;
					return;
				}
			})
		})



// 		이메일 regex
		let emailRegex = /^[a-zA-Z0-9\_]+@[a-z]+\.[a-z]{2,3}$/;
		
		$("#email").keyup(function(e){
			console.log($("#email").val());
			result = emailRegex.test($("#email").val());
			
			if(!result){
				$(".findPwBox__emailChk").html("이메일 형식이 올바르지 않습니다.").css({"font-size":"12px","color":"red"});
			}
			if(result){
				$(".findPwBox__emailChk").html("");
			}
		});
		
// 		비밀번호 regex
		let pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,30}$/;
		let result;
		
		$("#pw").keyup(function(){
			console.log($("#pw").val());
			
			console.log("pw_re : "+$("#pw_re").val());
			
			result = pwRegex.test($("#pw").val());
			console.log(result);
			
			
			
			// regex 틀림
			if(!result){
				if($("#pw").val()==""){
					$(".findPwBox__pwChk").html("");
				}else{
					$(".findPwBox__pwChk").html("비밀번호의 형식이 올바르지 않습니다.").css({"font-size":"12px","color":"red"});
					
				}
				
				
			}
			// regex 맞음
			if(result){
				if($("#pw").val()==""){
					$(".findPwBox__pwEq").html("");
				}
				
				$(".findPwBox__pwChk").html("");
//		 		비밀번호와 비밀번호 확인이 일치하는지 확인
				$("#pw_re").keyup(function(){
					if($("#pw").val() != $("#pw_re").val()){
						$(".findPwBox__pwEq").html("비밀번호가 일치하지 않습니다.").css({"font-size":"12px","color":"red"});
					}else{
						$(".findPwBox__pwEq").html("");
					}
				});
				
				$("#pw").keyup(function(){
					if($("#pw").val() != $("#pw_re").val()){
						$(".findPwBox__pwEq").html("비밀번호가 일치하지 않습니다.").css({"font-size":"12px","color":"red"});
					}else{
						$(".findPwBox__pwEq").html("");
					}
				});
			}
		});
		
		let emailAuthFlag = false;
		
// 		이메일 인증 클릭
		$(".authBtn").click(function(){
			
			if($(".in-emailBox").val()==""){
				alert("이메일을 입력해주세요.");
				return;
			}
			
			alert("인증 코드가 발송되었습니다.");
			
			$.ajax({
				url:"/member/email",
				type:"POST",
				data:{
					email : $("#email").val()
				}
			}).done(function(resp){
				console.log(resp);
			})
			
		});
		
// 		이메일 코드 입력하고 확인버튼
		$(".auth_chk").click(function(){
			
			if($(".auth_cod").val()==""){
				alert("인증번호를 입력해주세요.");
				return;
			}
			
			$.ajax({
				url:"/member/emailChk",
				type:"POST",
				data:{
					emailCode: $(".auth_cod").val()
				}
			}).done(function(resp){
				emailAuthFlag = resp;
				
				console.log("이메일 인증 클라이언트 : "+resp);
				
				if(resp == "true"){
					$(".findPwBox__authChk").html("인증되었습니다.").css({"font-size":"12px","color":"green"});
				}else{
					$(".findPwBox__authChk").html("인증에 실패했습니다.").css({"font-size":"12px","color":"red"});
				}
			});
			
		});
		
		// 비밀번호 변경 버튼
		$(".changePwBtn").click(function(){
			
	 		if($("#id").val() == "" || $("#pw").val()=="" || $("#pw_re").val()==""){
				alert("빈칸을 입력해주세요");
				return;
			}
			
			if(!emailAuthFlag){
				alert("이메일 인증을 해주세요");
				return;
			}

			if(result){
				$(".changePwBtn").attr("type","submit");
			}else{
				
				if($("#pw").val() != $("#pw_re").val()){
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				
			}
			
			
			
			
		});
		
		
		
	</script>
</html>