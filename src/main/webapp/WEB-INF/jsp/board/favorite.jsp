<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/css/board/favorite.css">

<title>찜한 목록</title>
</head>
<body>

	<%@ include file="../commons/header.jsp"%>
	<div class="container">
		<div class="favoriteBox">
			<h3 class="favoriteBox col-12">찜한 목록</h3>
		</div>

		<div class="exhibition__content">
		</div>
	</div>
	<%@ include file="../commons/footer.jsp"%>
</body>
<script>
$(document).ready(function () {
	  var seqList = ${ seqList }; // JSP로부터 받은 배열

	  seqList.forEach(function (seq, index) {
	  
	    $.ajax({
	      url: "/api/selectByDetail",
	      data: {
	        seq: seq
	      }
	    }).done(function (resp) {
	    	
	    	console.log(resp);

	    	var tmTitle = $(resp).find("title").text();
	    	var tmImgUrl = $(resp).find("imgUrl").text();
	    	var tmSeq = $(resp).find("seq").first().text();
	    	var tmStartDate = $(resp).find("startDate").text();
	    	var tmEndDate = $(resp).find("endDate").text();
	    	var realmName = $(resp).find("realmName").text();
	    	var tmPlace = $(resp).find("place").text();
	
		      let exhibition__content = $(".exhibition__content");
	
		      let search_div = $("<div class='search-div contents border'>");
	
		      let img_div = $("<div class='search__img'>");
		      let img = $("<img class='exhibition__img'> ");
		      img.css({
		    	    'width': '150px',
		    	    'height-color': '180px',
		    	    'margin-right': '10px'
		    	});
		      img.attr("src", tmImgUrl);
		      img_div.append(img);
	
		      let exhibition__inner = $("<div class='exhibition__inner'>");
	
		      // 디테일 페이지로 이동
		      console.log(tmSeq);
		      let exhibition__title = $("<a href=/board/detail?seq=" + tmSeq + "><div class='exhibition__title'>");
		      exhibition__title.html(tmTitle);
	
		      let exhibition__contents = $("<div class='exhibition__contents'>");
		      exhibition__contents.html(tmStartDate + " ~ " + tmEndDate);
	
		      let exhibition__location = $("<div class='exhibition__location'>");
		      let exhibition__area = $("<div class='exhibition__area'>");
		      exhibition__area.html(realmName);
		      let exhibition__place = $("<div class='exhibition__place'>");
		      exhibition__place.html(tmPlace);
		      let exhibition__seq = $("<div>");
		      exhibition__seq.html(tmSeq);
	
		      exhibition__location.append(exhibition__area).append(exhibition__place).append(exhibition__seq);
	
		      let exhibition__icon = $("<div class='exhibition__icon'>");
		      let iconWrite = $("<div class='icon2'>");
		      let iconWriteATag = $("<a href='/board/write'>");
		      let icontWriteIcon = $("<i class='bi bi-pencil-fill'></i>");
		      iconWriteATag.append(icontWriteIcon);
		      iconWrite.append(iconWriteATag);
	
		      let iconHeart = $("<div>");
		      iconHeart.attr("id", tmSeq);
		      let iconHeartIcon = $("<i class='icon1 bi bi-heart'></i>");
		      iconHeart.append(iconHeartIcon);
	
		      exhibition__icon.append(iconWrite).append(iconHeart);
	
		      exhibition__inner.append(exhibition__title).append(exhibition__contents).append(exhibition__location).append(exhibition__icon);
	
		      search_div.append(img_div).append(exhibition__inner);
	
		      exhibition__content.append(search_div);

	    });

	  });
	});
</script>
</html>