<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${root }/resources/css/all.min.css" />
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
var appRoot = '${root}';
var pictroomStaticPath = '${picRoomStaticPath}';
$(document).ready(function() {
	$("#pictureRoom-modify-btn1").hide();
	// $("#pictureRoom-delete-btn1").hide();
	$("#pictureRoom-file1").hide();
	
	var picRoomModal = $("#pictureRoom-modal1");
	$("#pictureRoom-modify-btn1").click(function() {
		picRoomModal.find(".modal-title").text("글 수정");
		picRoomModal.find(".modal-body").
		text("수정하시겠습니까?");
		$("#pictureRoom-modal-confirm-btn1").show();
		$("#pictureRoom-modal-delete-btn2").hide();
		picRoomModal.modal("show");
	});
	
	$("#pictureRoom-delete-btn1").click(function() {
		picRoomModal.find(".modal-title").text("글 삭제");
		picRoomModal.find(".modal-body").text("삭제하시겠습니까?");
		$("#pictureRoom-modal-confirm-btn1").hide();
		$("#pictureRoom-modal-delete-btn2").show();
		picRoomModal.modal("show");
	});
	
	$("#pictureRoom-modify-btn2").click(function() {
		$("#pictureRoom-modify-btn1").show();
		$("#pictureRoom-delete-btn1").show();
		$("#pictureRoom-file1").show();
		$(this).hide();
		$("#pictureRoom-form1").find("input, textarea").removeAttr("readonly");		
	});
	
	$("#pictureRoom-modal-confirm-btn1").click(ajaxModify);
	$("#pictureRoom-modal-delete-btn2").click(ajaxDelete);
	
	function ajaxDelete() {
		$("#pictureRoom-modal-delete-btn2")
		 .attr("disabled", "disabled")
		 .html('<i class="fas fa-spinner fa-spin"></i>');
		$("#modal2-success-footer").hide();
		$("#modal2-fail-footer").hide();
		var formData = new FormData($("#pictureRoom-form1")[0]);
		$.ajax({
			url: appRoot + '/picroom/delete',
			type: 'POST',
			data: formData,
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            }
		 })
		 .done(function() {
			console.log("성공"); 
			$("#pictureRoom-modal-body3").text("삭제 성공하였습니다.");
			$("#pictureRoom-modal3").modal("show");
			$("#pictureRoom-submit-btn1").removeAttr("disabled");
			$("#modal2-success-footer").show();
		 })
		 .fail(function() {
			console.log("실패");
			$("#pictureRoom-modal-body3").text("삭제 실패하였습니다.");
			$("#pictureRoom-modal3").modal("show");
			$("#modal2-fail-footer").show();
		 });
	}
	
	function ajaxModify() {
		$("#pictureRoom-modal-confirm-btn1")
		 .attr("disabled", "disabled")
		 .html('<i class="fas fa-spinner fa-spin"></i>');
		$("#modal2-success-footer").hide();
		$("#modal2-fail-footer").hide();
		var formData = new FormData($("#pictureRoom-form1")[0]);
		$.ajax({
			url: appRoot + '/picroom/modify',
			type: 'POST',
			data: formData,
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            }
		 })
		 .done(function() {
			console.log("성공"); 
			$("#pictureRoom-modal-body2").text("수정 성공하였습니다.");
			$("#pictureRoom-modal2").modal("show");
			$("#pictureRoom-submit-btn1").removeAttr("disabled");
			$("#modal2-success-footer").show();
		 })
		 .fail(function() {
			console.log("실패");
			$("#pictureRoom-modal-body2").text("수정 실패하였습니다.");
			$("#pictureRoom-modal2").modal("show");
			$("#modal2-fail-footer").show();
		 });
	}
});
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
<form id="pictureRoom-form1" action="${root }/picroom/register" method="post" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/> 
   <div class="form-group">
    <label for="pictureRoom-textarea1">등록일</label>
    <fmt:formatDate pattern="yyyy-MM-dd" 
              value="${vo.regdate }" />
   </div>
 
  <div class="form-group">
    <label for="pictureRoom-input1">제목</label>
    <input readonly name="title" value="${vo.title }" type="text" class="form-control" id="pictureRoom-input1">
  </div>
  <div class="form-group">
    <label for="pictureRoom-textarea1">내용</label>
    <textarea readonly name="content" class="form-control" id="pictureRoom-textarea1" rows="3"><c:out value="${vo.content }" /></textarea>
  </div>
   <div class="form-group">
	<img class="img-fluid" src="${picRoomStaticPath}${vo.fileName}" />
  </div>
   
  
  <div id="pictureRoom-file1" class="form-group">
    <label for="pictureRoom-file1">사진</label>
    <input type="file" name="file" accept="image/*" class="form-control-file" id="pictureRoom-file1">
  </div>
  <input type="hidden" name="memberId" value="${vo.memberId }"/>
  <input type="hidden" name="id" value="${vo.id }" />
  
	  
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	  <button id="pictureRoom-modify-btn1" type="button" class="btn btn-primary">수정</button>
	  <button id="pictureRoom-modify-btn2" type="button" class="btn btn-primary">수정</button>
	  <button id="pictureRoom-delete-btn1" type="button" class="btn btn-danger">삭제</button>
	</sec:authorize>
 	 <a href="${root }/picroom/list" class="btn btn-primary">목록</a>
  
</form>
</div>

</body>
</html>