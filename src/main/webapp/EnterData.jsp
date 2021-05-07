<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript">

	$(function(){
		$("#bring").on("click",function(){
			
			$.ajax({
				 
 				url:"http://openapi.seoul.go.kr:8088/736e4d63596a6d7735394b50745073/xml/SeoulLibraryBookSearch/2981/2990",
 				
				dataType: "xml",
				
				success: function(data){
					
					var list = $(data).find("row");
					
					if(list.length>0){
						
						$(list).each(function(index,item){
							
							var title = $(this).find("TITLE").text();
							var author = $(this).find("AUTHOR").text();

							$("#hello").append(index + " : " + title + "<br>");
							$("#hello").append(index + " : " + author + "<br>");
							
						})
					}
				}
			});
		});
	});
	
	$(function(){
		$("#insert").on("click",function(){
		
			$.ajax({ 
				  
 				url:"http://openapi.seoul.go.kr:8088/736e4d63596a6d7735394b50745073/xml/SeoulLibraryBookSearch/2981/2990",
 				
				dataType: "xml",
				
				success: function(data){
					
					var list = $(data).find("row");
					
					if(list.length>0){
						
						$(list).each(function(index,item){
							
							var title = $(this).find("TITLE").text();
							
							$.ajax({

								url:"infoInsert",
								data: {"title" : title},
								success : function(result){
									console.log("success");
								},
								error : function() {
									console.log('통신실패..');
								}
							}); 
						})
					}
				}
			});
		}); 
	});
</script>
</head>
<body>
	<button type="button" id="bring">BRING</button>
	<button type="button" id="insert">INSERT</button>
	<div id="hello">
	</div>
</body>
</html>