<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Hielo by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<link rel="stylesheet" href="resources/assets/css/custom.css" /> 
		<script src="resources/assets/js/jquery.min.js"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js"></script>
		<script src="resources/assets/js/skel.min.js"></script>
		<script src="resources/assets/js/util.js"></script>
		<script src="resources/assets/js/main.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
		<script type="text/javascript">
		</script>
	</head> 
	<body class="subpage">

		<!-- Header -->
		<header id="header">
			<div class="logo"><a href="index">CLB <span>Check Library Book</span></a></div>
			<a href="#menu">Menu</a>
		</header>

		<!-- Nav -->
		<nav id="menu">
			<ul class="links">
				<li><a href="memberInfo">MyPage</a></li>
				<li><a class="loginCheck" href="index">Home</a></li>
				<li><a class="loginCheck" href="bbsList?pagenum=1">BBS</a></li>
				<li><a class="loginCheck" href="marketList?pagenum=1">Market</a></li>
				<li><a class="loginCheck" href="bookSearchForm">BookSearch</a></li>
				<li><a class="loginCheck" href="library">Library</a>
			</ul>
		</nav>

		<!-- One -->
		<section id="One" class="wrapper style3">
			<div class="inner">
				<header class="align-center">
					<p style="font-size:25px;">도서 정보</p>
					<br>
					<h3>도서 검색 결과입니다</h3>
				</header>
			</div> 
		</section>
 
		<!-- Two -->
		<div class="inner"> 
			<div style="margin-top:50px; width:1600px; height:1500px;" class="content"> 
				<div style="margin-left:400px; width:400px; height:500px; float:left;">
					<font size="6"><b>${bDto.title}</b></font> <br><br>
					<a href="${bDto.blink}"><img src="${bDto.bimg}" width="240px" height="360px"></a>
				</div>
				<div style="width:800px; height:500px; float:left;">
					<br><br><br><br>
					저자 : ${bDto.writer} <br><br>
					출판사 : ${bDto.publisher} <br><br>
					발행일 : ${bDto.pubdate} <br><br>
					가격 :  ${bDto.price}원 <br><br>
					보유 도서관: 서울 도서관
				</div>
				<div style=" margin-left:350px; width:600px; height:400px; float:left;">
					<h2><b>내용</b></h2>
					<span>
						${bDto.content}
					</span>
				</div>
				<div 
					id="daumRoughmapContainer1538470809288" 
					class="root_daum_roughmap root_daum_roughmap_landing"
					style="margin-left:75px; float:left;">
				</div>
				
			</div>
		</div>
		
		<!-- 다음 지도 -->
		<script charset="UTF-8">
			new daum.roughmap.Lander({
				"timestamp" : "1538470809288",
				"key" : "q9bg",
				"mapWidth" : "450",
				"mapHeight" : "300"
			}).render();
		</script>
		<!-- Footer -->
		<footer id="footer">
		
			<div class="container">
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
				</ul>
			</div>
			
			<div class="copyright">
				&copy; Untitled. All rights reserved.
			</div>
		</footer>
	</body>
</html>