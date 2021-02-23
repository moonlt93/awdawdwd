<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${root }/resources/css/all.min.css" rel="stylesheet">  
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.login_button {
		color: pink;
		
	}
</style>
</head>
<body>
	  <div class="">
          <sec:authorize access="isAnonymous()">
		      <li class="">
		        <a class="login_button" href="/customLogin">로그인</a>
		      </li>
	      </sec:authorize>
	      
	      <sec:authorize access="isAuthenticated()">
		      <li class="">
	      	<form action="/logout" method="post">
		        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		        <button type="submit" class="logout_button">로그아웃</button>
	      	</form>
		      </li>
	      </sec:authorize>
        </div>
</body>
</html>