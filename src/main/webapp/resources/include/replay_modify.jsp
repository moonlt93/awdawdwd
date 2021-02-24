<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var root = '${root}';
</script>
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

<script>
$(document).ready(function() {
	$("#remove-btn").click(function(e) {
		e.preventDefault();
		
		// #modify-form 의 action attr 값을 바꿔야함.
		$("#modify-form").attr("action", root + "/replay/remove");
		
		$("#modify-form").submit();
	});
});
</script>
<style type="text/css">
	body{
		padding: 0px;
		margin: 0px;
	}
	
	.mod_wrapper {
		margin: 30px 40px 10px 40px;
	}
	
	.title_input input {
		border: none;
		outline: none;
		border-bottom: 1px solid silver;
		height: 40px;
		text-align: center;
		width: 500px;
		margin-bottom: 10px;
	}
	
	.content_txt {
		border: 1px solid silver;
		outline: none;	
		resize: none;	
		outline: none;
		margin-top: 20px;
		margin-bottom: 20px;
		border-radius: 5px 5px;
		width: 500px;
		text-align: center;
	}
	
	.content_txt::-webkit-scrollbar { 
		display:none; 		
	}
	.writer_input {
		margin: 10px;
	}
	
	.writer_input input {
		outline: none;
		border: none;
		background-color: white;
	}
	.mod_del {
		background-color: lightgrey;
		color: snow;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
		margin-right: 5px;
	}
	
	.header_title {
		border-bottom: 1px silver solid; 
		padding: 5px 0px 0px 0px;
		height: 30px;
	}
	.header_title h6 {
		margin-left: 10px;	
	} 
	.con {
		padding: 20px 0px 20px 0px;
		background-color: white;
		justify-content: center;
		margin-bottom: 10px;
		margin-left: 10px;
		margin-right: 10px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="header_title">
<h6>다시듣기</h6>
</div>
	<div class="mod_wrapper">
		<div class="">
			<div class="">
				<form id="modify-form" method="post" action="${root }/replay/modify">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				
				<div class="con">
					<input hidden name="bno" type="text"readonly value="${board.bno }" />
					<div class="title_input">
						<input name="title" type="text"
						class="title_txt" value='<c:out value="${board.title }" />'>
					</div>

					<div class="content_input">
						<textarea name="content" class="content_txt" id="textarea1"
						 cols="10" rows="10" ><c:out value="${board.content }"/></textarea>
					</div>

					<div class="writer_input">
						<input name="writer" type="text"
						class="" readonly value='<c:out value="${board.writer }" />'>
					</div>
				</div>

					<input type="hidden" value="${cri.pageNum }" name="pageNum" />
					<input type="hidden" value="${cri.amount }" name="amount" />
					<input type="hidden" value="${cri.keyword }" name="keyword" />
					<input type="hidden" value="${cri.type }" name="type" />
					<button type="submit" class="mod_del">수정</button>
					<button id="remove-btn" type="submit" class="mod_del">삭제</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>




