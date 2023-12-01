<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- kakaomap -->
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65ff7e05f6753f3faa6cb9cbf7667308&libraries=services,clusterer,drawing"></script>


<link rel="stylesheet" href="/css/commons/font.css">
<link rel="stylesheet" href="/css/board/detail.css">
<title>나의 기록</title>
</head>
<body>
	<%@ include file="../commons/header.jsp"%>
	<div class="container">
		<div class="DetailContainer">
		</div>
		
		<div class="wrap1">
            <div class="wrap2">
                <div id="map" class="content border">
		
                </div>
            </div>
        </div>
		
		<!-- 내 리뷰 출력 -->
		<div class="Detail__review">
			<i class="fa-solid fa-user"></i>관람평
		</div>
		<c:forEach var="board" items="${boardList}">
			<div class="reviewListBox col-12">
				<div class="reviewBox col-12">
					<div class="userId row-12">${board.bTitle }</div>
					<div class="contentBox">
						<div class="userContent row-11">${board.bContents }</div>
						<!-- 별점 수만큼 색칠하여 출력 -->
						<div class="star col-5 col-md-2" data-rating="${board.bGrade}">
							<c:forEach var="i" begin="1" end="5">
								<span data-value="${i}"> <c:choose>
										<c:when test="${i <= board.bGrade}">
											<i class="fas fa-star" style="color: gold;"></i>
										</c:when>
										<c:otherwise>
											<i class="far fa-star"></i>
										</c:otherwise>
									</c:choose>
								</span>
							</c:forEach>
						</div>
					</div>
					<div class="userWriteDate">${board.bID }</div>
					<div class="userWriteDate">${board.bWriteDate }</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<%@ include file="../commons/footer.jsp"%>
</body>

