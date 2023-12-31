$(document).ready(function() {
	
	$.ajax({
		url: "/recommendList"
	}).done(function(resp){

       		 var allItems = $(resp).find("perforList");

	        // 랜덤으로 4개의 아이템 선택
	        var randomItems = getRandomItems(allItems, 4);

			randomItems.each(function(){
				
				var seq = $(this).find("seq").text();
				var title = $(this).find("title").text();
				var image = $(this).find("thumbnail").text();
				
				let rItemDiv = $("<div>");
				rItemDiv.addClass("recommendItem col-12 col-md-6 col-xl-3");
				
				let rItemImgDiv = $("<div>");
				rItemImgDiv.addClass("itemImgBox");
				
				let rItemImg = $("<img>");
				rItemImg.addClass("itemImg img-fluid");
				rItemImg.attr({
					"src" : image,
					"data-seq" : seq
				});
				
				rItemImgDiv.append(rItemImg);
				
				let rItemTitleDiv = $("<div>");
				rItemTitleDiv.addClass("itemTitle");
				rItemTitleDiv.html(title);
				
				rItemDiv.append(rItemImgDiv).append(rItemTitleDiv);
				$(".recommendBox").append(rItemDiv);
			})
			
			// 랜덤으로 n개의 아이템을 선택하는 함수
		    function getRandomItems(items, n) {
		        var shuffled = items.toArray().sort(() => 0.5 - Math.random());
		        return $(shuffled.slice(0, n));
		    }
	})
	
	$(document).on("click", ".itemImg", function(){
		var seq = $(this).attr("data-seq");
		location.href = "/board/detail?seq=" + seq;
	})
	
	
//	// 카카오 지도 띄우기
//	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
//    mapOption = { 
//        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
//        level: 5 // 지도의 확대 레벨 
//    }; 
//
//	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//	
//	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
//	if (navigator.geolocation) {
//	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
//	    navigator.geolocation.getCurrentPosition(function(position) {
//	        
//	        var lat = position.coords.latitude, // 위도
//	            lon = position.coords.longitude; // 경도
//	        
//	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
//	            message = '<div style="padding:5px;">내 위치</div>'; // 인포윈도우에 표시될 내용입니다
//	        
//	        // 마커와 인포윈도우를 표시합니다
//	        displayMarker(locPosition, message);
//	            
//	      });
//	    
//	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
//	    
//	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
//	        message = 'geolocation을 사용할수 없어요..'
//	        
//	    displayMarker(locPosition, message);
//	}
//	
//	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
//	function displayMarker(locPosition, message) {
//	    // 마커를 생성합니다
//	    var marker = new kakao.maps.Marker({  
//	        map: map, 
//	        position: locPosition
//	    }); 
//	    
//	    var iwContent = message, // 인포윈도우에 표시할 내용
//	        iwRemoveable = true;
//	
//	    // 인포윈도우를 생성합니다
//	    var infowindow = new kakao.maps.InfoWindow({
//	        content : iwContent,
//	        removable : iwRemoveable
//	    });
//	    
//	    // 인포윈도우를 마커위에 표시합니다 
//	    infowindow.open(map, marker);
//	    
//	    // 지도 중심좌표를 접속위치로 변경합니다
//	    map.setCenter(locPosition);      
//	}    
})