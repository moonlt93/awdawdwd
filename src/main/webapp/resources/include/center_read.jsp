<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head> 
<script type="text/javascript">
	var root = '${root}'
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
$(document).ready(function(){

	var form = $("#form");
	
	$("#delete_btn").click(function(){
		form.append("<input type='hidden' name='center_bno' id='test_bno' value='" + ${CenterVO.center_bno} +"'>");		
		form.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }'>");

		form.attr("method", "post");
		form.attr("action", root + "/service/delete_member");
				
		form.submit(); 
	});
	
	var replyForm = $('#reply_form');
	
	$("#com_reply").click(function() {
		replyForm.submit();
	});
	
});
</script>
<title>Insert title here</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	.read_form {
		padding: 50px 100px 50px 100px;
	}
	.read_form div {
		padding: 0;
	}
	.read_header{
		
	}
	.reply_form {
		border-radius: 0px;
	}
	.btn_list_delete {
		width: 100px;
		padding: 0px;
		border-radius: 5px;
		background-color: lightsgrey;
	}
</style>
</head>
<body>

	<div class="read_form">
		<div class="read_header">
			<div>
			${CenterVO.center_type } 
			</div>
			<div>
			${CenterVO.member_id }
			</div>
			<div>
			${CenterVO.center_name }
			</div>
		</div>
	
		<div class="read_content">
			<div>
			${CenterVO.center_title }
			</div>
			<div>
			${CenterVO.center_content }
			</div>
			<div>
			${CenterVO.center_regdate }
			</div>
		</div>
		
		
			<div class="reply_form" style="padding:0px 0px 40px 0px; background-color: grey;">
			</div>
			<div class="reply_form" style="height:80px; margin:0px 0px 20px 0px; border: 1px solid silver;  border-top: none;">			
				<p>${CenterVO.center_reply }</p>	
			
			</div>
	
	
		<div class="btn_group">
			<ul style="list-style: none; display: flex; justify-content: space-between;">
			<li><button id="delete_btn" class="btn_list_delete" type="button">삭제하기</button></li>
			<li><button class="btn_list_delete" type="button">목록으로</button></li>
			</ul>
		</div>

	</div>
	
	
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
	<div class="reply_form">
		<form id="reply_form" action="/service/com_register" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">	
			<input type="hidden" name="center_bno" value="${CenterVO.center_bno }">
			<input type="text" name="center_reply">	
			<button id="com_reply" type="button">답글</button>
		</form>
	</div>
	</sec:authorize>
	
	
	
	<div class="d-none">
		<form id="form" action="/service/member" >
			<input type="text" name="pageNum" value="${cri.pageNum }">
			<input type="text" name="amount" value="${cri.amount }">				
			<input type="submit"/>
		</form>
	</div>

</body>
</html>