<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
	#login_container {
		border: 1px solid;
	}
	.login_sub_container {
		padding: 50px 30px 50px 30px;
		border: 1px solid;
	}
	.login_header h2 { 
		text-align: center;
	}
	#form_id {
		width: 500px;
	}
	.login_form {
		margin-bottom: 20px; 
	}
	.find_btn {
		text-decoration: none;
		color: black;
		background-color: white;
		height: 20px;
	}
	#loginBtn {
		background-color: white;
		color: black;
		float: right;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="login_container" style="padding: 70px;">
		<div class="login_sub_container">
	     		<div class="login_header">
					<h2>로그인</h2>
	     		</div>
					<h5><c:out value="${error }"/></h5>
					<h5><c:out value="${logout }"/></h5>
			
						<form action="/login" method="post" id="form_id">
							<div class="login_form">
								아이디 <input type="text" name="username" class="form-control" id="exampleInputEmail1">
							</div>
							<div class="login_form">
								비밀번호 <input type="password" name="password" class="form-control" />
							</div>
							<div class="login_form">
								<span><input type="checkbox" name="remember-me"> 자동 로그인</span>
							</div>
							
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
							
							<div class="btn_list" style="display: flex;">
								<a class="find_btn" href="${root }/member/findid">아이디찾기</a>/<a class="find_btn" href="${root }/member/findpw">비밀번호 찾기</a>
								<button style="justify-content: right;" id="loginBtn" type="submit">로그인</button> 
							</div>
						</form>
					
		</div>
	</div>
</body>
</html>