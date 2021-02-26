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

.tit_content {
		padding: 40px 100px 40px 100px;  
		background-color: white;
		margin-bottom: 10px;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 5px 5px;
}

.tit_content input {
	margin-bottom: 20px;
	border: 1px solid grey;
}
</style>
</head>
<body>


<div class="header_title" style="border-radius: 0px;">
	<h6>보이는 라디오</h6>
</div>
		
<div class="video-modify">


	<form id="modifyForm" action="${root }/video/video_modify" method="post"  enctype="multipart/form-data">
		
		<div>
		<input hidden id="input1" type="text" name="video_bno" value="${videoVO.video_bno }" readonly class="form-control" >
		
		<span>제목</span>
		<input id="input2" type="text" name="video_title" value="${videoVO.video_title }" placeholder="제목" class="form-control" >
		
		<span>방송일</span>
		<input id="input3" type="date" name="video_date"  value="${videoVO.video_date }" class="form-control" 
      			 min="2021-01-01" max="2022-12-31">
      			 
      	<span>썸네일</span>
		<input name="thumbnail" type="file" accept="image/*" class="form-control" 
					placeholder="썸네일" id="input4" >
					
		<span>영상</span>
		<input name="vod" type="file" accept="video/*" class="form-control" 
					placeholder="영상" id="input5" >
					
					
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="hidden" name="pageNum" value="${video_Criteria.pageNum }">
		<input type="hidden" name="amount" value="${video_Criteria.amount }">
		
		<input type="hidden" name="video_thumbnail" value="1">
		<input type="hidden" name="video_vod" value="2">
		

		<input hidden type="submit" />
		</div>
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