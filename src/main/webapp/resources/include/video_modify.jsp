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
	$(document).ready(function(e){
		var root = '${root}';
		var todoForm = $('#todoForm');
		var modifyForm = $('#modifyForm');
		
		$('button[data-oper=modify]').click(function(e){
			if(!modifyForm.find("[name='video_title']").val()){
				alert("제목을 입력하세요");
				return false;
			}
			
			if(!modifyForm.find("[name='thumbnail']").val()){
				alert("썸네일을 선택하세요");
				return false;
			}
			
			if(!modifyForm.find("[name='vod']").val()){
				alert("영상을 선택하세요");
				return false;
			}
			
			if(!modifyForm.find("[name='video_date']").val()){
				alert("방송일을 선택하세요");
				return false;
			}
			
			
			modifyForm.submit();
		});
		
		$('button[data-oper=cancel]').click(function(e){
			todoForm.submit();
		});
		
	});
</script>

<title>Insert title here</title>
<style type="text/css">
.video-modify{
	margin: 3%;
	padding: 3%;
}
</style>
</head>
<body>

<div class="video-modify">
<h1>videoModify</h1>

	<form id="modifyForm" action="${root }/video/video_modify" method="post"  enctype="multipart/form-data">
		<label for="input1">게시물 번호</label>
		<input id="input1" type="text" name="video_bno" value="${videoVO.video_bno }" readonly>
		<label for="input2">제목</label>	
		<input id="input2" type="text" name="video_title" value="${videoVO.video_title }" placeholder="제목">
		<label for="input3">방송일</label>
		<input id="input3" type="date" name="video_date"  value="${videoVO.video_date }"
      			 min="2021-01-01" max="2022-12-31">
      	<label for="input4">썸네일</label>
		<input name="thumbnail" type="file" accept="image/*" class="form-control" 
					placeholder="썸네일" id="input4" >
		<label for="input5">영상</label>
		<input name="vod" type="file" accept="video/*" class="form-control" 
					placeholder="영상" id="input5" >
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="hidden" name="pageNum" value="${video_Criteria.pageNum }">
		<input type="hidden" name="amount" value="${video_Criteria.amount }">
		
		<input type="hidden" name="video_thumbnail" value="1">
		<input type="hidden" name="video_vod" value="2">
		

		<input type="submit" />
	</form>
	
	
	<div class="btn-group">
		<button type="button" data-oper="modify" class="btn btn-secondary">수정하기</button>
		<button type="button" data-oper="cancel" class="btn btn-secondary">취소</button>
	</div>
	


<div class="d-none">
	<form id="todoForm" action="${root }/video/video_read">
		<input type="hidden" name="video_bno" value="${videoVO.video_bno }">	
		<input type="hidden" name="pageNum" value="${video_Criteria.pageNum }">
		<input type="hidden" name="amount" value="${video_Criteria.amount }">	
		<input type="submit"/>
	</form>
</div>
	
	

</div>
	
	
			
			


</body>
</html>