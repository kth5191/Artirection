<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/css/board/write.css">
<title>Document</title>
</head>

<body>
	<%@ include file="../commons/header.jsp"%>
	<div class="boardWrite container">
		<div class="boardWrite_guide">
			<form action="/board/updateProc" method="post" enctype="multipart/form-data">
				<div class="writeTitle">기록하기</div>
				<input type="text" name="bSeq" value="${board.bSeq }" hidden>
				<input type="text" class="inputTitle" name="bTitle" placeholder="제목을 입력하세요" value="${board.bTitle }" readonly>

				<textarea id="summernote" class="content" rows="35" cols="100" placeholder="내용을 입력하세요." name="bContents">${board.bContents }</textarea>
				<!-- 별점 수만큼 색칠하여 출력 -->
				<div id="stars" class="stars col-5 col-md-2" data-rating="${board.bGrade}">
				<input type="text" class="bGrade" name="bGrade" value="0" hidden>
					<c:forEach var="i" begin="1" end="5">
						<span class="star" data-value="${i}"> 
							<c:choose>
								<c:when test="${i <= board.bGrade}">
									<i class="fas fa-star" style="color: gold;"></i>
								</c:when>
								<c:otherwise>
									<i class="far fa-star" style="color: gold;"></i>
								</c:otherwise>
							</c:choose>
						</span>
					</c:forEach>
				</div>
				<div class="writeBox">
					<a href="/member/myRecord"> <input id="return_btn" class="writebtn" type="button" value="목록으로"></a>
					<input id="update_btn" class="writebtn" type="button" value="수정하기">
					<input id="complete_btn" class="writebtn" type="submit" value="수정완료" hidden>
					<input id="cancel_btn" class="writebtn" type="button" value="취소" style="margin-left:10px;" hidden>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../commons/footer.jsp"%>
</body>

<script>
$("#summernote").summernote({
	width: '100%',
    height: null,
    minHeight: 380,
    maxHeight: null,
    focus: true,
    lang: "ko-KR",
    placeholder: '내용을 입력하세요',
    callbacks: {
    	onImageUpload: function (files) {
        	let formData = new FormData();
            for (let i = 0; i < files.length; i++) {
            	formData.append("fileList", files[i]);
            }
            $.ajax({
            	url: "/file/upload",
                method: "post",
                data: formData,
                processData: false, // 인코딩 처리 금지 ( processData, contentType : false = multipart/form-data)
                contentType: false, // 파일 타입 그대로 유지

            }).done(function (resp) {	             	
            	for (let i = 0; i < files.length; i++) {
                	let img = $("<img>");
                    img.attr("type", "file");
                    img.attr("src", resp[i]);
                    $("#summernote").summernote('insertNode', img[0]);
                }

        	})

		},
		onMediaDelete:function($target, editor, $editable){
        	$.ajax({
           		url:"/file/deleteServerFile",
           		data:{"sys_name":$target[0].getAttribute("src").split("/uploads/")[1]}
           	}) 			
    	}	
	}
});

$('#summernote').summernote('disable');
$('#summernote').siblings('.note-editor').find('.note-editable').css('background-color', 'white');

$("#update_btn").on("click", function() {
	$(".inputTitle").attr("readonly", false);
	$('#summernote').summernote('enable');
	
	// 수정완료 버튼과 취소 버튼 나타내기
    $("#complete_btn").removeAttr("hidden");
    $("#cancel_btn").removeAttr("hidden");
    // 목록으로 버튼과 수정하기 버튼 감추기
    $("#return_btn").attr("hidden", true);
    $("#update_btn").attr("hidden", true);
    
    // 별점 조작
    const stars = document.querySelectorAll('.star');
    const starsContainer = document.querySelector('.stars');

    stars.forEach(star => {
      star.addEventListener('mouseover', function() {
        const value = parseInt(star.getAttribute('data-value'));
        highlightStars(value);
      });

      star.addEventListener('click', function() {
        const value = parseInt(star.getAttribute('data-value'));
        starsContainer.setAttribute('data-rating', value);
        $(".bGrade").val(value);
        highlightStars(value);
      });

      star.addEventListener('mouseout', function() {
        const rating = starsContainer.getAttribute('data-rating');
        highlightStars(rating);
      });
    });

    function highlightStars(value) {
      stars.forEach(star => {
        const starValue = parseInt(star.getAttribute('data-value'));
        if (starValue <= value) {
          star.querySelector('i').classList.add('fas');
          star.querySelector('i').classList.remove('far');
        } else {
          star.querySelector('i').classList.remove('fas');
          star.querySelector('i').classList.add('far');
        }
      });
    }
});

$("#cancel_btn").on("click", function() {
	location.reload();
});

</script>

</html>