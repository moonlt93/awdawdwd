<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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
<link href="/resources/css/joinform.css" rel="stylesheet" />

<style type="text/css">
.no-border {
	border: 0px;
	background: #ffeeee;
}
</style>

<style>
* {
	margin: 0;
	padding: 0;
}

.img {

}

#myForm {
	position: absolute;
	left: 460px;
	top: 200px;
}

}
</style>



<title>Insert title here</title>
</head>
<body>
	<div class="img">
		<img
			src="/resources/pic/그림.png">
	</div>
	<div class="container">
		<div class="col">
			<div class="sinup-module">
				<label for="userName" class="sinup-text">
					<p>아이디 *</p>
				
						<input type="text"
							class="TextField-module__input--kfks8 TextField-module__medium--2zybh"
							id="userName" name="" placeholder="이름을 입력해주세요."
							value="'<sec:authentication property="principal.member.id"/>'">
					
				</label>
			</div>
			<div class="sinup-module">
				<label for="userName" class="sinup-text">
					<p>이름</p>
					<div>
						<input type="text"
							class="TextField-module__input--kfks8 TextField-module__medium--2zybh"
							id="userName" name="" placeholder="이름을 입력해주세요."
							value="'<sec:authentication property="principal.member.email"/>'">
					</div>
				</label>
			</div>
			<div class="sinup-module">
				<label for="userName" class="sinup-text">
					<p>주소1</p>
					
						<input style="width: 200px;" type="text"
							class="TextField-module__input--kfks8 TextField-module__medium--2zybh"
							id="userName" name="" placeholder="이름을 입력해주세요."
							value="'<sec:authentication property="principal.member.add1"/>'">
					
				</label>
			</div>
			<div class="sinup-module">
				<label for="userName" class="sinup-text">
					<p>등록 일자</p>
				
						<input type="text"
							class="TextField-module__input--kfks8 TextField-module__medium--2zybh"
							id="userName" name="" placeholder="이름을 입력해주세요."
							value="'<sec:authentication property="principal.member.regdate"/>'">
				
				</label>
			</div>

			<div class="sinup-module">
				<label for="userName" class="sinup-text">
					<p>권한리스트</p>
					
						<input type="text" style="width: 200px;"
							class="TextField-module__input--kfks8 TextField-module__medium--2zybh"
							style="width: 200px;" id="userName" name=""
							placeholder="이름을 입력해주세요."
							value="'<sec:authentication property="principal.member.authList"/>'">
					
				</label>
			</div>
		</div>

	</div>




</body>
</html>