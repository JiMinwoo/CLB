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
		<script type="text/javascript">
		
			function bookSearch(){
				
				var bname = bn.book.value;
				
				$.ajax({
					type : "GET", 
					url : "bookSearch", 
					dataType : "json", 
					data : {"bname" : bname}, 
					error : function() {alert('통신실패..');}, 
					success : function(result){ 
						
						if(result == null){
							
						}
						
						else{
							
							$("#searchResult").empty();
							
							$(result).each(function(index, bookList){						
								
								var num = bookList.bnum;
								var title = bookList.title;
								var lib = bookList.lib;
								
								$("#searchResult").append("<tr>");
								$("#searchResult").append("<td align='left'>" + num + "</td>");
								$("#searchResult").append("<td align='left'><a style='color:white;' href='bookView?bnum=" + num + "' class='myA'><font-color='black'>" + title + "</font></a></td>");
								$("#searchResult").append("<td>" + lib + "</td>");
								$("#searchResult").append("</tr>");
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
		<section id="One" class="wrapper style4">
			<div class="inner">
				<header class="align-center">
					<p style="font-size:25px;">도서 찾기</p> 
					<br>
					<div style="margin-left:275px; width:350px; height:125px;">
						<form id="bn">
							<table class="mytb">
								<tr>
									<td><input type="text" id="book" name="book" oninput="bookSearch();" style="width:800px;" placeholder="찾고 싶은 책 제목을 입력해주세요"></td>
								</tr>
							</table>
						</form>
					</div>
					<div style="height:700px;">
						<table>
							<thead>
								<tr>
									<td align="left" style="width:200px;"><font size="4">NUM</font></td>
									<td align="left"><font size="4">BOOK </font><font size="2">(*책정보를 보려면 책제목을 클릭해주세요)</font></td>
									<td>LIBRARY</td>
								</tr>
							</thead>
							<tbody id="searchResult">
								<tr height="530px;">
									<td colspan="3"><h2></h2></td>
								</tr>
							</tbody>
						</table>
					</div>  
				</header>
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