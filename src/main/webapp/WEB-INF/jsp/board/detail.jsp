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

<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="/css/commons/font.css">
<link rel="stylesheet" href="/css/board/detail.css">
<title>나의 기록</title>
</head>
<body>
	<%@ include file="../commons/header.jsp"%>
	<div class="container">
		<div class="DetailContainer">
		</div>
		
		<!-- 내 리뷰 출력 -->
		<c:forEach var="board" items="${boardList}">
			<div class="reviewListBox col-12">
				<div class="reviewBoxTitle">${board.bTitle }</div>
				<div class="reviewBox col-12">
					<div class="userId row-12">${board.bID }</div>
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
								
			})				
								
		})						
			
			
		})


</script>


</html>