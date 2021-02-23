<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${root }/resources/js/joincheck.js"></script>
<script src="${root }/resources/js/address.js"></script>
<script type="text/javascript">
</script>
<script>
$(document).ready(function() { 	
	$("#id").blur(function() {
		var idt = /^[a-z]+[a-z0-9]{4,12}$/;
		var id = $('#id').val();
		
		$.ajax({
			url : root + '/member/check_id?id=' + id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x :" + data);

				if (data === '1') {
					// 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다 :p");			
					document.getElementById("signUpIdCheck").value = "0";
				} else {
					if (idt.test(id)) {
						$("#id_check").text("");
						document.getElementById("signUpIdCheck").value = "1";
					} else if (id === "") {
						$('#id_check').text('아이디를 입력해주세요 :p');
						document.getElementById("signUpIdCheck").value = "0";
					} else {
						$('#id_check').text("[아이디는 소문자와 숫자 4~12자리만 가능합니다.]");
						document.getElementById("signUpIdCheck").value = "0";
					}
				}
			},
			error : function() {
				console.log("실패");
			}
		});
	});
	
	$("#password").blur(function() {
		var pw1 = $('#password').val();
		var pw2 = $('#confirmPassword').val();
		var pwt = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		
			if (pwt.test(pw1)) {
				$('#password_check').text("");
				document.getElementById("signUpPwCheck").value = "1";
			} else if(pw1 == "") {
				$('#password_check').text("비밀번호를 입력하세요");
				document.getElementById("signUpPwCheck").value = "0";
			} else {
				$('#password_check').text("[비밀번호는 영문,숫자, 특수문자~`!@#$%\^&*()-+=를 조합하여 8자 이상으로 만들어주세요.]");
				document.getElementById("signUpPwCheck").value = "0";
			}							
	}); 
	
	$("#confirmPassword").blur(function() {				
		var pw1 = $('#password').val();
		var pw2 = $('#confirmPassword').val();
		var pwt = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
			
									
			if ((pw1 == pw2) && pwt.test(pw2)) {
				$('#confirm_check').text("");	
				document.getElementById("signUpRePwCheck").value = "1";
			} else if ((pw1 == pw2) && !pwt.test(pw2)){
				$('#confirm_check').text("");
				document.getElementById("signUpRePwCheck").value = "0";
			} else if ((pw1 =! pw2) && !pwt.test(pw2)) {					
				$('#confirm_check').text("비밀번호가 일치하지 않습니다.");	
				document.getElementById("signUpRePwCheck").value = "0";
			} else {
				$("#confirm_check").text("비밀번호가 일치하지 않습니다.");
				document.getElementById("signUpRePwCheck").value = "0";
			} 							
		if (pw2 == ''){
			$('#confirm_check').text("비밀번호 확인을 입력하세요");
			document.getElementById("signUpRePwCheck").value = "0";
		}									
	});	
	
	$("#name").blur(function() {
		var namet = /^[가-힣]{2,6}$/;
		var name = $('#name').val();
		
		if (namet.test(name)) {
			$('#name_check').text("");
			document.getElementById("signUpNameCheck").value = "1";
		} else if(name == "") {
			$('#name_check').text("이름을 확인해주세요.");
			document.getElementById("signUpNameCheck").value = "0";
		} else {
			$('#name_check').text("[한글로 이루어진 2~6자리의 이름만 사용가능합니다.]");
			document.getElementById("signUpNameCheck").value = "0";
		}
	});
	
	$("#email").blur(function() {
		var emailt = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = $('#email').val();
		
		$.ajax({
			url : root + '/member/check_email?email=' + email,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x :" + data);

				if (data === '1') {
					// 아이디가 중복되는 문구
					$("#email_check").text("사용중인 이메일 입니다.");
					document.getElementById("signUpEmailCheck").value = "0";
				} else {
					if (emailt.test(email)) {
						$("#email_check").text("");
						document.getElementById("signUpEmailCheck").value = "1";
					} else if (email === "") {
						$('#email_check').text('이메일을 입력해주세요.');
						document.getElementById("signUpEmailCheck").value = "0";
					} else {
						$('#email_check').text("알맞지 않은 형식입니다.");
						document.getElementById("signUpEmailCheck").value = "0";
					}
				}
			},
			error : function() {
				console.log("실패");
			}
		});
	});
	 
});
</script>
<style type="text/css">
body {
	background-color: lightslategrey;
}

