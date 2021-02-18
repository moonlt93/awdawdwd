<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var root = '${root}';
</script>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${root }/resources/css/all.min.css" rel="stylesheet">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(e){
		
		var registerForm = $("#registerForm");
		
		$("#register_button").click(function(e){
			
			
			registerForm.submit();
		});

		
		$("button[data-oper='cancel']").click(function(e){
			
			registerForm.attr("method", "get");
			registerForm.attr("action", root + "/serivce/list")
			registerForm.submit();
		});
		
		
	});

</script>

<title>Insert title here</title>
</head>
<body>
<div class="container-sm">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<h5>답변</h5>
			</div>
		</div>	
			
		<div class="row justify-content-center">	
				
		<form method="post" action="${root }/service/register" style="border: 1px solid gray; padding: 20px; margin: 15px">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
			
				<input type="hidden" name="auth" value="ROLE_ADMIN"/>
					회원/로그인
					<input type="radio" name="type" value="회원/로그인">
					서비스/콘텐츠
					<input type="radio" name="type" value="서비스/콘텐츠">
					결제/이용권
					<input type="radio" name="type" value="결제/이용권">
					기타
					<input type="radio" name="type" value="기타">
		  <div class="form-column">
		    <div class="form-group col-md-12">
		      <label for="input-title">내용</label>
		      <input name="content" type="text" class="form-control" id="input-title">
		    </div>
		    <div class="form-group col-md-12">
		      <label for="input-writer">쓴이</label>
		      <input name="id" value='<sec:authentication property="principal.member.id"/>' 
		      readonly type="text" class="form-control" id="input-writer">
		    </div>
		  </div>
	  
	  	<button type="submit" class="btn btn-primary" style="margin: 17px;">등록하기</button>
		</form>				
				
				
				
</div>		

</div>		
			
			
			
		









</body>
</html>