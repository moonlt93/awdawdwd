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

<title>Insert title here</title>
</head>
<body>


	<div class="">
		<div class="">
			<div class="">

				<form method="post" enctype="multipart/form-data">			
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				
					<div class="">
						<input name="title" type="text"
						class="form-control" id="input1" placeholder="제목을 입력하세요.">
					</div>

					<div class="">
						<textarea name="content" class="form-control" id="textarea1"></textarea>
					</div>
					
					<!-- accept 어트리뷰트 설정타입 = MIME타입  audio/*-->
					<div class="">
						 <!-- 이미지 파일만 넣고 싶을때 -->
						<input name="file" type="file"
							accept="audio/* "
 							class="">
					</div>
					

					<div class="">
						<input name="writer" type="text"
							class="" >
					</div>
					

					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>




