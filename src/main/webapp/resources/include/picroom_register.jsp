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

$(document).ready(function() {
	$("#pictureRoom-submit-btn1").click(function(e) {
		e.preventDefault();
		$(this)
		 .attr("disabled", "disabled")
		 .html('<i class="fas fa-spinner fa-spin"></i>');
		
		var formData = new FormData($("#pictureRoom-form1")[0]);
		
		$.ajax({
			url: appRoot + '/picroom/register',
			type: 'POST',
			data: formData,
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        //headers: {${_csrf.headerName}: '${_csrf.token}'}
	        beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            }
		 })
		 .done(function(data) {
			console.log("성공");
			$("#pictureRoomToGetLink1").attr("href", $("#pictureRoomToGetLink1").attr("href") + data);
			$("#pictureRoom-modal-body1").text("새 글을 등록하였습니다.");
			$("#pictureRoom-modal1").modal("show");
			$("#pictureRoom-submit-btn1").removeAttr("disabled");
		 })
		 .fail(function() {
			console.log("실패");
			$("#pictureRoom-modal-body1").text("등록 실패하였습니다.");
			$("#pictureRoom-modal1").modal("show");
		 });
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
<form id="pictureRoom-form1" action="${root }/picroom/register" method="post" enctype="multipart/form-data">
  <%-- <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/> --%> 
  <div class="form-group">
    <label for="pictureRoom-input1">제목</label>
    <input name="title" type="text" class="form-control" id="pictureRoom-input1">
  </div>
  <div class="form-group">
    <label for="pictureRoom-textarea1">내용</label>
    <textarea name="content" class="form-control" id="pictureRoom-textarea1" rows="3"></textarea>
  </div>
   <div class="form-group">
    <label for="pictureRoom-file1">사진</label>
    <input type="file" name="file" accept="image/*" class="form-control-file" id="pictureRoom-file1">
  </div>
  <input type="hidden" name="memberId"  value='<sec:authentication property="principal.username"/>' />
  <button id="pictureRoom-submit-btn1" type="submit" class="btn btn-primary">등록</button>
</form>
</div>

</body>
</html>