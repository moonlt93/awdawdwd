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
		
		
		$('button[data-oper=modify]').click(function(e){
			todoForm.append('<input type="hidden" name="video_bno" value="${videoVO.video_bno }">');
			todoForm.append("<input type='hidden' name='video_title' value='${videoVO.video_title}'>");
			todoForm.append("<input type=text name='video_date' value='${videoVO.video_date}'>");
			todoForm.append("<input type=text name='video_thumbnail' value='${videoVO.video_thumbnail}'>");
			todoForm.append("<input type=text name='video_vod' value='${videoVO.video_vod}'>");
			
			todoForm.attr("action", root+'/video/video_modify');
			
			todoForm.submit();
		});
		
		$('button[data-oper=list]').click(function(e){
			
			todoForm.submit();
		});
		
		$('button[data-oper=delete]').click(function(e){
			
			todoForm.append("<input type='hidden' name='video_bno' value='${videoVO.video_bno}'>");
			todoForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>");
			
			todoForm.attr("method", "post");
			todoForm.attr("action", root+"/video/video_delete");
			todoForm.submit();
		});
	});
</script>
<title>Insert title here</title>
<style type=text/css>
.video-read {
	margin: 3%;
	padding: 3%;
}
</style>
</head>
<body>

<h1>videoRead</h1>


	<div class="row justify-content-center">
		<div class="col-lg-12">	
			<div class="form-group">
							<label for="input1">영상</label>
							<video width="400" height="240" controls autoplay>
  							<source src="${staticPath2 }${videoVO.video_vod}" >
  							이 브라우저는 재생할 수 없습니다.
							</video>
			</div>
						
			<div class="form-group">
							<label for="input1">조회수</label>
							<input class="form-control" type="text" id="input1" readonly 
								value="<c:out value='${videoVO.video_view_cnt }'/>"/>
			</div>
						
			<div class="form-group">
				<label for="input2">제목</label>
				<input class="form-control" type="text" id="input2" readonly
				    value="<c:out value='${videoVO.video_title }'/>"/>
			</div>						
		</div>
	</div>
	
	
	<div class="btn-group">
		<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
			<button type="button" data-oper="modify" class="btn btn-secondary">수정하기</button>
			<button type="button" data-oper="delete" class="btn btn-light">삭제하기</button>
		</sec:authorize>
			<button type="button" data-oper="list" class="btn btn-secondary">목록으로</button>
	</div>
	
	
	
	<div class="d-none">
		<form id="todoForm" action="${root }/video/video_list">
			<input type="hidden" name="pageNum" value="${video_Criteria.pageNum }">
			<input type="hidden" name="amount" value="${video_Criteria.amount }">
			
			<input type="submit"/>
		</form>
	</div>

	
	

</div>
	
	
			
			





</body>
</html>