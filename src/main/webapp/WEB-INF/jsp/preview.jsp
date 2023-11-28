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
<!-- 				<a class="nav-link text-white"></a> -->
					<button class="nav-link text-white" id="search">검색</button>
				</li>
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
		
		<div class="exhibition__content">
		
		</div>

<!-- 		<div class="search-div contents border"> -->
<!--             <div class="search__img"> -->
<!--             	<img class="exhibition__img" src="http://www.culture.go.kr/upload/rdf/23/05/show_2023051813454323122.jpg"> -->
<!--             </div> -->
            
<!-- 			<div class="exhibition__inner"> -->
<!--                 <div class="exhibition__title "> -->
<!--                 	[온라인 특별전] 막걸리, 거친 일상의 벗 -->
<!--                 </div> -->
<!--                 <div class="exhibition__contents "> -->
<!--                     20231101~20231204 -->
<!--                 </div> -->
<!--                 <div class="exhibition__location"> -->
<!--                     <div class="exhibition__area"> -->
<!--                         서울 -->
<!--                     </div> -->
<!--                     <div class="exhibition__place"> -->
<!--                         국립민속박물관 -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="exhibition__icon"> -->
<!--                     <div class="icon2"> -->
<!--                         <a href="/board/write"> -->
<!--                         	<i class="bi bi-pencil-fill"></i> -->
<!--                         </a> -->
<!--                     </div> -->
<!--                    <div class="icon1"> -->
<!--                         <i class="bi bi-heart"></i> -->
<!--                    </div> -->
<!--                 </div> -->
<!--             </div> -->
<!-- 		</div> -->
		

	</div>
	 <%@ include file="./commons/footer.jsp" %>
</body>

<script>

	// 시군구, 인덱스 받아옴
	var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido").val());
	var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
		

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.54322842, 126.988345046), // 지도의 중심좌표
	    level: 8 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	
	
	
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	  if (navigator.geolocation) {
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function (position) {
	      var lat = position.coords.latitude, // 위도
	        lon = position.coords.longitude; // 경도

	      var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	        message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

	      // 마커와 인포윈도우를 표시합니다
	      displayMarker(locPosition, message);
	    });
	    
	  } else {
	    // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
	      message = "geolocation을 사용할수 없어요..";

	    displayMarker(locPosition, message);
	  }

	  // 지도에 마커와 인포윈도우를 표시하는 함수입니다
	  function displayMarker(locPosition, message) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	      map: map,
	      position: locPosition,
	    });
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	      iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	      content: iwContent,
	      removable: iwRemoveable,
	    });

	    // 인포윈도우를 마커위에 표시합니다
	    infowindow.open(map, marker);

	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);
	  }
	
	
	
	
	
	
	
	
	
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
			//onsole.log(resp);
			
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
					var tmStartDate = $(this).find("startDate").text();
					var tmEndDate = $(this).find("endDate").text();
					var tmArea = $(this).find("area").text();
					var tmPlace = $(this).find("place").text();
					
					
					one = [tmY,tmX,tmTitle,tmImg,tmSeq];
					
	 				console.log(one);
					mapData.push(one);
					
					
//			 		jquery
					let exhibition__content = $(".exhibition__content");

					let search_div = $("<div class='search-div contents border'>");

			        let img_div = $("<div class='search__img'>");
			            let img = $("<img class='exhibition__img'> ");
			                img.attr("src",tmImg);
			            img_div.append(img);
			            
			            
			            
			            let exhibition__inner = $("<div class='exhibition__inner'>");

			                let exhibition__title = $("<div class='exhibition__title'>");
			                    exhibition__title.html(tmTitle);

			                let exhibition__contents = $("<div class='exhibition__contents'>");
			                    exhibition__contents.html(tmStartDate+" ~ "+tmEndDate);
			                
			                let exhibition__location = $("<div class='exhibition__location'>");
			                    let exhibition__area = $("<div class='exhibition__area'>");
			                        exhibition__area.html("서울");
			                    let exhibition__place = $("<div class='exhibition__place'>");
			                        exhibition__place.html(tmPlace);
			                
			                exhibition__location.append(exhibition__area).append(exhibition__place);

			                let exhibition__icon = $("<div class='exhibition__icon'>");
			                    let iconWrite = $("<div class='icon2'>");
			                        let iconWriteATag = $("<a href='/board/write'>");
			                            let icontWriteIcon = $("<i class='bi bi-pencil-fill'></i>");
			                        iconWriteATag.append(icontWriteIcon);
			                    iconWrite.append(iconWriteATag);
			                    

			                    let iconHeart = $("<div class='icon1'>");
			                        let iconHeartIcon = $("<i class='bi bi-heart'></i>");
			                    iconHeart.append(iconHeartIcon);

			                exhibition__icon.append(iconWrite).append(iconHeart);



			            exhibition__inner.append(exhibition__title).append(exhibition__contents).append(exhibition__location).append(exhibition__icon);

			        search_div.append(img_div).append(exhibition__inner);
					
			        exhibition__content.append(search_div);
					
					
					
					
					
					
					
					
					
					
					
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