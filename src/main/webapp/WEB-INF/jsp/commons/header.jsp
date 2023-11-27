<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- css, js -->
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/commons/header.css">

    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<body>
	<header class="header bColorLightGreen">
        <div class="header_guide">
            <a href="/">
                <div class="logo colorWhite">Artirection</div>
            </a>
            <nav class="navbar navbar-expand navbar-light colorWhite mb0">
                <div class="container-fluid p-0">
                    <div class="collapse navbar-collapse w-100 g-0 m-0" id="navbarNavDropdown">
                        <ul class="navbar-nav row g-0 w-100">
                            
                            <li class="nav-item col-3 text-center">
                                <a class="nav-link colorWhite" href="/preview"> 관람하기 </a>
                            </li>
                            <li class="nav-item col-3 text-center">
                                <a class="nav-link colorWhite" href="/board/favorite"> 찜한 목록 </a>
                            </li>
                            <c:choose>
                                <c:when test="${loginID == null }">
                                    <li class="nav-item dropdown col-3 text-end p8"><a
                                            class="text-white fontEnglish" href="/member/gologin"> 로그인 </a></li>
                                </c:when>
                                <c:otherwise>
                                	<li class="nav-item col-3 text-center">
                                		<a class="nav-link colorWhite" href="/member/myRecord"> 마이페이지 </a>
                            		</li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
</body>
</html>