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
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>Insert title here</title>
<style type="text/css">
	 body {
	background-image: url("${root}/resources/pic/background.jpg");
	background-size: cover;
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
   
   .main {
   		position: relative;
   }
   
   .find_id {
   		padding: 60px 40px;
		background: #f1f1f1; 
		height: 400px;    
		width: 360px;	 
		margin: 60px 0px 0px 0px;  
		position: absolute;  
		left: 30%; 
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
        					

       <div class="main">
       		<div class="find_id">
      			<h1>아이디 찾기</h1>
      		
       		<c:if test="${empty failMsg }">
					<br><h5>회원님의 아이디입니다.</h5>
					<br>
					<br>
					<div id="userid" style="background-color: white; padding: 15px; text-align: center; width: 200px; height: 60px;">
						<h5>${id }</h5>
					</div>
			
					<br>
					<br>
				<a href="${root }/customLogin">로그인하기</a> <br/>
				<a href="${root }/member/findpw">비밀번호 찾기</a> <br/>
				<a href="${root }/">메인으로 가기</a>
			
			</c:if> 

			<div>
				<c:if test="${not empty failMsg }">
					<h4>${failMsg }</h4>
					<h5>메일로 전송된 인증번호를 입력하세요.</h5>
					<form action="${root }/member/yourid" method="post">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
						<input type="hidden" name="serverKey" value="${AuthenticationKey }">
						<input type="hidden" name="id" value="${id }">
						<div class="form-group">
							<input type="text" name="userKey">
						</div>
						<button id="loginBtn" type="submit" >확인</button>	
					</form>
				</c:if>
			</div>
       	</div>
       </div>
       
        <div class="empty1">

        </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="${root }/resources/include/main_footer.jsp" />
    </div>
    


</body>

</html>