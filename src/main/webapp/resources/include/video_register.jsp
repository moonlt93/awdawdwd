<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<script type="text/javascript">
	var root = '${root}';
</script>

<script type="text/javascript">
	$(document).ready(function(e){
	
		var registerForm = $('#registerForm');
		var todoForm = $('#todoForm');
		
		$('button[data-oper=register]').click(function(e){
			if(!registerForm.find("[name='video_title']").val()){
				alert("제목을 입력하세요");
				return false;
			}
			
			if(!registerForm.find("[name='thumbnail']").val()){
				alert("썸네일을 선택하세요");
				return false;
			}
			
			if(!registerForm.find("[name='vod']").val()){
				alert("영상을 선택하세요");
				return false;
			}
			
			if(!registerForm.find("[name='video_date']").val()){
				alert("방송일을 선택하세요");
				return false;
			}
			
			registerForm.submit();
		});
		
		$('button[data-oper=cancel]').click(function(e){
			todoForm.submit();
		});
});
</script>


<style>
.video-register {
	margin: 3%;
	padding: 3%;
}
.form-floating :placeholder-shown{
}
</style>
<title>Insert title here</title>
</head>
<body>


<div class="video-register">
	
	<form id="registerForm" action="${root }/video/video_register" 
	               enctype="multipart/form-data" method="post">
		
		<label for="input1">제목</label>
		<input id="input1" type="text" name="video_title" placeholder="제목">
		
		<label for="input2">방송일</label>
		<input id="input2" type="date" name="video_date"  value="2020-01-01"
      			 min="2021-01-01" max="2022-12-31">
      	
      	<label for="input3">썸네일</label>
		<input name="thumbnail" type="file" accept="image/*" class="form-control" 
					placeholder="썸네일" id="input3" >
		
		<label for="input4">영상</label>
		<input name="vod" type="file" accept="video/*" class="form-control" 
					placeholder="영상" id="input4" >
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
		<input type="hidden" name="video_thumbnail" value="">
		<input type="hidden" name="video_vod" value="">

		<input type="submit" />
	</form>



	
	<div class="btn-group">
		<button data-oper="register" type="button" class="btn btn-secondary">작성하기</button>
	  	<button data-oper="cancel" type="button" class="btn btn-light">취소</button>
	</div>
	
	<div class="d-none">
		<form id="todoForm" action="${root }/video/video_list">
			<input type="hidden" name="pageNum" value="${video_Criteria.pageNum }">
			<input type="hidden" name="amount" value="${video_Criteria.amount }">
			
		</form>
	</div>
	
</div>

</body>
</html>
