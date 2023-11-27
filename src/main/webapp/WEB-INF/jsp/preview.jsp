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
				<li class="nav-item border"><select class="sido"><option value="">시/도 선택</option></select></li>
				<li class="nav-item border"><select class="sigugun"><option value="">시/군/구 선택</option></select></li>
				<li class="nav-item border"><select class="realmName"><option value="">분야 선택</select></li>
				<li class="nav-item border" id="search-btn"><a class="nav-link text-white" href="#">검색</a></li>
			</ul>
		</nav>

		<nav id="small-navbar" class="navbar contents d-block d-lg-none">
			<ul class="navbar-nav">
				<li class="nav-item border"><select class="sido"><option value="">시/도 선택</option></select></li>
				<li class="nav-item border"><select class="sigugun"><option value="">시/군/구 선택</option></select></li>
				<li class="nav-item border"><select class="realmName"><option value="">분야 선택</select></li>
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
<script>
$(".icon1").on("click", function() {
	$(this).toggleClass("bi-heart bi-heart-fill");
});

/*$(document).ready(function() {
	// 카카오 지도 띄우기
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 5 // 지도의 확대 레벨 
		};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">내 위치</div>'; // 인포윈도우에 표시될 내용입니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
			message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map,
			position: locPosition
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content: iwContent,
			removable: iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}
});*/

jQuery(document).ready(function() {
	//sido option 추가
	jQuery.each(hangjungdong.sido, function(idx, code) {
		//append를 이용하여 option 하위에 붙여넣음
		jQuery('.sido').append(fn_option(code.sido, code.codeNm));
	});

	//sido 변경시 시군구 option 추가
	jQuery('.sido').change(function() {
		jQuery('.sigugun').show();
		jQuery('.sigugun').empty();
		jQuery('.sigugun').append(fn_option('', '선택')); //
		jQuery.each(hangjungdong.sigugun, function(idx, code) {
			if (jQuery('.sido > option:selected').val() == code.sido)
				jQuery('.sigugun').append(fn_option(code.sigugun, code.codeNm));
		});

		//세종특별자치시 예외처리
		//옵션값을 읽어 비교
		if (jQuery('.sido option:selected').val() == '36') {
			jQuery('.sigugun').hide();
			//index를 이용해서 selected 속성(attr)추가
			//기본 선택 옵션이 최상위로 index 0을 가짐
			jQuery('.sigugun option:eq(1)').attr('selected', 'selected');
			//trigger를 이용해 change 실행
			jQuery('.sigugun').trigger('change');
		}
	});

	//시군구 변경시 행정동 옵션추가
	jQuery('.sigugun').change(function() {
		//option 제거
		jQuery('.dong').empty();
		jQuery.each(hangjungdong.dong, function(idx, code) {
			if (jQuery('.sido > option:selected').val() == code.sido && jQuery('.sigugun > option:selected').val() == code.sigugun)
				jQuery('.dong').append(fn_option(code.dong, code.codeNm));
		});
		//option의 맨앞에 추가
		jQuery('.dong').prepend(fn_option('', '선택'));
		//option중 선택을 기본으로 선택
		jQuery('.dong option:eq("")').attr('selected', 'selected');

	});

	jQuery('.dong').change(function() {
		var sido = jQuery('.sido option:selected').val();
		var sigugun = jQuery('.sigugun option:selected').val();
		var dong = jQuery('.dong option:selected').val();
		var dongCode = sido + sigugun + dong + '00';
	});
});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.54322842, 126.988345046), // 지도의 중심좌표
		level: 9 // 지도의 확대 레벨
	};

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

$.ajax({
	url: "/api/selectAll",
	type: "GET",
	dataType: "text"
}).done(function(resp) {
	//		console.log(resp);

	var one;
	var mapData = [];
	for (let temp = 0; temp < resp.length; resp++) {

		$(resp).find("perforList").each(function() {

			var tmTitle = $(this).find("title").text();
			var tmX = $(this).find("gpsX").text();
			var tmY = $(this).find("gpsY").text();
			var tmRealmName = $(this).find("realmName").text();
			var tmImg = $(this).find("thumbnail").text();

			if (!mapData.includes(tmRealmName) && tmRealmName.trim() !== "") {
				mapData.push(tmRealmName);

				var option = $("<option>").attr("value", tmRealmName).text(tmRealmName);
				$(".realmName").append(option);
			}

			one = [tmY, tmX, tmTitle, tmRealmName, tmImg];

			console.log(one);
			mapData.push(one);
		})

	}

	console.log(mapData);
	$(".carousel-inner").children().first().addClass("active");


	// 인포윈도우 배열
	var infowindows = [];
	mapData.forEach(function(data) {

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(data[0], data[1], data[2], data[3]), // 마커의 좌표
			map: map // 마커를 표시할 지도 객체
		});

		// 인포 윈도우에 표시할 내용
		var iwContent = '<div class="markContent" style="padding:5px;"> <div><img class="markThumbnail" src=' + data[3] + '></div>' + data[2] + '</div>',
			iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시


		var infowindow = new kakao.maps.InfoWindow({
			position: marker.getPosition(),
			content: iwContent,
			removable: iwRemoveable //true
		});

		// 생성된 인포윈도우를 배열에 담아줍니다.
		infowindows.push(infowindow);

		// 마커에 해당하는 인포윈도우 index를 저장합니다.
		marker.infowindowIdx = infowindows.length - 1;

		kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
			allInfowindowClose();

			// 마커에 해당되는 infowindow를 열어줍니다.
			var infowindow = infowindows[this.infowindowIdx];
			infowindow.open(map, this);
		});

	});

	// 모든 infowindow를 닫아줍니다.
	function allInfowindowClose() {
		for (var i = 0; i < infowindows.length; i++) {
			var infowindow = infowindows[i];
			infowindow.close();
		}
	}

});

function fn_option(code, name) {
	return '<option value="' + code + '">' + name + '</option>';
}
</script>
</html>