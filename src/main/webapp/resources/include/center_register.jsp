<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="root/resources/css/all.min.css" rel="stylesheet">  
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.center_wrapper {
		margin: 3%;
		padding: 3%;
	}	 
	
	.center_header { 
		border-bottom: 2px solid gray;
		
	}
	.center_header h2 {
		text-align: center;		
	}
	

</style>
</head>
<body>
	
<div class="center_wrapper">
		
		<div class="center_header" style="border-radius: 0px;">
			<h2>고객 센터</h2>
		</div>	
	
	<form action="${root }/service/register" method="post">
		<div class="center_input">
		
			<div>
			id
			<input type="text" name="id">			
			</div>
			
			<div>
			이름
			<input type="text" name="name">
			</div>
			
			<div>
			이메일
			<input type="text" name="name"> 
			</div>
			
			<div class="center_type" style="justify-self: center;">			
			문의 유형
				<div>
				결제/이용권<input type="radio" name="type" value="결제/이용권">	
				</div>
				<div>
				회원/로그인<input type="radio" name="type" value="회원/로그인">	
				</div>
				<div>
				서비스/콘텐츠<input type="radio" name="type" value="서비스/콘텐츠">	
				</div>
				<div>
				mini/라디오<input type="radio" name="type" value="mini/라디오">	
				</div>
				<div> 
				기타<input type="radio" name="type" value="기타">						
				</div>
			</div>
			
			<div>
			제목
			<input type="text" name="name">
			</div>
			
			<div>
			내용	
			<input type="text" name="name"> 
			</div>
			
			<button type="button">문의하기</button>			
		</div>	
	</form>	
	
</div>
	
	
	
</body>
</html>