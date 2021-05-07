<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<script src='https://www.google.com/recaptcha/api.js'></script>
		<script type="text/javascript">
		
		var idck = 0;
		var pwck = 0;
		var pwck2 = 0;
		
		// button css
		$(function(){
			$("#sub").css("background-color","black");
			$("#cc").css("background-color","black"); 
			$("#sendEmail").css("background-color","black");
			$("#authCheck").css("background-color","black");
		})
		
		// 아이디 중복체크
		function idCheck(){
			
			var id = fr.id.value;
			
			if(id == null || id == ""){
				$("#idck").css("color","grey");
				$("#idck").text('*4~8글자의 아이디를 설정해주세요');
			}
			
			else{
				$.ajax({
					type : "GET",
					url : "idCheck",
					data : {"userID" : id},
					error : function() {alert('통신실패..');},
					success : function(result){
						if(result == '0')
						{ 
							$("#idck").css("color","blue");
							$("#idck").text('*사용 가능한 아이디 입니다 : )');
							idck = 1;
						}
						else
						{
							$("#idck").css("color","red");
							$("#idck").text('*이미 사용중인 아이디 입니다 :<');
						}
					}
				})
			}
		}
		
		// 비밀번호 유효성 검사
		function pwCheck(){
			
			var passwordRule = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			
			var pw = fr.pw.value;
			var repw = fr.repw.value;
			
			if(pw == null || pw == ""){
				
				$("#pw").css("background-color","white");
				$("#pwck").css("color","grey");
				$("#pwck").text("*영문,숫자,특수문자를 조합한 8자 이상의 비밀번호를 설정해주세요"); 
			
			}
			
			else{
				
				if(pw.match(passwordRule)){ 
					$("#pwck").css("color","blue");
					$("#pwck").text("*안전한 비밀번호입니다!");
					pwck = 1;
				}
				
				else{					 
					$("#pwck").css("color","red");
					$("#pwck").text("*영문,숫자,특수문자를 조합한 8자 이상의 비밀번호를 설정해주세요"); 
				}
			}
		}
		
		// 비밀번호, 비밀번호재입력 일치여부 확인
		function pwEqaul(){
			
			var pw = fr.pw.value;
			var repw = fr.repw.value;
			
			if(pw == null || pw == "" || repw == null || repw == ""){
				$("#repwck").css("color","grey");
				$("#repwck").text("*비밀번호를 다시 입력해주세요"); 
			}
			 
			if(pw == repw){
				$("#repwck").css("color","blue");
				$("#repwck").text("*비밀번호가 일치합니다");
				pwck2 = 1;
			}
			else{ 
				$("#repwck").css("color","red");
				$("#repwck").text("*비밀번호가 일치하지 않습니다!");
			}
			
		}
		
		var rc;
		
		// 이메일 인증
		function sendMail(){

			var email = fr.email.value + "@" + fr.domain.value;
			
			$.ajax({
				type : "GET",
				url : "sendCode",
				data : {"email" : email},
				error : function() {alert('통신실패..');},
				success : function(code){
					rc = code;
					alert("해당 이메일로 인증번호를 전송했습니다!");
				}
			})
		}
		
		// 이메일인증 확인
		function authChecker(){
			
			var authCode = $("#auth").val();

			if(rc == authCode){
				alert("인증되었습니다.");
				$("#sub").attr("disabled",false);
			}
			
			else{
				alert("인증코드를 다시 확인해주세요.");
			}
			
		}
		
		$(function(){
			
			$("#sub").on("click",function(){
				
				if(idck == 0){
					alert("아이디를 다시 확인해주세요.")
				}
				
				else if(pwck == 0){
					alert("비밀번호를 다시 확인해주세요.")
				}
				
				else if(pwck2 == 0){
					alert("비밀번호 재확인을 다시 확인해주세요.")
				}
				
				else{
					console.log("성공입니다!");
					$("#fr").submit();
				}
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
					<p style="font-size:25px;">JOIN</p>
					<br>   
					<h3>환영합니다!</h3>
				</header>
			</div>
		</section>
 		
		<!-- Two -->
		<div class="inner"> 
			<div style="margin-top:50px;" class="content"> 
				<div style="width:580px; height:900px; margin:auto;"> <!-- 테이블 div -->
					<form action="join" name="fr" id="fr">
					<table class="mytb"> 
						<tbody>
							<tr>
								<td style="width:80px;">ID</td>
								<td colspan="3"><input type="text" name="id" id="id" oninput="idCheck();" required="required" autocomplete="off" placeholder="ID"></td>
							</tr> 
							<tr>
								<td colspan="4" align="right"><h6 id="idck">*4~8자의 아이디를 입력해주세요</h6></td>
							</tr>
							<tr>
								<td style="width:80px;">PW</td>  
								<td colspan="3"><input type="password" oninput="pwCheck()" name="pw" id="pw" autocomplete="off" placeholder="Password" ></td>
							</tr>
							<tr> 
								<td colspan="4" align="right"><h6 id="pwck" style="color:grey">*영문,숫자,특수문자를 조합한 8자 이상의 비밀번호를 설정해주세요</h6><dth>
							</tr>
							<tr>
								<td style="width:80px;">RE PW</td>  
								<td colspan="3"><input type="password" oninput="pwEqaul()" name="repw" id="repw" autocomplete="off" placeholder="RePassword"></td>
							</tr>
							<tr> 
								<td colspan="4" align="right"><h6 id="repwck" style="color:grey">*비밀번호를 다시 입력해주세요</h6><dth>
							</tr>
							<tr>
								<td>NAME</td>
								<td colspan="3"><input type="text" name="name" id="name" autocomplete="off" placeholder="Name"></td>
							</tr>
							<tr>
								<td>PHONE</td>
								<td>
									<select class="form-control" id="tel1" name="tel1">
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
									<button class="button special" style="width:180px;" disabled="disabled" type="button" id="sub">JOIN</button> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="button special" style="width:180px;" type="reset" id="cc" value="Cancel"> 
								</td>
							</tr>
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

		<!-- Scripts -->
		<script type="text/javascript">
			// 구글 리캡차
			var onloadCallback = function(){
				greCAPTCHA.render('html_element',{
					'sitekey' : '6LcSIG0UAAAAAOnsPqzaLZUEAzl8YgAue2MG7Q3n',
					'theme' : 'dark'
				})
			}
		</script>
	</body>
</html>