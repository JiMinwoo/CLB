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
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script type="text/javascript">
		
			$(function(){
				
				$("#mkDelete").on("click",function(){
					location.href = "marketDelete?mnum=" + ${mkOne.mnum}
				})
				
				$("#mkUpdate").on("click",function(){
					location.href = "marketUpdateForm?mnum=" + ${mkOne.mnum}
				})
				
				$("#mkList").on("click",function(){
					location.href = "marketList?pagenum=" + ${pagenum}
				})
			})
			
			$(function(){
	
				$("#money").on("click",function(){
					
					var IMP = window.IMP; //
					IMP.init('imp29005954'); //
					
					IMP.request_pay({
					    pg : 'inicis',
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명:결제테스트',
					    amount : 12000,
					    buyer_email : 'jmw492@naver.com',
					    buyer_name : '지민우',
					    buyer_tel : '010-3968-5583',
					    buyer_addr : '서울특별시 강남구 삼성동',
					    buyer_postcode : '123-456' 
					}, function(rsp) {
					    if ( rsp.success ) {
					    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					    	jQuery.ajax({
					    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
					    		type: 'POST',
					    		dataType: 'json',
					    		data: {
						    		imp_uid : rsp.imp_uid
						    		//기타 필요한 데이터가 있으면 추가 전달
					    		}
					    	}).done(function(data) {
					    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					    		if ( everythings_fine ) {
					    			var msg = '결제가 완료되었습니다.';
					    			msg += '\n고유ID : ' + rsp.imp_uid;
					    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					    			msg += '\결제 금액 : ' + rsp.paid_amount;
					    			msg += '카드 승인번호 : ' + rsp.apply_num;
					
					    			alert(msg);
					    		} else {
					    			//[3] 아직 제대로 결제가 되지 않았습니다.
					    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					    		}
					    	});
					    	 
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					
					        alert(msg);
					    }
					    
					});
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
					<h3>책을 팝니다</h3>
				</header>
			</div>
		</section>
 
		<!-- Two -->
		<div class="inner"> 
			<div style="margin-top:50px;" class="content"> 
				<div style="margin:auto; width:1150px; height:1700px;">
					<form action="bbsInsert"> 
						<table class="mytb">
							<tr>
								<td width="100px;" align="center" class="mybutton">글제목</td>
								<td>${mkOne.mtitle}</td>
							</tr>
							<tr>
								<td align="center" class="mybutton">작성자</td>
								<td>${mkOne.mwriter}</td>
							</tr>
							<tr>
								<td style="vertical-align:middle;" align="center" class="mybutton">대표이미지</td>
								<td><img src="resources/photoUpload/${mkOne.mimg}" height="350" width="250"></td>
							</tr>
							<tr>
								<td style="vertical-align:middle;" align="center" class="mybutton">글내용</td>
								<td>
									<div style="width:800px; height:500px;">
										${mkOne.mcontent}
									</div>
								</td>
							</tr>
							<tr>
								<td style="vertical-align:middle;" align="center" class="mybutton">결제</td>
								<td><button class="mybutton" type="button" id="money" name="money"><font size="3" style="color:white;">결제하기</font></button></td>
							</tr>
							<tr>
								<td align="left">
									<button class="mybutton" id="mkList" type="button"><font size="3" style="color:white;">목록으로</font></button>
								</td>
								<td align="right">
									<button class="mybutton" id="mkDelete" type="button"><font size="3" style="color:white;">글 삭제</font></button>
									<button class="mybutton" id="mkUpdate" type="button"><font size="3" style="color:white;">글 수정</font></button>
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