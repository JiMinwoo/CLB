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
				
				$("#bbsDelete").on("click",function(){
					location.href = "bbsDelete?fnum=" + ${bbsOne.fnum}
				})
				
				$("#bbsList").on("click",function(){
					location.href = "bbsList?pagenum=" + ${pagenum}
				})
				
				$("#bbsUpdate").on("click",function(){
					location.href = "bbsUpdateForm?fnum=" + ${bbsOne.fnum}
				})
				
				$("#brInsert").on("click",function(){
					
					var fnum = ${bbsOne.fnum};
					var brcontent = $("#brcontent").val();
					
					$.ajax({
						
						url : "brInsert",
						data : {"fnum" : ${bbsOne.fnum},
								"brcontent" : brcontent
								},
						dataType : "json",
						success : function(result){
							
								if(result.length>0){
								
								$("#reply").empty();
								
								$("#reply").append("<tr>");
								$("#reply").append("<td width='7%'><b>ID</b></td>");
								$("#reply").append("<td width='58%'><b>내용</b></td>");
								$("#reply").append("<td><b><font color='skyblue' size='4'>작성날짜</font></b></td>");
								$("#reply").append("<td> </td>");
								$("#reply").append("</tr>");
								
								$(result).each(function(index, brList){						
									
									var content = brList.brcontent;
									var id = brList.id;
									var date = brList.brdate;
									
									$("#reply").append("<tr>");
									$("#reply").append("<td width='7%'><b>" + id + "</b></td>");
									$("#reply").append("<td width='58%'>" + content + "</td>");
									$("#reply").append("<td width='15%'><b><font color='skyblue' size='4'>" + date + "</font></b></td>");
									$("#reply").append("<td width='20%'><button class='mybutton' id='brDelete' type='button'><font size='3' style='color:white;'>삭제</font></button>&nbsp;</td>");
									$("#reply").append("</tr>");
									
								}) // each end
							} // if end
						}
					})
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
					<p style="font-size:25px;">자유게시판</p>
					<br>   
					<h3>책 사이트지만, 책정보만 공유하는것은 아닙니다.</h3>
				</header>
			</div>
		</section>
 
		<!-- Two -->
		<div class="inner"> 
			<div style="margin-top:50px;" class="content"> 
				<div style="margin:auto; width:1000px; height:1700px;">
					<form action="bbsInsert"> 
						<table class="mytb">
							<tr>
								<td width="100px;" align="center" class="mybutton">글제목</td>
								<td><b>${bbsOne.ftitle}</b></td>
							</tr>
							<tr>
								<td style="vertical-align: center;" align="center" class="mybutton">작성자</td>
								<td style="vertical-align: center;"><b>${bbsOne.fwriter}</b></td>
							</tr>
							<tr>
								<td style="vertical-align: center;" align="center" class="mybutton">조회수</td>
								<td>
									${bbsOne.fhit}									
								</td>
							</tr>
							<tr>
								<td style="vertical-align:middle;" align="center" class="mybutton"><img src="resources/images/heart.png" width="13px;" height="13px;"></td>
								<td><font size="4" color="">${bbsLike}</font></td>
							</tr>
							<tr height="500px;">
								<td style="vertical-align:middle;" align="center" class="mybutton">글내용</td>
								<td colspan="2">
									<div>
										${bbsOne.fcontent}
									</div>
								</td>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${likeCheck eq 1}">
										<td colspan="2" align="right">
											<img src="resources/images/heart.png" width="13px;" height="13px;">&nbsp;이미 좋아요 한 글입니다 : )
										</td>
									</c:when>
									<c:otherwise>
										<td colspan="2" align="right">
											<a class="myA" href="bbsLikeUp?fnum=${bbsOne.fnum}&pagenum=${pagenum}">
												<img src="resources/images/heart.png" width="13px;" height="13px;">&nbsp;해당 글이 마음에 드신다면 눌러주세요!
											</a>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${loginID eq bbsOne.fwriter}">
										<td align="right" colspan="2">
											<button class="mybutton" id="bbsDelete" type="button"><font size="3" style="color:white;">글 삭제</font></button>
											<button class="mybutton" id="bbsUpdate" type="button"><font size="3" style="color:white;">글 수정</font></button>
											<button class="mybutton" id="bbsList" type="button"><font size="3" style="color:white;">목록으로</font></button>
										</td>
									</c:when>
									<c:otherwise>
										<td align="right" colspan="2">
											<button class="mybutton" id="bbsList" type="button"><font size="3" style="color:white;">목록으로</font></button>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
						<table class="mytb">
							<thead>
								<tr>
									<td colspan="3"><textarea id="brcontent" rows="1"></textarea></td>
									<td align="center"><button style="width: 120px; height: 72px;" class="mybutton" id="brInsert" type="button"><font size="3" style="color:white;">댓글등록</font></button></td>
								</tr>
							</thead>
							<tbody id="reply">
								<tr>
									<td width="7%"><b>ID</b></td>
									<td width="58%"><b>내용</b></td>
									<td><b><font color="skyblue" size="4">작성날짜</font></b></td>
									<td></td>
								</tr>
								<c:forEach items="${brList}" var="brOne">
									<tr>
										<td width="7%"><b>${brOne.id}</b></td>
										<td width="58%">${brOne.brcontent}</td>
										<td width="15%"><b><font color="skyblue" size="4">${brOne.brdate}</font></b></td>
										<td width="20%" id="bt" align="center">
											<button class="mybutton" id="brDelete" type="button"><font size="3" style="color:white;">삭제</font></button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
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