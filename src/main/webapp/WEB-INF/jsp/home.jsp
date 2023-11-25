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
	
	<!-- main.css -->
    <link rel="stylesheet" href="/css/main.css">
    <!-- index.css -->
    <link rel="stylesheet" href="/css/home.css">

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

        <script>
            var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
            var options = { //지도를 생성할 때 필요한 기본 옵션
                center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
                level: 3 //지도의 레벨(확대, 축소 정도)
            };

            var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        </script>

        <div id="monthTitle" class="colorBlack">이 달의 전시</div>
        <div id="monthExhibition" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/assets/Kirby1.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="/assets/Kirby2.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="/assets/Kirby3.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="./commons/footer.jsp" %>
</body>
</html>