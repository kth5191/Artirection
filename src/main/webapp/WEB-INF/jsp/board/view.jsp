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
<style>
.stars {
	font-size: 24px;
}

.fas {
	color: gold; /* 노란색 별로 변경 */
}
</style>
</head>

<body>
	<%@ include file="../commons/header.jsp"%>
	<div class="boardWrite container">
		<div class="boardWrite_guide">
			<form action="/board/writeProc" method="post" enctype="multipart/form-data">
				<div class="writeTitle">기록하기</div>

				<input type="text" class="inputTitle" name="bTitle" placeholder="제목을 입력하세요" value="${board.bTitle }" readonly>

				<textarea id="summernote" class="content" rows="35" cols="100" placeholder="내용을 입력하세요." name="bContents" value="${board.bContents }" readonly></textarea>
				<div class="stars" data-rating="0">
					<input type="text" class="bGrade" name="bGrade" value="0" hidden>
					<span class="star" data-value="1"><i class="far fa-star"></i></span> 
					<span class="star" data-value="2"><i class="far fa-star"></i></span> 
					<span class="star" data-value="3"><i class="far fa-star"></i></span> 
					<span class="star" data-value="4"><i class="far fa-star"></i></span> 
					<span class="star" data-value="5"><i class="far fa-star"></i></span>
				</div>

				<div class="writeBox">
					<a href="/member/myRecord"> <input class="writebtn" type="button" value="목록으로"></a> 
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../commons/footer.jsp"%>
</body>

<script>


</script>

</html>