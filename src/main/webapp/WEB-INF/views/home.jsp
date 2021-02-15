<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>

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
	*{	
	 	margin: 0; 
      	padding: 0;
    }

	body {
	background-image: url("resources/pic/background.jpg");
	background-size: cover; 
	}
	
   .wrapper{              
        display: grid;
        grid-gap: 15px;
        height: 100%;
        grid-template-columns: 1fr 300px 300px 300px 300px 1fr ;
        grid-template-rows:  200px 50px 80px 150px 200px 200px;
        grid-template-areas: 'empty3 header header header header empty4'
                             'empty3 nav nav nav nav empty4'
                             'empty3 today today today today empty4'
                             'empty3 corner weekday SNS every empty4'
                             'empty3 list weekday listener every empty4'
                             'empty3 list radio empty2 empty1 empty4'                            
   }
   .wrapper div{
        border-radius: 5px 5px;      
        text-align: inherit;
        display: grid;
   }
   .header{
        grid-area: header;
        color: thistle;
   }
   .nav{
        background-color: snow;
        grid-area: nav;
   }
   .today{
        background-color: snow;
        grid-area: today;
   }
   .corner{
        background-color: snow;
        grid-area: corner;
   }
   .list{
        background-color: snow;
        grid-area: list;
   }
   .weekday{
        background-color: snow;
        grid-area: weekday;
   }
   .radio{
        background-color: snow;
        grid-area: radio;
   }
   .listener{
        background-color: snow;
        grid-area: listener;
   }
   .SNS{
        background-color: snow;
        grid-area: SNS;
   }
   .empty1 {
        grid-area: empty1;
   }
   .empty2 {
        grid-area: empty2;
   }
   .every{
        background-color: snow;
        grid-area: every;
   }
   
   .moon {
   		text-decoration: none;
   		color: thistle;
   }
   
   .moon:hover {
   		text-decoration: none;
   		color: thistle
   }
   
   button {      
        padding-left: 30px;
        padding-right: 30px;
        border: none;
        outline: none;
        border-radius: 5px 5px;
        background-color: thistle; 
        color: white;
   }
   button:hover {
       
       cursor: pointer;
   }
   .nav .nav-flex {
       display: flex;
       padding-left: 30px;
       padding-right: 30px;
       border: none;
       outline: none;
       border-radius: 5px 5px;
       align-items: center;
       justify-content: center;
       background-color: thistle;
       
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
   
   .title1 {
       padding: 10px 10px 0px 10px;
   }

   .header h1 {
       text-align: center;
       margin-top: 80px;
   }

   .header2 .header-nav{
       display: flex;
       background-color: black;
       height: 40px;
       justify-content: flex-end;
   }

   .header2 .header-nav .header-button {
       background-color: black;
   }

   .footer{
       height: 200px; 
       background-color: rgb(216, 161, 88);
       margin-top: 30px;
       width: 100%;
   }

   .fas {
       color: grey;
       margin-right: 10px;
   }
   
   #list {
   	   margin-right: 5px;
   }
   .everyDay .evList {
       padding: 5px 5px 7px 30px;
   }
   .evA {
   	   text-decoration: none;
   	   color: grey;
   }
   
   .evA:hover {
   	   text-decoration: none;
   }
   
   .week {
       background-color: black;
       color: white;
   }

</style>
</head>
<body>  
    <div class="header2">
        <nav class="header-nav">
            <a href="${root }/member/register">회원가입</a>
          <sec:authorize access="isAnonymous()">
		      <li class="nav-item">
		        <a class="nav-link" href="/customLogin">로그인</a>
		      </li>
	      </sec:authorize>
	      
	      <sec:authorize access="isAuthenticated()">
		      <li class="nav-item">
	      	<form action="/logout" method="post">
		        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		        <button type="submit" class="btn btn-outline-dark btn-sm">로그아웃</button>
	      	</form>
		      </li>
	      </sec:authorize>
        </nav>
    </div>
    <div class="wrapper">  

        <div class="header">
            <h1><a class="moon" href="${root }">Moon's radio</a></h1>
        </div> 

            <div class="nav">
                <jsp:include page="/resources/include/main_nav.jsp" />               
            </div>

        <div class="today">
            <strong class="title1">today</strong> |
        </div>
        
        <div class="corner">     
             <jsp:include page="/resources/include/main_corner.jsp" />    
        </div>
        
        <div class="list">
            <strong class="title1" style="overflow: scroll; overflow-x: hidden "><i id="list" class="far fa-list-alt"></i>선곡표</strong>
        </div>
        
        <div class="weekday"> 
               <jsp:include page="/resources/include/main_homeintro.jsp" />
        </div> 

        <div class="radio">
            <strong class="title1">보이는라디오</strong>
        </div>

        <div class="listener">
            <strong class="title1">다시듣기</strong>           
        </div>

        <div class="SNS">
            <strong class="title1">sns</strong>
        </div>

        <div class="empty1">empty</div>
        <div class="empty2">empty</div>

        <div class="every">
            <strong class="title1">홍보</strong>
        </div>  
        
        <div class="empty3">empty3</div>
        <div class="empty4">empty4</div> 
       
    </div>   
    
    <div class="footer">
        <footer>
            footer
        </footer>
    </div>
</body>
</html>
 