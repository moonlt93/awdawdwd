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

@charset "UTF-8";
*{
        margin: 0;
        padding: 0;
    }
    
    	 body {
	background-image: url("${root}/resources/pic/background.jpg");
	background-size: contain;
	}	
    

   .wrapper{      
        display: grid;
        grid-gap: 15px;
        height: 100%;
        grid-template-columns: 1fr 300px 300px 300px 300px 1fr ;
        grid-template-rows:  200px 50px 1fr 1fr 1fr 1fr ;
        grid-template-areas: 'empty2 header header header header empty3'
                             'empty2 nav nav nav nav empty3'
                             'empty2 main main main main empty3'
                             'empty2 main main main main empty3'
                             'empty2 main main main main empty3'
                             'empty2 main main main main empty3'                             
   }
   .wrapper div {
        border-radius: 5px 5px;      
        text-align: inherit;
        display: grid;
   }
   .header {
    grid-area: header;
    color: thistle;
   }
   .nav {
    background-color: snow;
    grid-area: nav;
   } 
  
   .main {
    background-color: snow;
    grid-area: main;
   }
   .empty1 {
    grid-area: empty1;
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
   .title1 {
       padding: 10px 10px 0px 10px;
       font-size: 15px;
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
 
   i {
       color: grey;
       margin-right: 5px;
   }

   .week {
       background-color: black;
       color: white;
   }
   
   #minListIframe {
   	width: 100%;
   	height: 100%;
   	border-radius: 5px 5px;
   }
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="header2">
          <jsp:include page="/resources/include/main_header.jsp" />
    </div>
    <div class="wrapper">  

        <div class="header">
            <h1><a class="moon" href="${root }/">Moon's radio</a></h1>
        </div> 

        <div class="nav">
              <jsp:include page="/resources/include/main_nav.jsp" />                  
        </div>
        				
       <div class="main">
       		<jsp:include page="/resources/include/picroom_get.jsp" />
       </div>
       
       <div class="empty1">

       </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="/resources/include/main_footer.jsp" />
    </div>
    
    <!-- 수정/삭제 선택 -->
<div id="pictureRoom-modal1" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" >글 수정</h5>
      </div>
      <div id="pictureRoom-modal-body1" class="modal-body">
        수정하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button id="pictureRoom-modal-confirm-btn1" class="btn btn-danger">확인</button>
        <button id="pictureRoom-modal-delete-btn2" class="btn btn-danger">삭제</button>
      </div>
    </div>
  </div>
</div>

<!-- 수정 결과 -->
<div id="pictureRoom-modal2" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" >수정 결과</h5>
      </div>
      <div id="pictureRoom-modal-body2" class="modal-body">
        ...
      </div>
      <div id="modal2-fail-footer" class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
      <div id="modal2-success-footer" class="modal-footer">
        <a href="${root }/picroom/list" class="btn btn-primary">목록</a>
        <a href="${root }/picroom/id/${vo.id }" class="btn btn-primary">게시글</a>
      </div>
    </div>
  </div>
</div>

<!-- 삭제 결과 -->
<div id="pictureRoom-modal3" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" >삭제 결과</h5>
      </div>
      <div id="pictureRoom-modal-body3" class="modal-body">
        ...
      </div>
      <div id="modal3-fail-footer" class="modal-footer">
        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> -->
      </div>
      <div id="modal3-success-footer" class="modal-footer">
        <a href="${root }/picroom/list" class="btn btn-primary">목록</a>
   
      </div>
    </div>
  </div>
</div>


</body>
</html>