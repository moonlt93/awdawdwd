<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<script>
var root = '${root}';
var bno = ${board.bno};
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
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="${root }/resources/js/board_replay.js"></script>
<style type="text/css">
	body {
		padding: 0px;
		margin: 0px;
	}
	.header_title { 
		border-bottom: 1px silver solid; 
		margin-top: 10px;	
		padding: 5px 0px 0px 0px;
		height: 30px;
	}
	.header_title h6 {
		margin-left: 10px;	 
	}  
	
	.replay_get { 
		margin: 0px 40px 10px 40px;
		margin-top: 20px; 
	}
	
	.tit_con {
		height: 300px;
	}
	
	.t_fmt {
		height: 50px;
		background-color: lightslategrey;
		align-items: center;
		padding: 0px 10px 0px 10px;
		border-bottom: 1px solid silver;
	}
	
	.mod_div {
		margin-top: 10px;
	}
	
	audio { 
		width: 100%;
		
	}
	
	.reply_btn  {
		background-color: lightgrey;
		color: snow;
		margin-right: 5px;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
	}
	.mod_btn {
		background-color: lightgrey;
		color: snow;
		margin-right: 5px;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
	}
	.mod_btn:hover {
		color: grey;
		text-decoration: none;
	}
	
	.reply_btn:hover {
		color: grey;
		text-decoration: none;
		
	}
	.media-body {
		background-color: snow;
		margin-top: 10px;
	}
	#user_i {
		
	}
	.reply_txt {
		border-top: 2px solid white;
		width: 820px; 
	}
	
	.reply_body {
		margin-top: 10px;
		height: 100%;
		background-color: snow;
		font-size: 15px;
	}
	.media-body .re {
		font-weight: bold;
		text-size: 16px;
}
</style>


<title>Insert title here</title>
</head>
<body>
<div class="header_title">
<h6>다시듣기</h6>
</div>

<div class="">
	<div class="replay_get"> 
		<div class="tit_con">
				<div>
					<div class="t_fmt" style="display: flex; justify-content: space-between;">
						<div class="tit">
							<span style="color: white; font-weight: bold; font-size: 18px;"><c:out value="${board.title }" /></span>			
						</div>
						
						<div>
							<span class="fmt_date"><fmt:formatDate pattern="yyyy-MM-dd" value= "${board.regdate }"/></span>
						</div>
					</div>
					
					<div class="audio_div">
										
						 <audio src="${staticPath1}${board.filename }" width='600' controls autoplay></audio>
		
					</div>
				</div>
				
					
					<div class="mod_div" style="display: flex; justify-content: flex-end;">
						<div>
						<button class="reply_btn" id="new-reply-button">댓글 쓰기</button> 
						</div>
							<c:url value="/replay/modify" var="modifyLink">
							<c:param name="bno" value="${board.bno }"></c:param>
							<c:param name="title" value="${board.title }"></c:param>
							
							<c:param name="content" value="${board.content }"></c:param>
							<c:param name="pageNum" value="${cri.pageNum }"></c:param>
							<c:param name="amount" value="${cri.amount }"></c:param>
							<c:param name="type" value="${cri.type }" ></c:param>
							<c:param name="keyword" value="${cri.keyword }" ></c:param>
							</c:url>
						<div>
							<a href="${modifyLink }" class="mod_btn">
								수정
							</a>
						</div>
					</div>
				
		</div>

	<!-- 댓글 목록 container -->
	<div class=" ">
		<div class="">
			<div class="  ">
				
				<div class="">
					<div class="list_button" style="display: flex; justify-content: space-between;">
						<div>
						댓글
						</div>												
					</div>
					
					<div class="">
					
						<ul class="" id="reply-ul">
						
					
							
							
							
						</ul>
					
					</div>
					
				</div>
							
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>