<script>
// 디테일 정보 불러오는 jquery

	$(document).ready(function(){
		$.ajax({
			url:"/api/selectByDetail",
			data:{
				seq:${seq}
			}
		}).done(function(resp){
			
			console.log(resp);
		
			
			$(resp).find("perforInfo").each(function(){
				
				
				var tmTitle = $(this).find("title").text();
				var tmStartDate = $(this).find("startDate").text();
				var tmEndDate = $(this).find("endDate").text();
				var realmName = $(this).find("realmName").text();
				var tmPlace = $(this).find("place").text();
				var tmPrice = $(this).find("price").text();
				var tmImgUrl = $(this).find("imgUrl").text();
				var tmUrl = $(this).find("url").text();
				var tmX = $(this).find("gpsX").text();
				var tmY = $(this).find("gpsY").text();
				


			let ImageBox = $("<div class='ImageBox col-6 p-0 m-0'>")
				ImageBox__inner = $("<img class='ImageBox__inner'>");
					ImageBox__inner.attr("src",tmImgUrl);
			ImageBox.append(ImageBox__inner);
			
			
			
			let detailBox = $("<div class='detailBox col-6'>");
			
			
				let title = $("<h2 class='title'>");
					title.html(tmTitle);
					
				
				let infoBox = $("<div class='infoBox row p-0 m-0'>");	
					
					let myBox = $("<div class='myBox col-12'>");
						
						let periodBox = $("<div class='detailInfoBox periodBox row'>");
							let name = $("<div class='name col-3 col-md-2'>");
								let detailText = $("<div class='detailText'>");
									detailText.html("기간");
							name.append(detailText);
							
							let name__icon = $("<div class='col-1 col-md-1'>");
								let name__span = $("<span>");
									name__span.html("|");
							name__icon.append(name__span);	
							
							let period = $("<div class='period col-8 col-md-9'>");
								let period__span = $("<span>");
									period__span.html(tmStartDate + " ~ " +tmEndDate);
							period.append(period__span);
						
						periodBox.append(name).append(name__icon).append(period);
						
						
						let placeBox = $("<div class='detailInfoBox placeBox row'>");
							let phone = $("<div class='phone col-3 col-md-2'>");
								let detailText__phone = $("<div class='detailText'>");
									detailText__phone.html("장소");
							phone.append(detailText__phone)	;
							
							let phone__icon = $("<div class='col-1 col-md-1'>");
								let phone__span = $("<span>");
									phone__span.html("|");
							phone__icon.append(phone__span);
							
							let place = $("<div class='place col-8 col-md-9'>");
								let place__span = $("<span>");
									place__span.html(tmPlace);
							place.append(place__span);
							
						placeBox.append(phone).append(phone__icon).append(place);
						
						
						
						let categoriBox = $("<div class='detailInfoBox categoriBox row'>");
							let email = $("<div class='email col-3 col-md-2'>");
								let detailText__email = $("<div class='detailText'>");
									detailText__email.append("분류");
							email.append(detailText__email);
							
							let email__icon = $("<div class='col-1 col-md-1'>");
								let email__span = $("<span>");
									email__span.html("|");
							email__icon.append(email__span);
							
							let categori = $("<div class='categori col-8 col-md-9'>");
								let categori__span = $("<span>");
									categori__span.html(realmName);
							categori.append(categori__span);
							
						categoriBox.append(email).append(email__icon).append(categori);
						
						
						let priceBox = $("<div class='detailInfoBox priceBox row'>");
							let price__kor = $("<div class='price__kor col-3 col-md-2'>");
								let detailText__price = $("<div class='detailText'>");
									detailText__price.html("요금");
							price__kor.append(detailText__price);
							
							let price__icon = $("<div class='col-1 col-md-1'>");
								let price__span = $("<span>");
									price__span.html("|");
							price__icon.append(price__span);
							
							let price = $("<div class='price col-8 col-md-9'>");
								let price__innerspan = $("<span>");
									price__innerspan.html(tmPrice);
							price.append(price__innerspan);	
							
						priceBox.append(price__kor).append(price__icon).append(price);
						
						
						let officialBox = $("<div class='detailInfoBox officialBox row'>");
							let official__kor = $("<div class='official__kor col-3 col-md-2'>");
								let detailText__official = $("<div class='detailText'>");
									detailText__official.html("공식홈");
							official__kor.append(detailText__official);	
							
							let official__icon = $("<div class='col-1 col-md-1'>");
								let official__span = $("<span>");
									official__span.html("|");
							official__icon.append(official__span);
							
							let official = $("<div class='official col-8 col-md-9'>");
								let barogagi = $("<span>");
									let barogagiATag = $("<a>");
										barogagiATag.attr("href",tmUrl);
									barogagiATag.html("바로가기");
								barogagi.append(barogagiATag);
							official.append(barogagi);
							
						officialBox.append(official__kor).append(official__icon).append(official);
						
						
						
					myBox.append(periodBox).append(placeBox).append(categoriBox).append(priceBox).append(officialBox);
					
				infoBox.append(myBox);
				
			detailBox.append(title).append(infoBox);	
			
			console.log(ImageBox);
			console.log(detailBox);
				
							
			$(".DetailContainer").append(ImageBox).append(detailBox);	
			
			
			
			// 카카오맵 api
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
			    center: new kakao.maps.LatLng(tmY, tmX), // 지도의 중심좌표
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
			
			console.log(tmY + " : " +tmX)
			
			 // 마커가 찍힌 위치의 좌표
			  var markerPosition = new kakao.maps.LatLng(tmY, tmX);

			  // 마커 생성
			  var marker = new kakao.maps.Marker({
			    position: markerPosition
			  });

			  // 마커 지도에 표시
			  marker.setMap(map);

			  // 인포윈도우 내용
			  var infowindowContent = '<div class="markThumbnail" style="text-algin:center; width:200px; height:200px; padding:5px;"> <div><img class="markThumbnail" src='+tmImgUrl+'></div><div>'+tmTitle+'</div></div>';

			  // 인포윈도우 생성
			  var infowindow = new kakao.maps.InfoWindow({
			    content: infowindowContent,
			    removable: true
			  });

			// 마커에 클릭 이벤트 추가
			  kakao.maps.event.addListener(marker, 'click', function() {
			    // 클릭 시 인포윈도우 열기
			    infowindow.open(map, marker);
			  });
			
			
			
								
			})				
								
		})						
			
			
		})
		
		


</script>


</html>