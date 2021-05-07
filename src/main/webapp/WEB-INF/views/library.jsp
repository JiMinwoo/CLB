<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
			
				$(document).on("click",".libInfo",function(){
					
					var ln = $(".libInfo").text();
					
					$.ajax({
						type : "GET",
						url : "libInfo",
						dataType : "json",
						data : {"ln" : ln}, 
						error : function() {alert('통신실패..');}, 
						success : function(result){
							
							$("#libInfo").empty();
							
							if(result == null){
								console.log("실패");							
							}
							
							else{
								
								$(result).each(function(index, libInfo){						

									var libname = libInfo.libname;
									var closedate = libInfo.closedate;
									var rental = libInfo.rental;
									var libtel = libInfo.libtel;
									var location = libInfo.location;
									
									$("#libInfo").append("<font size='5'>" + libname + "</font><br><br>");
									$("#libInfo").append("<font size='3'>휴관 : " + closedate + "</font><br><br>");
									$("#libInfo").append("<font size='3'>도서대여 : " + rental + "</font><br><br>");
									$("#libInfo").append("<font size='3'>전화번호 : " + libtel + "</font><br><br>");
									$("#libInfo").append("<font size='3'>위치 : " + location + "</font>");

								})
							}
						}
					})
			
				})
				
			})
					
			function libList(){
				
				var lname = lib.lname.value;
				
				$.ajax({
					type : "GET", 
					url : "libList", 
					dataType : "json", 
					data : {"lname" : lname}, 
					error : function() {alert('통신실패..');}, 
					success : function(result){ 
						
						if(result == null){
							
						}
						
						else{
							
							$("#libList").empty();
							
							$(result).each(function(index, libList){						

								var libname = libList.libname;
								
								$("#libList").append("<a href='#' class='libInfo' style='color:white;'>" + libname + "</a><br>");
								
							})
						}
					}
				})
			}
			
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
		<section id="One" class="wrapper style5">
			<div class="inner">
				<header class="align-center">
					<p style="font-size:25px;">도서관 정보</p> 
					<br>
					<div style="margin-left:165px; width:350px; height:70px;">
						<form id="lib">
							<table class="mytb">
								<tr>
									<td><input type="text" id="lname" name="lname" oninput="libList();" style="width:450px;" placeholder="찾고 싶은 도서관명을 입력하세요"></td>
								</tr>
							</table> 
						</form>
					</div>
					<div style="height:180px;">
						<div style="height:80px; text-align:left;">
							<font size="6">LIBRARY</font><font size="2">&nbsp;&nbsp;(*도서관명을 클릭해주세요)</font>
						</div>
						<div style="height:100px; text-align:left;" id="libList">
							
						</div>
					</div>
					<div style="height:300px;">
						<div style="height:60px; text-align:left;">
							<font size="6">LIBRARY INFO</font>
						</div>
						<div style="height:200px; text-align:left;" id="libInfo">
							
						</div>
					</div>
				</header>
			</div>
		</section>
		
		<!-- One --> 
		<section id="one" class="wrapper style2">
			<div role="tabpanel" class="container" style="margin-right:200px;">
				<h2>서울 도서관 지역별 통계 정보</h2>
				<br>
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home"
						aria-controls="home" role="tab" data-toggle="tab">서울내 지역별 도서관의 도서량</a></li>
					<li role="presentation"><a href="#profile"
						aria-controls="profile" role="tab" data-toggle="tab">서울내 지역별 비도서량</a></li>
					<li role="presentation"><a href="#messages"
						aria-controls="messages" role="tab" data-toggle="tab">서울내 지역별 도서관 좌석수</a></li>
					<li role="presentation"><a href="#settings"
						aria-controls="settings" role="tab" data-toggle="tab">서울내 지역별 도서관 방문자수</a></li>
				</ul> 
	 
				<div class="tab-content" id="style">
					<div role="tabpanel" class="tab-pane in active" id="home">
						<img src="resources/images/book1.png">
					</div>
					<div role="tabpanel" class="tab-pane" id="profile">
						<img src="resources/images/book2.png">
					</div>
					<div role="tabpanel" class="tab-pane" id="messages">
						<img src="resources/images/seat.png">
					</div>
					<div role="tabpanel" class="tab-pane" id="settings">
						<img src="resources/images/vistor.png">
					</div>
				</div>
			</div>
		</section>
		
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