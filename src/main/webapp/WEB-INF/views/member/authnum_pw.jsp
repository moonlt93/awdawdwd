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
<link href="${root }/resources/css/all.min.css" rel="stylesheet">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	 body {
	background-image: url("${root}/resources/pic/background.jpg");
	background-size: contain;
	}	
	
	.nav-menu {
   	   display: flex;
   	   text-decoration: none;
   	   color: white;   	  
       padding: 10px 30px 10px 30px;
   }
   
   .nav-menu:hover {
   	   text-decoration: none;
   }
</style>
</head>
<body>
<div class="header2">
        <jsp:include page="${root }/resources/include/main_header.jsp" /> 
    </div>
    <div class="wrapper">  

        <div class="header">
            <h1><a class="moon" href="${root }">Moon's radio</a></h1>
        </div> 

            <div class="nav">
                <jsp:include page="${root }/resources/include/main_nav.jsp" />                
            </div>
        
        <div class="weekday">
            <jsp:include page="${root }/resources/include/main_dayintro.jsp" />
        </div>  
        					

       <div class="main" style="padding: 100px">
       		<h1>비밀번호 변경</h1>
       		<c:if test="${empty noExistMsg and empty noMatchMsg}">
				<br><h5>메일로 전송된 인증번호를 입력하세요.</h5>
					<form action="${root }/member/authnum_pw" method="post">
						<input type="hidden" name="serverKey" value="${AuthenticationKey }">
						<input type="hidden" name="email" value="${email }">
						<input type="hidden" name="id" value="${id }">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
						<div class="form-group">
							<span><input type="text" name="userKey" style="width: 200px;"> ${failMsg }</span>
						</div>
						
						<button id="loginBtn" type="submit" style="margin-top: 20px;">확인</button>	
					</form>
			</c:if>
			
			<c:if test="${not empty noExistMsg or not empty noMatchMsg}">
				<br><h4>${noExistMsg }</h4>
				<h4>${noMatchMsg }</h4>
				<h4>아이디와 회원가입시 사용한 이메일을 입력해주세요.</h4> <br>
			<form action="${root }/member/findpw" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
				
				<div class="form-group">
					<label for="input-email">아이디</label>
					<input name="id" type="text" class="form-control" id="input-id" style="width: 300px;">
				</div>
				
				<div class="form-group">
					<label for="input-email">이메일</label>
					<input name="email" type="email" class="form-control" id="input-email" style="width: 300px;">
				</div>

				<button id="loginBtn" type="submit" style="margin-top: 20px;">비밀번호 찾기</button>
			</form>
			</c:if>

       </div>
       
        <div class="empty1">

        </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="${root }/resources/include/main_footer.jsp" />
    </div>
    







</body>
</html>