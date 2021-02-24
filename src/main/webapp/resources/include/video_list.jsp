<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
		
		
	var message = '${message}';
	
		
		
		checkModal(message);
		
		history.replaceState({}, null, null);
		
		function checkModal(message) {
			if (message && history.state == null) {
				
				$("#myModal").modal("show");
			}
		}
		
		
	
	});
</script>


<script type="text/javascript">
	$(document).ready(function(){
		var todoForm = $('#todoForm');
		
		$('button[data-oper=register]').click(function(e){
			todoForm.attr("action", root+"/video/video_register");
			todoForm.submit();
		});
		
		$('button[data-oper=delete]').click(function(e){
			todoForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>");
							 
			
			todoForm.find('input[name=video_bno]').val($(this).attr('value'));
			todoForm.attr("method", "post");
			todoForm.attr("action", root+"/video/video_delete");
			todoForm.submit();
		});
		
		
		$('button[data-oper=review]').click(function(e){
			todoForm.find('input[name=video_bno]').val($(this).attr('value'));
			todoForm.attr("action", root+"/video/video_read");
			todoForm.submit();
		});
		
		$(".page-nav a").click(function(e) {
			e.preventDefault();
			
			todoForm.find("[name='pageNum']").val($(this).attr('href'));
			
			todoForm.submit();
		});
		
		
		
		
	});
</script>

<title>Insert title here</title>

<style type="text/css">
.video-list {
	margin: 3%;
	padding: 3%;
}


#register-button {	
	margin-top: 20px;
	width: 100px;
}






.v_list_wrap{
	width: 100%;
	display: inline-block;
}

.left-tab{
	float: left;
}

.rigth-tab{
	float: left;
}

.page-nav {
	display: flex;
}
.page-nav ul {
	display: flex;
	list-style: none;
	justify-content: center;
}

.page-nav ul li {
	color: snow;
}


	.num {
		border-radius: 3px 3px;
		text-decoration: none;
		border: 1px silver solid;		
		display: inline-block;
		width: 30px;
		background-color: lightslategrey;
		text-align: center;
		color: white;
	}
	
	.priLi, .numLi, .nexLi {
		padding: 0;
	}
	
	.pri, .nex {
		border-radius: 3px 3px;
		text-decoration: none;
		border: 1px silver solid;
		display: inline-block;
		width: 50px;
		background-color: lightslategrey; 
		text-align: center;
		color: white;
		
	}
	
	.pri:hover {
		text-decoration: none;
		background-color: snow;
		color: lightslategrey;
	}
	
	.num:hover {
		text-decoration: none;
		background-color: snow;
		color: lightslategrey;
	}
	
	.nex:hover {
		text-decoration: none;
		background-color: snow;
		color: lightslategrey;
	}
	
</style>
</head>
<body>





<div class="video-list">
	<h3>보이는 라디오</h3>
	
	
	<!-- 게시판 -->
	<div class="v_list_wrap">
		<ol class="list-group">
			<c:forEach items="${list }" var="videoVO">
				<li class="list-group-item list-group-item-dark">
					<c:out value="${videoVO.video_title }"/>
				</li>
				
				<li class="list-group-item list-group-item-dark">
					<c:out value="${videoVO.video_date }"/>
				</li>
				<li class="list-group-item list-group-item-dark">
					<img alt="" class="img-fluid" src="${staticPath }${videoVO.video_thumbnail}">
					<button type="button" class="btn btn-secondary" 
						data-oper="review" value="${videoVO.video_bno }">다시보기</button>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">		
					<button type="button" class="btn btn-light" 
						data-oper="delete" value="${videoVO.video_bno }" >삭제하기</button>
					</sec:authorize>	
				</li>
			</c:forEach>
		</ol>
		
		
	</div>
	
	
	<!-- 페이지네이션 -->
	<div class="page-nav">
		<ul class=""> 		
		<!-- prev -->
		<c:if test="${pageInfo.prev }">
			<li class="priLi">
			<a class="pri" href="${pageInfo.startPage-10 }">이전</a>
			</li>
		</c:if>
		
		<!-- pageButton -->
		<c:forEach var="num" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			
			<li class="numLi ${pageInfo.video_Criteria.pageNum == num ? 'active' :'' }">
			<a class="num" href="${num }">${num }</a>
			</li>
		</c:forEach>
		
		<!-- next -->
		<c:if test="${pageInfo.next }">
		
			<li class="nexLi">
			<a class="nex" href="${pageInfo.startPage+10 }">다음</a>
			</li>
			
		</c:if>
		</ul>
	</div>
	
	
	<!-- 페이지이동버튼 -->
	<div id="register-button">
		<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
		<button type="button" data-oper="register" class="btn btn-secondary">작성하기</button>
		</sec:authorize>
	</div>
	
	
	
	<!-- 액션폼 -->
	<div class="d-none">
		<form id="todoForm" action="${root }/video/video_list">
			<input type="hidden" name="video_bno" value="1">
			<input type="hidden" name="pageNum" value="${pageInfo.video_Criteria.pageNum}">
			<input type="hidden" name="amount" value="${pageInfo.video_Criteria.amount }">
		
			<input type="submit"/>
		</form>
	</div>
</div>
</body>
</html>