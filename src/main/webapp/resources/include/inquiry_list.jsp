<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="${root }/resources/css/all.min.css" rel="stylesheet">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.inquiry_menu td a').click(function() {			
		var myArticle = $(this).parents().next("tr")
		var answer = document.getElementById('answer');
		var ansVal = $('#answer').attr("value");
		var ansIcon = document.getElementById('id_icon');
		
		
		
		console.log(answer);
		console.log(ansIcon);
		console.log(myArticle);
		
		//제거하고자 하는 엘리먼트
		
		
		if (ansVal === null || ansVal === undefined || ansVal === "") {
			$("#answer").remove();
			$("#id_icon").remove();
		}
	
		
		console.log("click");	
		
		$(myArticle).toggle();
		if(!$(this).parents().next().is(":visible"))
			
		{ 
			$(this).parents().next().slideDown();
		}
	});	
	
	$("#reply_button").click(function() {
		$("#reply_modal").attr("style", "display:block");
			console.log("모달 창 띄움");
			console.log($(this).attr("data-qa"));
	});
});
</script>
<script type="text/javascript">

</script>
<style type="text/css">
	.inquiry {
		margin: 3%; 
		padding: 3%;
	}
	
	tr{
		border-bottom: 1px solid silver;		
	}
	
	.inquiry_thead {
		background-color: darkgrey;
		color: white;
	}
	.page_nav ul{
		list-style: none;		
	}
	#showClose {
		background-color: rgb(241, 241, 241);
		border-bottom: 1px solid silver; 
	}
	#question, #answer {		
		border-radius: 0; 
		font-size: 14px;
		
	}
	#question, #answer {
		display: flex;
	}
	
	.question, .answer {
		padding: 10px 0px 10px 0px;
		color: grey;
	}
	
	#reply_modal {
		display:none;
	}
	
	#reply_modal .modal_content {
  		width:300px;
 		 margin:100px auto;
  		padding:20px 10px;
  		background:#fff;
  		border:2px solid #666;
	}	

	#modal .modal_layer {
  		position:fixed;
  		top:0;
  		left:0;
  		width:100%;
  		height:100%;
  		background:rgba(0, 0, 0, 0.5);
  		z-index:-1;
	}   
	
	#reply_button {
		background-color: rgb(241, 241, 241);
		color: pink;
		font-size: 13px;
		justify-content: flex-end;
	}
</style>
<title>Insert title here</title> 
</head>
<body>

<form action="" id="board_form" method="post">
	<input type="hidden" id="curPage" name="curPage" value="1" />
	
	
	<div class="inquiry">
		<div class="selectBox" style="display: flex; justify-content: flex-end;">
			<select id="type_select" name="inquiry_type">
				<option selected="selected" value="" >문의유형(전체)</option>
				<option value="01">회원/로그인</option>
				<option value="02">서비스/콘텐츠</option>
				<option value="03">결제/이용권</option>
				<option value="04">기타</option>
			</select>
		</div>
	
	<div class="inquiry_div">
		<table class="inquiry_table">		
			<thead class="inquiry_thead">
			<tr>
				<th>번호</th>
				<th>문의유형</th>
				<th>문의/답변</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			</thead>
			
			<tbody id="inquiry_tbody">
				<c:forEach items="${list }" var="inquiryVO">
				<tr class="inquiry_menu">
					<td>${inquiryVO.bno }</td>
					<td>${inquiryVO.type }</td>
					<td><a href="#" data-bno="${inquiryVO.bno }">${inquiryVO.content }</a></td>
					<td>${inquiryVO.id }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${inquiryVO.regdate }"/></td>
				</tr>	
					
				<tr id="showClose" style="display: none;">
					<td>
						<div>
							<i style="color: blue;" class="fas fa-question"></i>
						</div>
						<div id="id_icon">
							<i style="color: red;" class="far fa-comment-dots"></i>
						</div>
					</td>
					<td id="showClose" colspan="4"> 
						<div id="question">						
							<div id="ques" class="question" data-qa="${inquiryVO.bno }">
								${inquiryVO.content }
							</div>	
							<button id="reply_button" type="button" >답변하기</button>
						</div> 												
						<div id="answer" data-qa="${inquiryVO.bno }">							
							<div class="answer" value="">
							</div>
						</div>
					</td> 
				</tr>	
						
				</c:forEach>
			</tbody>		
		</table>
	</div>	
		
	<sec:authorize access="isAuthenticated()">
		<div class="type_button" style="display: flex; justify-content: flex-end;">
			<a style="font-size: 10px;" href="${root }/service/register">문의하기</a>
		</div>
	</sec:authorize>
	</div>	
</form>
	
	
	<div class="page_nav">
		<ul>
			<c:if test="${page.prev }">
				<li>
					<a href="${page.startPage-1 }">이전</a>
				</li>
			</c:if>
			
			<c:forEach var="pageNo" begin="${page.startPage }" end="${page.endPage }">
				<li>
					<a href="${pageNo }">${pageNo }</a>
				</li>
			</c:forEach>
			
			<c:if test="${page.next }">
				<li>
					<a href="${page.endPage+1 }">다음</a>
				</li>
			</c:if>
		</ul>
		
	</div>

<div id="reply_modal">
	<div class="modal_content">
		<form action="">
		<input type="text" name="reply">
		<input type="hidden" value="">
		<button type="button" onclick=""></button>
		</form>
	</div>
	
	<div class="modal_layer"></div>
</div>
</body>
</html>