.wrapper_join {
	padding: 10%;
}  

.join_content {
	background-color: white;
}

.header h1 { 
	text-align: center;
	color: thistle;
}

.header {
	margin-top: 50px;
	margin-bottom: 50px;
}


</style> 
<title>Insert title here</title>
</head>
<body>

		<div class="header">
			<h1><a href="${root }/">진수성찬</a></h1>  
		</div>
	

<div class="wrapper_join">
	
	<div class="join_content">
		<div class="join_header">
			<h3>회원가입</h3>
		</div>
	
	<form id="join_form" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
		<input type="hidden" name="auth" value="ROLE_MEMBER"/>
			
				<div class="id_pw_field">	
				
						<div class="id-form">						
							<div class="input_field">		
								<label><i class="fa fa-user"></i>아이디<br>
								<input type="text" class="input_id" name="id" id="id"> 
								</label>							
								<small class="check_font" id="id_check"></small> 			 							
							</div>			 			
						</div>
															
						<div class="password-form">			
							<div class="input_field">
								<label><i class="fa fa-unlock-alt"></i>비밀번호<br>
								<input type="password" class="password" name="password" id="password">
								<small class="check_font" id="password_check"></small>					
								</label>
							</div>
						</div>
				
						<div class="form-group">
							<div class="input_field">
								<label><i class="fa fa-unlock-alt"></i>비밀번호 확인<br>
								<input type="password" class="confirmPassword" id="confirmPassword">
								</label>
								<small class="check_font" id="confirm_check"></small>													
							</div>
						</div>	
							
				</div>
		
				
		
				<div class="info-form">
								
						<div class="input_field"> 
							<label><i class="fa fa-user"></i>이름<br>
							<input type="text"class="name" name="name" id="name">
							</label>
							<small class="check_font" id="name_check"></small>						
						</div>
							
						<div class="input_field">
							<label><i class="fa fa-share" aria-hidden="true"></i>이메일<br>
							<input type="text" class="email" name="email" id="email">
							</label>
							<small class="check_font" id="email_check"></small>				
						</div>
				</div>
				
		<p>*<strong>주소정보</strong>는<strong>선택</strong>입력 정보이며<strong>방청 및 방송참여, 경품 이벤트</strong>시 필요합니다.</p>
				
				
			<div class="post">
				<div class="form-group">
					<div class="input_field">
						<label>우편 번호<br>
						<input type="text" class="add1" name="add1" id="sample6_postcode"
							 readonly style="width:100px; text-align:center"> 
						</label> 
					</div>				
						<small class="check_font" id="add1_check"></small>
					</div>
					
				<div class="form-group">
					<div class="input_button">
						<button class="postCode"
						 type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						우편번호 찾기</button>
					</div>
				</div>
			</div>
				
				
		<div class="post2">
			
				<div class="form-group">
					<div class="input_field">
						<label><i class="fa fa-map-marker"></i>주소<br>
						<input style="width:600px;" type="text" class="add2" name="add2" id="sample6_address"
							readonly>
						</label>
					</div>
						<small class="check_font" id="add2_check"></small>
				</div> 
						
				<div class="form-group"> 
					<div class="input_field"> 
						<input style="width:100px; text-align:center;"type="text" class="add4" name="add4"
							id="sample6_extraAddress" readonly >
					</div>
						<small class="check_font" id="add4_check"></small>		 		
				</div>
						
		</div>
			
					
				<div class="form-group">
					<div class="input_field">
						<label><i class="fa fa-map-marker"></i>상세주소<br>
						<input style="width:700px" type="text" class="add3" name="add3"
							id="sample6_detailAddress">
						</label>
					</div>
						<small class="check_font" id="add3_check"></small>
				</div>
					
																						
			
		<button id="insertCustomer" type="button" onclick="checkAll()" value="회원가입">회원가입</button>
				
	</form> 		 
	</div>
</div>			 
	


<input hidden type="text" id="signUpIdCheck" name="signUpIdCheck" >
<input hidden type="text" id="signUpPwCheck" name="signUpPwCheck" >
<input hidden type="text" id="signUpRePwCheck" name="signUpRePwCheck" >
<input hidden type="text" id="signUpNameCheck" name="signUpNameCheck" >
<input hidden type="text" id="signUpEmailCheck" name="signUpEmailCheck" >

</body>
</html>