<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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



<body>
	<%@ include file="./commons/header.jsp" %>
	<div class="container border">
		<div class="contents" id="title">관람하기</div>
			<div class="contents border" id="map">
		</div>
		<nav class="content__navbar navbar-expand contents">
			<ul class="navbar-nav row">
				<li class="nav__inner col-12 col-md-3"><select id="sido"><option value="">시/도 선택</option></select></li>
				<li class="nav__inner col-12 col-md-3"><select id="sigugun"><option value="">시/군/구 선택</option></select></li>
				<li class="nav__inner col-12 col-md-3">
					<select id="keyword">
						<option value="전체">전체
						<option value="미술">미술
						<option value="연극">연극
						<option value="음악">음악
						<option value="무용">무용
						<option value="국악">국악
					</select>
				</li>
				<li class="nav__inner  col-12 col-md-3" id="search-btn">
					<button class="nav-link text-white" id="search">검색</button>
				</li>
			</ul>
		</nav>

<!-- 		<nav id="small-navbar" class="content__navbar contents d-block d-lg-none"> -->
<!-- 			<ul class="navbar-nav"> -->
<!-- 				<li class="nav__inner border col-12"><select id="sido"><option value="">시/도 선택</option></select></li> -->
<!-- 				<li class="nav__inner border col-12"><select id="sigugun"><option value="">시/군/구 선택</option></select></li> -->
<!-- 				<li class="nav__inner border col-12"> -->
<!-- 					<select id="keyword"> -->
<!-- 						<option value="전체">전체 -->
<!-- 						<option value="미술">미술 -->
<!-- 						<option value="연극">연극 -->
<!-- 						<option value="음악">음악 -->
<!-- 						<option value="무용">무용 -->
<!-- 						<option value="국악">국악 -->
<!-- 					</select> -->
<!-- 				</li> -->
<!-- 				<li class="nav__inner border col-12" id="search-btn"> -->
<!-- 					<button class="text-white" id="search">검색</button> -->
<!-- 				</li> -->
<!-- 			</ul> -->
<!-- 		</nav> -->
		
		<div class="exhibition__content">
			<!-- 전시 내용 -->
		</div>
	</div>
	<div class="upButton">
		<a href="#"><i class="fa fa-angle-up fa-lg"></i></a>
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
			
		console.log(sidoIdx +" : "+sigugunIdx);
		
		if(sidoIdx==-1 || sigugunIdx == -1){
			alert("지역을 선택해주세요.");
			return;
		}
		
		$.ajax({
			url:"/api/selectByArea",
			type:"GET",
			dataType:"text",
			data:{
				sido : hangjungdong.sido[sidoIdx].codeNm, //시
				sigungu : hangjungdong.sigugun[sigugunIdx].codeNm,  //시군구
				keyword : $("#keyword").val()
			}
			
		}).done(function(resp){
			//onsole.log(resp);
			
			removeMarker();
			
			var one;
			var mapData=[];
			$(".search-div").remove();
			for(let temp=0;temp<resp.length;resp++){
				
				// 검색 결과가 없을 때
				var totalCount = $(resp).find("msgBody").find("totalCount").text();
				
				if(totalCount == 0){
					let exhibition__content = $(".exhibition__content");
					let search_div = $("<div class='search-div contents border'>");
						search_div.html("검색 결과가 없습니다.");
					exhibition__content.append(search_div);
				}
				
				$(resp).find("perforList").each(function(){
					
					var tmTitle = $(this).find("title").text();
					var tmX = $(this).find("gpsX").text();
					var tmY = $(this).find("gpsY").text();
					var tmImg = $(this).find("thumbnail").text();
					var tmSeq = $(this).find("seq").text();
					var tmStartDate = $(this).find("startDate").text();
					var tmEndDate = $(this).find("endDate").text();
					var realmName = $(this).find("realmName").text();
					var tmPlace = $(this).find("place").text();
					
					console.log("tmArea : "+$(this).find("area").text());
					
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

			            	// 디테일 페이지로 이동
			                let exhibition__title = $("<a href=/board/detail?seq="+tmSeq+"><div class='exhibition__title'>");
			                    exhibition__title.html(tmTitle);

			                let exhibition__contents = $("<div class='exhibition__contents'>");
			                    exhibition__contents.html(tmStartDate+" ~ "+tmEndDate);
			                
			                let exhibition__location = $("<div class='exhibition__location'>");
			                    let exhibition__area = $("<div class='exhibition__area'>");
			                        exhibition__area.html(realmName);
			                    let exhibition__place = $("<div class='exhibition__place'>");
			                        exhibition__place.html(tmPlace);
			                    let exhibition__seq = $("<div style='display:none'>");
			                    	exhibition__seq.html(tmSeq);
			                
			                exhibition__location.append(exhibition__area).append(exhibition__place).append(exhibition__seq);

			                let exhibition__icon = $("<div class='exhibition__icon'>");
			                    let iconWrite = $("<div class='icon2'>");
			                    let iconWriteATag = $("<a>").attr("href", '/board/write?eSeq=' + tmSeq+"&category="+realmName);
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
	            var iwContent = '<div class="markContent" style="text-algin:center; width:200px; height:230px; padding:5px;"> <div><img class="markThumbnail" src='+data[3]+'></div><div>'+data[2]+'</div></div>',
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
	
	$(document).on("click", ".icon1", function() {
		$(this).toggleClass("bi-heart bi-heart-fill");
		
		let parentSeq = $(this).parent().attr("id");
		let category = $(this).parents(".exhibition__icon").siblings(".exhibition__location").children(".exhibition__area").html();
		console.log(category);
		
		if($(this).attr("class") == 'icon1 bi bi-heart-fill') {
			$.ajax({
				url:"/favorite/insert",
				type:"POST",
				dataType:"text",
				data:{
					seq : parentSeq,
					category : category
				}
				
			}).done(function(resp){})
		} else {
			$.ajax({
				url:"/favorite/delete",
				type:"POST",
				dataType:"text",
				data:{
					seq : parentSeq
				}
				
			}).done(function(resp){})
		}
	});
	

</script>

</html>