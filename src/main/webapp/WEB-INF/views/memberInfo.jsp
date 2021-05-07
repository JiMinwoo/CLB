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
		<script type="text/javascript">
			$(function(){
				
				$("#mbUpdate").on("click",function(){
					
					var id = ("#mbid").text();
					
					location.href = "mbUpdateForm?id=" + id;
					
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
			</ul>
		</nav>

		<!-- One -->
		<section id="One" class="wrapper style3">
			<div class="inner">
				<header class="align-center">
					<p style="font-size:25px;">마이페이지</p>
					<br>   
					<h3>회원 정보입니다</h3>
				</header>
			</div>
		</section>
 
		<!-- Two -->
			<div class="inner"> 
				<div style="margin-top:50px;" class="content"> 
					<div style="margin-left:250px; width:350px; height:500px;">
						<table class="mytb">
							<tr>
								<td width="150px;" class="mybutton"><font color="white" size="4">ID</font></td>
								<td><b id="mbid">${mDto.id}</b></td>
							</tr>
							<tr>
								<td width="150px;" class="mybutton"><font color="white" size="4">NAME</font></td>
								<td><b>${mDto.name}</b></td>
							</tr>
							<tr>
								<td width="150px;" class="mybutton"><font color="white" size="4">TEL</font></td>
								<td><b>${mDto.tel}</b></td>
							</tr>
							<tr>
								<td width="150px;" class="mybutton"><font color="white" size="4">EMAIL</font></td>
								<td><b>${mDto.email}</b></td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<button class="mybutton" id="mbUpdate" type="button"><font size="3" style="color:white;">회원정보수정</font></button> 
								</td>
							</tr>
						</table>
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