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
				
				$("#bbsinsert").on("click",function(){
					
					location.href = "bbsInsertForm?pagenum=1";
					
				})
				
				$("#bbsSearch").on("click",function(){
					
					var sc = $("#sc").val();
					
					location.href = "bbsSearch?sc=" + sc + "&pagenum=1";
				})
				
				// < 
				$(document).on("click","#pageDown",function(){

					// 총페이지에서 가장 첫번째
					var pagenum = $(".hello").eq(0).text()-1;

					location.href = "bbsList?pagenum="+pagenum;
				})
				
				// > 
				$(document).on("click","#pageUp",function(){
					
					// 총페이지에서 가장 마지막
					var pagenum = $(".hello").eq(9).text()-1+2;
					
					location.href = "bbsList?pagenum="+pagenum;
				})
				
				// ajax 페이징
				$(document).on("click",".hello",function(){
					
					var pageindex = $(".hello").index(this);
					var pagenum = $(".hello").eq(pageindex).text();

					var first = ${FirstPage};
					var last = ${LastPage};
					var total = ${totalpage};
					
					var check1 = $(".hello").eq(0).text();
					
					$.ajax({
						
						url : "paging",
						data : {"pagenum" : pagenum},
						dataType : "json",
						error : function() {alert('통신실패..');},
						success : function(data){
						
							if(data.length>0){
								
								$("#plz").empty();
								
								$(data).each(function(index, bbsList){						
									
									var num = bbsList.fnum;
									var title = bbsList.ftitle;
									var writer = bbsList.fwriter;
									var date = bbsList.fdate;
									var hit = bbsList.fhit;
									var like = bbsList.flike;
									
									$("#plz").append("<tr>");
									$("#plz").append("<td>" + num + "</td>");
									$("#plz").append("<td align='left'><a href='bbsView?fnum=" + num + "&pagenum=" + pagenum + "' class='myA'>" + title +  "</a></td>");
									$("#plz").append("<td>" + writer + "</td>");
									$("#plz").append("<td>" + date + "</td>");
									$("#plz").append("<td>" + hit + "</td>");
									$("#plz").append("<td>" + like + "</td>");
									$("#plz").append("</tr>");
									
								}) // each end
								
							} // if end
							
							$("#page").empty();
							$("#page").append("<td colspan='6' id='paging'>");

							if(check1 == 1){
								$("#paging").append("&nbsp;&nbsp;&nbsp;");								
							}
							else{
								$("#paging").append("<a href='#' id='pageDown'>" + 
										"<img src='resources/images/pre.png' width='13px' height='13px'>" + 
										"</a>&nbsp;&nbsp;&nbsp;");
							}
							for(var i=first;i<=last;i++){
									if(i == pagenum){
										$("#paging").append("<b><a href='#' class='hello'>" + i + "</a></b>&nbsp;&nbsp;&nbsp;");
									}
									else{
										$("#paging").append("<a href='#' class='hello'>" + i + "</a>&nbsp;&nbsp;&nbsp;");
									}
							}
							
							if(last == total){
								$("#paging").append("&nbsp;&nbsp;&nbsp;");								
							}
							else{
								$("#paging").append("<a href='#' id='pageUp'>" + 
										"<img src='resources/images/next.png' width='13px' height='13px'>" + 
										"</a>&nbsp;&nbsp;&nbsp;");
							}
							
							$("#page").append("</td>");
							
						} // success end
						
					}) // ajax end (바깥쪽)
						
				}) // on end
							
			}) // function end
					
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
					<p style="font-size:25px;">도서게시판</p>
					<br>   
					<h3>도서 게시판 이지만, 도서정보만 공유하는것은 아닙니다.</h3>
				</header>
			</div>
		</section>
 
		<!-- Two -->
			<div class="inner"> 
				<div style="margin-top:50px;" class="content"> 
					<div style="margin:auto; width:1300px; height:900px;">
						<form action="" id="fr">
						<table class="mytb" style="text-align: center;">
							<tr style="background-color:black; color:white;">
								<td width="7%">글번호</td>
								<td width="59%" align="left">제목<font size="2">  (*글을 자세히 보려면 제목을 클릭하세요.)</font></td>
								<td width="10%">작성자</td>
								<td width="10%">작성날짜</td>
								<td width="7%">조회수</td>
								<td width="7%"><img src="resources/images/heart.png" id="bbsLike" width="15px;" height="15px;"></td>
							</tr>
							<tbody id="plz">
								<c:forEach items="${bbsList}" var="bbsOne">
								<tr> 
									<td>${bbsOne.fnum}</td>
									<td style="text-align: left;"><a href="bbsView?fnum=${bbsOne.fnum}&pagenum=${pagenum}" class="myA">${bbsOne.ftitle}</a></td>
									<td>${bbsOne.fwriter}</td> 
									<td>${bbsOne.fdate}</td>
									<td>${bbsOne.fhit}</td>
									<td>${bbsOne.flike}</td>
								</tr>
								</c:forEach>
							</tbody> 
							<tr>
								<td colspan="6" align="right"><button class="mybutton" id="bbsinsert" type="button"><font size="3" style="color:white;">글쓰기</font></button></td>
							</tr>	
							<tr id="page">
								<td colspan="6" align="center"> 
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
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<input type="text" autocomplete="off" id="sc" placeholder="검색할 글 제목을 입력해주세요">
								</td>
								<td><button class="mybutton" id="bbsSearch" type="button"><font size="3" style="color:white;">검색</font></button></td>
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