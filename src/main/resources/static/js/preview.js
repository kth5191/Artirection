$(".icon1").on("click", function() {
	$(this).toggleClass("bi-heart bi-heart-fill");
});

$(document).ready(function() {
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
});

jQuery(document).ready(function(){
  //sido option 추가
  jQuery.each(hangjungdong.sido, function(idx, code){
    //append를 이용하여 option 하위에 붙여넣음
    jQuery('#sido').append(fn_option(code.sido, code.codeNm));
  });
 
  //sido 변경시 시군구 option 추가
  jQuery('#sido').change(function(){
    jQuery('#sigugun').show();
    jQuery('#sigugun').empty();
    jQuery('#sigugun').append(fn_option('','선택')); //
    jQuery.each(hangjungdong.sigugun, function(idx, code){
      if(jQuery('#sido > option:selected').val() == code.sido)
        jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
    });
 
    //세종특별자치시 예외처리
    //옵션값을 읽어 비교
    if(jQuery('#sido option:selected').val() == '36'){
      jQuery('#sigugun').hide();
      //index를 이용해서 selected 속성(attr)추가
      //기본 선택 옵션이 최상위로 index 0을 가짐
      jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
      //trigger를 이용해 change 실행
      jQuery('#sigugun').trigger('change');
    }
  });
 
  //시군구 변경시 행정동 옵션추가
  jQuery('#sigugun').change(function(){
    //option 제거
    jQuery('#dong').empty();
    jQuery.each(hangjungdong.dong, function(idx, code){
      if(jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
        jQuery('#dong').append(fn_option(code.dong, code.codeNm));
    });
    //option의 맨앞에 추가
    jQuery('#dong').prepend(fn_option('','선택'));
    //option중 선택을 기본으로 선택
    jQuery('#dong option:eq("")').attr('selected', 'selected');
 
  });
 
  jQuery('#dong').change(function(){
    var sido = jQuery('#sido option:selected').val();
    var sigugun = jQuery('#sigugun option:selected').val();
    var dong = jQuery('#dong option:selected').val();
    var dongCode = sido + sigugun + dong + '00';    
  });
});
 
function fn_option(code, name){
  return '<option value="' + code +'">' + name +'</option>';
}


function fn_option(code, name) {
	return '<option value="' + code + '">' + name + '</option>';
}