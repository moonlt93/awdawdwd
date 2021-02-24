<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>Insert title here</title>
<style type="text/css">
.container-sm {
width: 200px;

body {
	background-image: url("../resources/pic/background.jpg");
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
       
       <ul class="nav justify-content-end">
		  <li class="nav-item">
            <a href="" style="text-decoration: none; color:white; align-items: center; display: flex;">회원가입</a>
		  </li>
		  <li class="nav-item">
            &nbsp; <a href="/customLogin" style="text-decoration: none; color:white; align-items: center; display: flex;">로그인(임시임시얍!)</a>
		  </li>
 		 </ul>
        
       
    </div>
    <div class="wrapper">  

        <div class="header">
            <h1><a class="moon" href="${root }">Moon's radio</a></h1>
        </div> 

            <div class="nav">
                <jsp:include page="/resources/include/main_nav.jsp" />                
            </div>

        <div class="corner">     
             <jsp:include page="/resources/include/main_corner.jsp" />  
        </div> 
        
        
        <div class="weekday">
            <jsp:include page="/resources/include/main_dayintro.jsp" />
        </div>  
        					
       <div class="main">
     	
	     	<jsp:include page="/resources/include/login_form.jsp" />
       </div>
       
        <div class="empty1">

        </div>
        
    </div>
    
    <!-- 
    <div class="footer">
        <footer>
            footer
        </footer>
    </div>
     -->
    


</body>
	
	
</html>