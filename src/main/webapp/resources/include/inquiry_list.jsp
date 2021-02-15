<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
var inquiryService = (function() {
	function get(rno, callback, error) {
		var rno = $(this).attr('data-rno');
		$.get(root + '/service/' + rno, function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function() {
			if (error) {
				error();
			}
		});
	} 
});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#content_td').click(function() {	
			console.log($(this).attr("data-rno"));
			
			var rno = $(this).attr('data-rno');
			
			inquiryService.get(rno, function(data) {	
	 			$("#rno-input2").val(rno);
	 			$("#reply-input2").val(data.reply);
	 			$("#replyer-input2").val(data.replyer);
	 			$("#reply-modify-modal").modal("show");
	 		});
			var content = "";
			$(".ques").text(content);
			$('.pa').toggle();
			
			});
		}); 
</script>
<title>Insert title here</title>
</head>
<body>
	
	<div class="inquiry">
		<table class="inquiry_list">
			<thead class="inquiry_head">
			<tr>
				<th>문의유형</th>
				<th>문의/답변</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${list }" var="inquiryVO">
				<tr >
					<td>${inquiryVO.type }</td>
					<td><a id="content_td" href="#this" data-rno="${inquiryVO.bno }">${inquiryVO.content }</a></td>
					<td>${inquiryVO.id }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${inquiryVO.regdate }"/></td>
				</tr>					
				</c:forEach>
				<tr class="qa">
					<td>
						<div class="ques">질문</div>
						<div class="answ">답변</div>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	
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
	
	
</body>
</html>















