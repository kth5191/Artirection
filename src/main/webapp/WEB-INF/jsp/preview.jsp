<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- main.css -->
<link rel="stylesheet" href="/css/main.css">
<!-- preview.css -->
<link rel="stylesheet" href="/css/preview.css">
<!-- bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- kakaomap -->
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65ff7e05f6753f3faa6cb9cbf7667308&libraries=services,clusterer,drawing"></script>
<script src="/js/preview.js"></script>
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
</head>
<body>
	
	<div class="container border">
		<div class="contents" id="title">관람하기</div>
		<div class="contents border" id="map">
		</div>
		<nav class="navbar navbar-expand contents d-none d-lg-block">
			<ul class="navbar-nav">
				<li class="nav-item border"><select id="sido"><option value="">시/도 선택</option></select></li>
				<li class="nav-item border"><select id="sigugun"><option value="">시/군/구 선택</option></select></li>
				<li class="nav-item border"><select id="museum"><option value="">박물관/미술관 선택</select></li>
				<li class="nav-item border" id="search-btn"><a class="nav-link text-white" href="#">검색</a></li>
			</ul>
		</nav>

		<nav id="small-navbar" class="navbar contents d-block d-lg-none">
			<ul class="navbar-nav">
				<li class="nav-item border"><select id="sido"><option value="">시/도 선택</option></select></li>
				<li class="nav-item border"><select id="sigugun"><option value="">시/군/구 선택</option></select></li>
				<li class="nav-item border"><select id="museum"><option value="">박물관/미술관 선택</select></li>
				<li class="nav-item border" id="search-btn"><a class="nav-link text-white" href="#">검색</a></li>
			</ul>
		</nav>

		<div class="search-div contents border">
			<div class=" search-title ">전시회1</div>
			<div class=" search-contents ">전시회 설명 블라블라 어쩌구 저쩌구 여기에 다 쓰시면 됩니다 길어지면 아래로 내려가게끔 width는 850px? 정도면 적당할 것 같네요만약에 더 길어진다면 ...으로 처리하면 좋을 것 같아요</div>
			<div class="search-location">
				<div>
					전시장소 <a href="/board/write"><i class="bi bi-pencil-fill icon2"></i></a> <i class="bi bi-heart icon1"></i>
				</div>
			</div>
		</div>

		<div class="search-div contents border">
			<div class=" search-title ">전시회1</div>
			<div class=" search-contents ">전시회 설명 블라블라 어쩌구 저쩌구 여기에 다 쓰시면 됩니다 길어지면 아래로 내려가게끔 width는 850px? 정도면 적당할 것 같네요만약에 더 길어진다면 ...으로 처리하면 좋을 것 같아요</div>
			<div class="search-location">
				<div>
					전시장소 <a href="/board/write"><i class="bi bi-pencil-fill icon2"></i></a> <i class="bi bi-heart icon1"></i>
				</div>
			</div>
		</div>

		<div class="search-div contents border">
			<div class=" search-title ">전시회1</div>
			<div class=" search-contents ">전시회 설명 블라블라 어쩌구 저쩌구 여기에 다 쓰시면 됩니다 길어지면 아래로 내려가게끔 width는 850px? 정도면 적당할 것 같네요만약에 더 길어진다면 ...으로 처리하면 좋을 것 같아요</div>
			<div class="search-location">
				<div>
					전시장소 <a href="/board/write"><i class="bi bi-pencil-fill icon2"></i></a> <i class="bi bi-heart icon1"></i>
				</div>
			</div>
		</div>
	</div>
</body>
</html>