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
		<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				
				var obj = [];              
				
		        nhn.husky.EZCreator.createInIFrame({
		            oAppRef: obj,
		            elPlaceHolder: "editor",
		            sSkinURI: "./resources/editor/SmartEditor2Skin.html",
		            htParams : {
		            	
		                bUseToolbar : true,        
		                bUseVerticalResizer : true,   
		                bUseModeChanger : false,
		            }
		        });
				
				$("#bbsUpdate").on("click",function(){
					
					//id가 smarteditor인 textarea에 에디터에서 대입
		            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		            //폼 submit
		            $("#fr").submit();
				})
				
				$("#bbsList").on("click",function(){
					
					location.href = "bbsList?pagenum=1";
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
					<p style="font-size:25px;">게시글 수정</p>
					<br>   
					<h3>게시글을 수정해주세요</h3>
				</header>
			</div>
		</section>
 
		<!-- Two -->
		<div class="inner"> 
			<div style="margin-top:50px;" class="content"> 
				<div style="margin:auto; width:1150px; height:900px;">
					<form action="bbsUpdate" id="fr">
						<input type="hidden" value="${bbsOne.fnum}" name="fnum">
						<table class="mytb" style="text-align: center;"> 
							<tr>
								<td class="mybutton" width="100px;">글제목</td>
								<td><input type="text" id="ftitle" name="ftitle" value="${bbsOne.ftitle}"></td>
							</tr>
							<tr>
								<td class="mybutton">글내용</td>
								<td align="center">
									<textarea name="editor" id="editor" style="width: 950px; height: 450px;">
										${bbsOne.fcontent}
									</textarea>
								</td>
							</tr>
							<tr>
								<td align="left">
									<button type="button" class="mybutton" id="bbsList"><font size="3" style="color:white;">목록으로</font></button>
								</td>
								<td align="right">
									<button type="button" class="mybutton" id="bbsUpdate"><font size="3" style="color:white;">글 수정</font></button>
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