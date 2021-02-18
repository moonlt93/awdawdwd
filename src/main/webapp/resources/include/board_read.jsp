<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	$(document).ready(function(e){
		
		var operForm = $("#operForm");
		$("button[data-oper='list']").click(function(e){
			
			operForm.attr("action", root + "/board/list");
			
			operForm.submit();
		});

		
		$("button[data-oper='modify']").click(function(e){
			operForm.append("<input type='hidden' name='board_bno' value='"+${boardVO.board_bno}+"'>");
			operForm.attr("action", root + "/board/modify");
			
			operForm.submit();
		});
		
		
		$("button[data-oper='delete']").click(function(e){
			operForm.append("<input type='hidden' name='board_bno' value='"+${boardVO.board_bno}+"'>");
			operForm.attr("method", "post");
			operForm.attr("action", root + "/board/delete");
			
			operForm.submit();
		});	
	});
</script>
<style type="text/css">
	.read-form {
		margin: 3%;
		padding: 3%;
	}
	.board_header {
		background-color: rgb(241, 241, 241);
		border: rgb(241, 241, 241);	
	}
	
	.input_border-content {
		outline: none;
		border: none;
		height: 200px;
	}
	.h5message h5{
		text-align: center;
		color: lightslategrey; 
		margin-bottom: 50px; 
	}
	
	.header1 {
		align-items: center;
	}
	.input_cnt {
		justify-self: end;
	}
	.board_read {		  
		 margin: 5px 0px 5px 0px;
	}		
	
	.input_num {
		font-size: 13px;
		color: grey;
		padding: 3px;
	}
	
	.input_id {
		padding: 3px;
		font-size: 15px;
	}

	.board_content {
		
		margin: 20px 0px 20px 0px; 
	}
	
	.h5message input {
		outline: none;  	
		padding: 5px;
		background-color: snow;
		border: none;	
			 
	}
	
	.board-button { 
		border: solid 1px silver;		
	} 
	
	.btn-list, .btn-modify, .btn-delete {
		margin: 5px;	
	}
	
	
</style>
<title>Insert title here</title>
</head>
<body> 

<div class="read-form">
		
			<div class="h5message">
				<h5><strong>게시물 보기</strong></h5>
				<input class="input_title" readonly value='<c:out value="${boardVO.board_title}" />' 
					type="text" class="" > 
			</div>
			  
			
		<div class="board_read">  	 
			<div class="board_header"> 
				<div class="header1"> 
					<span class="input_num">${boardVO.board_bno }</span>
					<span class="input_id"><i class="fa fa-user">${boardVO.board_id }</i></span>		
					<span class="input_cnt">${boardVO.board_read_cnt }</span>			
				</div>	
						
			</div>
				<input class="input_border" type="text" readonly value="${boardVO.board_bno }" hidden/>
				<input class="input_border" readonly value='<c:out value="${boardVO.board_id }" />' type="text"  class="" id="input_id" hidden >
				<input class="cnt" readonly value='<c:out value="${boardVO.board_read_cnt }" />' type="text" class="" id="input_cnt" hidden >
					    
								  
						  
						 
			<div class="board_content">
					
					 
					
					<input class="input_border-content" readonly
							value='<c:out value="${boardVO.board_content}" />' 
							type="text">
			</div>	
				
					
		
		
		<div class="board-button">
			
  				<button data-oper="list" type="button" class="btn-list">목록으로</button>
			
			
  				<button data-oper="modify" type="button" class="btn-modify">수정하기</button>
			
			
  				<button data-oper="delete" type="button" class="btn-delete">삭제하기</button>
		</div>
		 
		</div>

<div class="d-none">
	<form id="operForm" action="${root }/board/list" method="get">
		<input type="hidden" name="pageNum" value="${board_Criteria.pageNum }">
		<input type="hidden" name="amount" value="${board_Criteria.amount }">
		<input type="hidden" name="type" value="${board_Criteria.type }">
		<input type="hidden" name="keyword" value="${board_Criteria.keyword }">
		<input type="hidden" name="day" value="${board_Criteria.day }">
		
		<input type="submit"/>
	</form>

</div>

</div>



</body>
</html>