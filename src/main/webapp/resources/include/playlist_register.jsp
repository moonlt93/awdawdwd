<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style type="text/css">
	.header_title {
		border-bottom: 1px silver solid;
		margin-top: 10px;	
		padding: 5px 0px 0px 0px;
		height: 30px;
	}
	
	.header_title h6 {
		margin-left: 10px;	
	} 
	
	.register_wrapper {
		margin: 30px 40px 10px 40px;
	}
	
	.tit_input {
		margin-bottom: 20px;
	}
	.tit_input input {
		outline: none;
		border: 1px solid silver;
		
	}
	
	.con_input textarea {
		resize: none;
		outline: none;
		border: 1px silver solid;
		margin-bottom: 10px;
		border-radius: 5px 5px;
	}
	
	.reg_btn {
		background-color: lightgrey;
		color: snow;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
		margin-right: 5px;
	}
	
	.wri_input {
		outline: none;
		border: none;
		background-color: snow;
		color: grey;
	}
	.tit_input {
		border-bottom: 1px solid silver;
		height: 40px;
		margin-bottom: 22px;
		border-radius: 0px;
	}
	.tit_input input {
		outline: none;
		border-radius: 2px 2px;
		
	}
	.tit_content {
		padding: 20px 100px 20px 100px;  
		background-color: white;
		margin-bottom: 10px;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 5px 5px;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
<div class="header_title">
<h6>선곡표</h6>
</div>

	<div class="register_wrapper">
				<form method="post" action="${root}/playlist/register"> 
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					
				<div class="tit_content">
					<div class="tit_input">						
						<input name="title" type="text" placeholder="제목을 입력하세요.">
					</div>

					<div class="con_input">						
						<textarea wrap="hard" name="content"  cols="10" rows="10" placeholder="내용을 입력하세요."></textarea>
					</div>
				</div>
					
					<div class="">
					<sec:authorize access= "isAuthenticated()"> 			
						<input class="wri_input"name="writer" type="text"readonly="readonly"
						value ='<sec:authentication property="principal.username"/>'>
					</sec:authorize>
					
					<sec:authorize access="isAnonymous()">
						<input class="wri_input" name="writer" type="text"
						placeholder="이름을 입력하세요.">
					</sec:authorize>
					</div>					

					<button type="submit" class="reg_btn">등록</button>
					
			          
			      </form>
			</div>

</body>
</html>




