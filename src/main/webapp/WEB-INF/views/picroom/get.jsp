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
<style type="text/css">
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

        <div class="corner">     
             <jsp:include page="/resources/include/main_corner.jsp" />  
        </div> 
        
        
        <div class="weekday">
            <jsp:include page="/resources/include/main_dayintro.jsp" />
        </div>  
        					

       <div class="main">
       		<jsp:include page="/resources/include/picroom_get.jsp" />
       </div>
       
       <div class="empty1">

       </div>
        
    </div>
    
    <div class="footer">
        <footer>
            footer
        </footer>
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