<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	.header_title {
		border-bottom: 1px silver solid;
		margin-top: 10px;	
		padding: 5px 0px 0px 0px;
		height: 30px;
	}
	
	.header_title h6 {
		margin-left: 10px;	
	} 
	
	.register_wrapper {
		margin: 30px 40px 10px 40px;
	}
	
	.tit_input {
		margin-bottom: 20px; 
	}
	.tit_input input {
		outline: none;
		border: 1px solid silver;	
	}
	
	.con_input textarea {
		resize: none;
		outline: none;
		border: 1px silver solid;
		margin-bottom: 10px;
		text-align: center;
		border-radius: 5px 5px;
	}
	
	.reg_btn {
		background-color: lightgrey;
		color: snow;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
		margin-right: 5px;
	}
	
	.wri_input {
		outline: none;
		border: none;
		background-color: snow;
		color: grey;
	}
	.tit_input {
		border-bottom: 1px solid silver;
		height: 40px;
		margin-bottom: 20px;
	}
	.tit_input input {
		border: none;
		outline: none;
		text-align: center;
	}
	.tit_content {
		padding: 20px 100px 20px 100px;  
		background-color: white;
		margin-bottom: 10px;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 5px 5px;
	}

</style>

<script type="text/javascript">
	var root = '${root}';
	
</script>
<script type="text/javascript">
	$(document).ready(function(e){
		
	
	$('button[data-oper=cancel]').click(function(e){
			todoForm.submit();
			
		});
	
});	
</script>		


<title>Insert title here</title>
</head>
<body>
<div class="header_title">
<h6>다시듣기</h6>
</div>

			<div class="register_wrapper">

				<form method="post"  action="${root }/replay/register"  enctype="multipart/form-data">			
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				
				<div class="tit_content">
					<div class="tit_input">
					<input name="title" type="text"
						 placeholder="제목을 입력하세요.">
					</div>
					
					<div class="con_input">						
						<textarea name="content" 
							cols="30" rows="20" placeholder="내용을 입력하세요."></textarea>
					</div>

					<div class="con_input">
						<input name="file" type="file" accept="audio/* " class="file_button">
					</div>
					</div>
					
					<!-- accept 어트리뷰트 설정타입 = MIME타입  audio/*-->		
						 <!-- 이미지 파일만 넣고 싶을때 -->
						

					<div class="">
						<input name="writer" type="text"
							class="wri_input" value="<sec:authentication property='principal.member.id'/>">
					</div>
					

					<button type="submit" class="reg_btn">등록</button>
				</form>
			</div>
	<div class="d-none">
		<form id="todoForm" action="${root }/replay/list">
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
		</form>
	</div>
	

</body>
</html>




