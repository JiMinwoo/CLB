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
		<script src="https://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
			
				$("#mkList").on("click",function(){
					location.href = "marketList?pagenum=" + ${pagenum};
				})
				
			}) 
			
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
					<p style="font-size:25px;">책 등록</p>
					<br>   
					<h3>중고 책을 등록해주세요</h3>
				</header>
			</div>
		</section>
 
		<!-- Two -->
		<div class="inner"> 
			<div style="margin-top:50px;" class="content"> 
				<div style="margin:auto; width:1150px; height:900px;">
					<form action="mkInsert" enctype="multipart/form-data" method="POST">
						<table class="mytb" style="text-align: center;">
							<tr>
								<td class="mybutton" width="100px;">글 제목</td>
								<td><input type="text" name="mtitle" id="mtitle"></td>
							</tr>
							<tr>
								<td class="mybutton" style="vertical-align:middle;">책 설명</td>
								<td>
									<textarea name="mcontent" id="mcontent" style="width: 950px; height: 450px;"></textarea>
								</td>
							</tr>
							<tr>
								<td class="mybutton" style="vertical-align:middle;">대표 이미지</td>
								<td style="text-align:left;"> 
									<input type="file" name="fileName1">
								</td>
							</tr>
							<tr>
								<td align="left">
									<button type="button" class="mybutton" id="mkList" ><font size="3" style="color:white;">목록으로</font></button>
								</td>
								<td align="right">
									<input id="sm" type="submit" value="책 등록">
								</td>  
							</tr> 
						</table>
					</form>
				</div>
			</div>
		</div>
	
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