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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="resources/assets/css/custom.css" /> 
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js"></script>
		<script src="resources/assets/js/skel.min.js"></script>
		<script src="resources/assets/js/util.js"></script>
		<script src="resources/assets/js/main.js"></script>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<script type="text/javascript">
		
			$('#myTab a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			})
			
			$('#myTab a[href="#profile"]').tab('show') // Select tab by name
			$('#myTab a:first').tab('show') // Select first tab
			$('#myTab a:last').tab('show') // Select last tab
			$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)
		
		</script>
		
		<script type="text/javascript">
		$(function(){  
			
			var userID = ${loginID}
			
			$(".loginCheck").on("click",function(){ 

				if(userID != null){
					alert("로그인 해주세요!")
					location.href = "index";
				}
				
			})
			
			$("#login").on("click",function(){
					
				var userID = $("#id").val();
				var userPW = $("#pw").val();
				
				$.ajax({
					
					url : "login",
					data : {
							"id" : userID,
							"pw" : userPW
							},
					error : function() {alert('통신실패..');},
					success : function(result){
							
					 	if(result == 0){
							alert("아이디를 확인해주세요");
						}
						
						else if(result == 1){
							alert("비밀번호를 확인해주세요");
						}
						
						else if(result == 2){
							$("#myModal").modal('hide');
							alert("로그인 성공");
							location.href = "index";
						}
						
						else{
							alert("어떤 오류인지 모르겠네요");
						}
																				
					} // success end
					
				}) // ajax end (바깥쪽)
					
			}) // on end
		
		}) // function end
	</script>
	</head>
	<body>

		<!-- Header -->
		<header id="header" class="alt">
			<div class="logo"><a href="index">CLB <span>Check Library Book</span></a></div>
			<a href="#menu">Menu</a>
		</header>
			
		<!-- Nav -->
		<nav id="menu">
			<ul class="links">
				<c:choose>
					<c:when test="${loginID eq NULL}">
						<li><a href="#" id="myBtn">Login</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="memberInfo">MyPage</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="index">Home</a></li>
				<li><a class="loginCheck" href="bbsList?pagenum=1">BBS</a></li>
				<li><a class="loginCheck" href="marketList?pagenum=1">Market</a></li>
				<li><a class="loginCheck" href="bookSearchForm">BookSearch</a></li>
				<li><a class="loginCheck" href="library">Library</a>
			</ul>
		</nav>
		
		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="resources/images/hi.jpg" alt="" />
					<div class="inner">
						<header>
							<p>You can find the book you want to find.</p>
							<h2>BOOK</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="resources/images/library.jpg" alt="" />
					<div class="inner">
						<header>
							<p>Free community activities</p>
							<h2>COMMUNITY</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="resources/images/ddddd.jpg" alt="" />
					<div class="inner">
						<header>
							<p>Members can buy and sell used books.</p>
							<h2>MARKET</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="resources/images/hohoho.jpg" alt="" />
					<div class="inner">
						<header>
							<p>You can check the library information.</p>
							<h2>LIBRARY</h2>
						</header>
					</div>
				</article>
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
			
			<!-- modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header" style="background-color:black; color:white;"> 
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">LOGIN</h4>
			      </div>
			      <div class="modal-body">
			      <div class="container">
			      	<div style='margin-left:60px; width:400px;'>
			        <table class="mytb">
			        	<tr> 
			        		<td style="width:70px;">ID</td>
			        		<td>
			        			<input class="form-control" autocomplete="off" placeholder="ID" type="text" id="id" name="id">
			        		</td>
			        	</tr>
			        	<tr>
			        		<td style="width:70px;">PW</td>
							<td>
								<input class="form-control" autocomplete="off" placeholder="PASSWORD" type="password" id="pw" name="pw">
							</td>
			        	</tr>
			        	<tr>
			        		<td colspan="3" align="right"><h5><small>아직 아이디가 없으신가요 ? <a style="color:blue;" href="joinForm">JOIN</a></small></h5></td>
			        	</tr>
			        </table>
			        </div>
			        </div>
				      <div class="modal-footer" style="text-align:center;"> 
				        <button type="button" class="button special" id="login" style="color:white; background-color:black; border-color:black;">LOGIN</button>
				      	<button type="button" class="button special" style="color:white; background-color:black; border-color:black;" data-dismiss="modal" >CLOSE</button>
				      </div>
				  </div>
			    </div>
			  </div>
			</div>
			

			<!-- Scripts -->
			<script> 
				$(document).ready(function() {
					$("#myBtn").click(function() {
						$("#myModal").modal();
					});
				});
			</script>
	</body>
</html>