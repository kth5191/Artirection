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
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <link rel="stylesheet" href="/css/board/write.css">
    <title>Document</title>
</head>

<body>
    <div class="boardWrite container">
        <div class="boardWrite_guide">
            <form action="/board/writeProc" method="post" enctype="multipart/form-data">

                <div class="writeTitle">기록하기</div>

                <input type="text" class="inputTitle" name="bTitle" placeholder="제목을 입력하세요">

                <textarea id="summernote" class="content" rows="35" cols="100" placeholder="내용을 입력하세요." name="bContents"></textarea>

                <div class="fileBox">
                    <input type="button" id="btnAdd" class="writebtn bColorGreen" value="+"> <span>파일 첨부하기</span>
                    <div id="fileContainer"></div>
                </div>

                <div class="writeBox">
                    <a href="">
                        <input class="writebtn" type="button" value="목록으로">
                    </a>
                    <input class="writebtn" type="submit" value="작성하기">
                </div>
            </form>
        </div>
    </div>
</body>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : '내용을 작성하세요',
			height : 600,
			maxHeight : 600
		});
	});
</script>

</html>