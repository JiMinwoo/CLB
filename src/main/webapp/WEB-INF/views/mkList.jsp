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
				
				// 책 등록 
				$(document).on("click","#mkInsert",function(){
					
					location.href = "mkInsertForm?pagenum=" + ${pagenum};
			
				})
				
				// < 
				$(document).on("click","#pageDown",function(){

					// 총페이지에서 가장 첫번째
					var pagenum = $(".hello").eq(0).text()-1;

					location.href = "marketList?pagenum="+pagenum; 
				})
				
				// > 
				$(document).on("click","#pageUp",function(){
					
					// 총페이지에서 가장 마지막
					var pagenum = $(".hello").eq(9).text()-1+2;
					
					location.href = "marketList?pagenum="+pagenum;
				})
				
				// 페이지 
				$(document).on("click",".hello",function(){
					
					var pageindex = $(".hello").index(this);
					var pagenum = $(".hello").eq(pageindex).text();
					
					location.href = "marketList?pagenum="+pagenum;
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
					<p style="font-size:25px;">중고장터</p>
					<br>   
					<h3>중고책을 판매합니다.</h3>
					<h3>책 등록 양식을 꼭 지켜주세요!</h3>
				</header>
			</div>
		</section>
 
		<!-- Two -->
		<div class="inner"> 
			<div style="margin-top:50px;" class="content"> 
				<div style="margin:auto; width:1200px; height:950px;" id="plz">
					<div style="text-align:right; width:1120px; margin-bottom:50px;">
						<button class="mybutton" id="mkInsert" type="button"><font size="3" style="color:white;">책등록하기</font></button>
						<button class="mybutton" id="mkInsert" type="button"><font size="3" style="color:white;">양식보러가기</font></button>
					</div>
					<c:forEach items="${marketList}" var="mk">
						<div style="margin:auto; width: 300px; height:450px; float:left;">
							<a href="marketView?mnum=${mk.mnum}&pagenum=${pagenum}">
								<img src="resources/photoUpload/${mk.mimg}" width="220px" height="320px">
							</a>
							<br>
							<b>${mk.mtitle}</b> <br>
							<font style="color:orange">${mk.mwriter}</font>
						</div>
					</c:forEach>
				</div>
				<div style="margin:auto; width:1200px; height:90px; text-align:center;">
					<c:choose>
						<c:when test="${FirstPage eq 1}">
								
						</c:when> 
						<c:otherwise>
							<a href="#" id="pageDown"><img src='resources/images/pre.png' width='13px' height='13px'></a>&nbsp;&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${FirstPage}" end="${LastPage}">
						<c:choose>
							<c:when test="${i eq pagenum}">
								<b><a href="#" class="hello">${i}</a></b>&nbsp;&nbsp;&nbsp;
							</c:when> 
							<c:otherwise>
								<a href="#" class="hello">${i}</a>&nbsp;&nbsp;&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${LastPage eq totalpage}">
							
						</c:when>
						<c:otherwise>
							<a href="#" id="pageUp"><img src='resources/images/next.png' width='13px' height='13px'></a>&nbsp;&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
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