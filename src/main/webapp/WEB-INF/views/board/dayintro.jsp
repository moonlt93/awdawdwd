<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel ="stylesheet" href="${root }/resources/css/form.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
	 body {
	background-image: url("../resources/pic/background.jpg");
	background-size: cover;  
}
</style>
	
<title>Insert title here</title>
</head>
<body>
<div class="header2">
        <nav class="header-nav">
            <a href="" style="text-decoration: none; color:white; align-items: center; display: flex;">회원가입</a>
        </nav>
    </div>
    <div class="wrapper">  

        <div class="header">
            <h1>Moon's radio</h1>
        </div> 

            <div class="nav">
                <div class="nav-flex">               
                        <a href="${root }/member/check">mini메시지</a>
                        <button type ="button">선곡표</button>
                        <a href="">사연과 신청곡</a>
                        <button type ="button">다시듣기</button>                   
                 </div>                
            </div>

        <div class="coner">     
            <strong class="title1"><i class="far fa-list-alt"></i>매일코너</strong>
                <ul class="everyDay" style="list-style: none;"> 
                    <li><i class="fas fa-caret-right"></i>사연과 신청곡</li>
                    <li><i class="fas fa-caret-right"></i>하루 틈</li>
                    <li><i class="fas fa-caret-right"></i>내일의 BGM, 꺼내 들어요</li>
                </ul>    
        </div> 
        
        
        <div class="weekday">
            <jsp:include page="/resources/include/main_dayintro.jsp" />
        </div>  
        					


       <div class="main">
       		
       </div>
       
        <div class="empty1">

        </div>
        
        <div class="empty2">
        
        </div>
        
        <div class="empty3">
        
        </div>
        
    </div>
    
    <div class="footer">
        <footer>
            footer
        </footer>
    </div>
    


</body>
</html>