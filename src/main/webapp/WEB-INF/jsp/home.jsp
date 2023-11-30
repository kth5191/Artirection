<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Artirection</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	
	<!-- css, js -->
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/home.css">
    <script src="/js/home.js"></script>

    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <!-- kakaomap -->
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65ff7e05f6753f3faa6cb9cbf7667308&libraries=services,clusterer,drawing"></script>
</head>
<body>
	<%@ include file="./commons/header.jsp" %>

	<div class="container">
        <div class="wrap1">
            <div class="wrap2">
                <div id="map" class="content">
		
                </div>
            </div>
        </div>

        <div id="recommendTitle" class="colorBlack">이런 전시를 좋아하실 것 같아요!</div>
        <div class="recommendBox row">
        </div>
    </div>
    
    <%@ include file="./commons/footer.jsp" %>
</body>

<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.54322842, 126.988345046), // 지도의 중심좌표
	    level: 9 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
	 map.setZoomable(false); 
	
	
	$.ajax({
		url:"/api/selectAll",
		type:"GET",
		dataType:"text"
	}).done(function(resp){
//			console.log(resp);
		
		var one;
		var mapData=[];
		for(let temp=0;temp<resp.length;resp++){
			
			$(resp).find("perforList").each(function(){
				
				var tmTitle = $(this).find("title").text();
				var tmX = $(this).find("gpsX").text();
				var tmY = $(this).find("gpsY").text();
				var tmImg = $(this).find("thumbnail").text();
				
//					console.log(tmTitle);
				
				one = [tmY,tmX,tmTitle,tmImg];
				
				var imgDiv = $("<div class='carousel-item'>");
                var img = $("<img src='' class='d-block w-100'>");
                img.attr("src", tmImg);
                
                imgDiv.append(img);
                
                // $(".carousel-inner").append(imgDiv);
				
				// console.log(one);
				mapData.push(one);
			})
			
		}
		
		// console.log(mapData);
		// $(".carousel-inner").children().first().addClass("active");


		// 인포윈도우 배열
		var infowindows = [];
		mapData.forEach(function(data){
			
            // 지도에 마커를 생성하고 표시한다
            var marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(data[0], data[1],data[2],data[3]), // 마커의 좌표
                map: map // 마커를 표시할 지도 객체
            });
            
            // 인포 윈도우에 표시할 내용
            var iwContent = '<div class="markContent" style="padding:5px;"> <div><img class="markThumbnail" src='+data[3]+'></div>'+data[2]+'</div>',
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
         
            kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
                allInfowindowClose();

                // 마커에 해당되는 infowindow를 열어줍니다.
                var infowindow = infowindows[this.infowindowIdx];
                infowindow.open(map, this);
            });
         
		});
		
		// 모든 infowindow를 닫아줍니다.
		function allInfowindowClose() {
		    for(var i=0; i<infowindows.length; i++) {
		        var infowindow = infowindows[i];
		        infowindow.close();
		    }
		}
		

		
	});

</script>

</html>