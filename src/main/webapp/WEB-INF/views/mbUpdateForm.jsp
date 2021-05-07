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
		</script>
	</head> 

	<body class="subpage">
		
		<!-- Header -->
		<header id="header">
			<div class="logo"><a href="index.html">Hielo <span>by TEMPLATED</span></a></div>
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
						<tbody>
							<tr>
								<td style="width:80px;">ID</td>
								<td colspan="3"><b>${mDto.id}</b></td>
							</tr> 
							<tr>
								<td style="width:80px;">PW</td> 
								<td colspan="3"><button type="button" class="mybutton">비밀번호 변경하러가기</button></td>
							</tr>
							<tr>
								<td>NAME</td>
								<td colspan="3"><input type="text" value="" name="name" id="name" autocomplete="off" placeholder="Name"></td>
							</tr>
							<tr>
								<td>PHONE</td>
								<td>
									<select class="form-control" id="tel1" name="preTel">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
								</td>
								<td><input type="text" maxlength="4" name="tel2" id="tel2" autocomplete="off" placeholder="Tel"></td>
								<td><input type="text" maxlength="4" name="tel3" id="tel3" autocomplete="off" placeholder="Tel"></td>
							</tr>
							<tr>
								<td>EMAIL</td>	
								<td style="width:170px;">
									<input class="form-control" autocomplete="off" placeholder="Email" type="text" id="email" name="email">
								</td>
								<td>  
									<select class="form-control" id="domain" name="domain">
										<option value="google.com">google.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
									</select>
								</td>
								<td><input style="width:150px;" type="button" onclick="sendMail();" id="sendEmail" class="button special" value="인증번호전송"></td>
							</tr>
							<tr> 
								<td>AUTH</td>
								<td colspan="2"><input type="text" placeholder="AuthCode" id="auth" class="form-control"></td>
								<td align="center"><input style="width:150px;" type="button" onclick="authChecker();" id="authCheck" class="button special" value="인증"></td>
							</tr>
							<tr>
								<td align="center" colspan="4"><div class="g-recaptcha" data-sitekey="6LcSIG0UAAAAAOnsPqzaLZUEAzl8YgAue2MG7Q3n"></div></td>
							</tr>
							<tr> 
								<td colspan="4" align="center">
									<input class="button special" style="width:180px;" type="submit" name="sub" id="sub" value="Join"> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="button special" style="width:180px;" type="button" id="cc" value="Cancel"> 
								</td>
							</tr>
						</tbody>
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