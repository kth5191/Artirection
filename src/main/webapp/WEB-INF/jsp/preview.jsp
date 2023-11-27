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
<!-- <script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script> -->

<script src="/js/hangjungdong/hangjungdong.js"></script>
</head>
<style>
/*지도 내부 인포윈도우*/
.markContent{
	width:100px;
	border-radius:4px;
	text-algin:center;
}
.markThumbnail{
	width:50px; height:50px;
}
</style>
<body>
	<%@ include file="./commons/header.jsp" %>
	<div class="container border">
		<div class="contents" id="title">관람하기</div>
		<div class="contents border" id="map">
		</div>
		<nav class="navbar navbar-expand contents d-none d-lg-block">
			<ul class="navbar-nav">
				<li class="nav-item border"><select id="sido"><option value="">시/도 선택</option></select></li>
				<li class="nav-item border"><select id="sigugun"><option value="">시/군/구 선택</option></select></li>
				<li class="nav-item border"><select id="museum"><option value="">박물관/미술관 선택</select></li>
				<li class="nav-item border" id="search-btn">
				<a class="nav-link text-white"></a>
					<button id="search">검색</button>
				</li>
			</ul>
		</nav>

<!-- 		<nav id="small-navbar" class="navbar contents d-block d-lg-none"> -->
<!-- 			<ul class="navbar-nav"> -->
<!-- 				<li class="nav-item border"><select id="sido"><option value="">시/도 선택</option></select></li> -->
<!-- 				<li class="nav-item border"><select id="sigugun"><option value="">시/군/구 선택</option></select></li> -->
<!-- 				<li class="nav-item border"><select id="museum"><option value="">박물관/미술관 선택</select></li> -->
<!-- 				<li class="nav-item border" id="search-btn"><a class="nav-link text-white" href="#">검색</a></li> -->
<!-- 			</ul> -->
<!-- 		</nav> -->

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
	 <%@ include file="./commons/footer.jsp" %>
</body>

<script>

	var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido").val());
	var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
		

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.54322842, 126.988345046), // 지도의 중심좌표
	    level: 9 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도의 전시회 정보 저장 배열
	var mapData=[];
	// 마커 배열
	var markers = [];
	
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker(markers) {
		if(markers !== undefined){
			for ( var i = 0; i < markers.length;i++ ) {
//				infowindows.close();
				console.log(i);
				markers[i].setMap(null);
			}
			markers = [];
		}
		
	}
	
	$(document).on("click","#search",function(){
		
		removeMarker(markers);
		var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido").val());
		var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
			
		
		$.ajax({
			url:"/api/selectByArea",
			type:"GET",
			dataType:"text",
			data:{
				sido : hangjungdong.sido[sidoIdx].codeNm, //시
				sigungu : hangjungdong.sigugun[sigugunIdx].codeNm  //시군구
			}
			
		}).done(function(resp){
			// console.log(resp);
			
			removeMarker();
			
			var one;
			var mapData=[];
			for(let temp=0;temp<resp.length;resp++){
				
				$(resp).find("perforList").each(function(){
					
					var tmTitle = $(this).find("title").text();
					var tmX = $(this).find("gpsX").text();
					var tmY = $(this).find("gpsY").text();
					var tmImg = $(this).find("thumbnail").text();
					var tmSeq = $(this).find("seq").text();
					
					
					one = [tmY,tmX,tmTitle,tmImg,tmSeq];
					
	// 				console.log(one);
					mapData.push(one);
				})
				
			}
			
			// console.log(mapData);
	
	
			// 인포윈도우 배열
			var infowindows = [];
			
			
			mapData.forEach(function(data){
				
				
				
	            // 지도에 마커를 생성하고 표시한다
	            var marker = new kakao.maps.Marker({
	                position: new kakao.maps.LatLng(data[0],data[1]), // 마커의 좌표
	                map: map // 마커를 표시할 지도 객체
	            });
	            markers.push(marker);
	            
	            
	            // 인포 윈도우에 표시할 내용
	            var iwContent = '<div class="markContent" style="padding:5px;"> <div><img class="markThumbnail" src='+data[3]+'></div>'+data[2]+'</div>'+'<div>'+data[4]+'</div>',
	            	iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시
	            
	            
	            var infowindow = new kakao.maps.InfoWindow({
	                position : marker.getPosition(), 
	                content : iwContent,
	                removable : iwRemoveable //true
	            });
	            
	            // 생성된 인포윈도우를 배열에 담아줍니다.
	            infowindows.push(infowindow);
	            
	         	// 마커에 해당하는 인포윈도우 index를 저장합니다.
	            marker.infowindowIdx = infowindows.length - 1;
	         
	         	// 하나의 인포윈도우를 클릭하면 나머지는 닫힘
	            kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
	                allInfowindowClose();
	
	                // 마커에 해당되는 infowindow를 열어줍니다.
	                var infowindow = infowindows[this.infowindowIdx];
	                infowindow.open(map, this);
	                
	            });
	         	
			});
			
			console.log("마커스 길이"+markers.length);
			
			
			// 모든 infowindow를 닫아줍니다. - 필요
			function allInfowindowClose() {
			    for(var i=0; i<infowindows.length; i++) {
			        var infowindow = infowindows[i];
			        infowindow.close();
			    }
			}
			
			

			
		});
		
		
	});
	

</script>

</html>