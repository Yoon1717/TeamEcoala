
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="${pageContext.request.contextPath}../css/style.css"
	rel="stylesheet" />
</head>
<body>
	<div class="logo"></div>
	<div class="login-box" style="
    margin-top: 50px";>
		<h2>Login</h2>
		<form method="post"
			action="${pageContext.request.contextPath}/loginDo" id="login-form">
			<div class="user-box">
				<input type="text" name="userId" required=""
					value="${cookie.rememberId.value }" /> <label>Username</label>
			</div>
			<div class="user-box">
				<input type="password" name="userPw" required=""> <label>Password</label>
			</div>
			<!-- 아이디 기억       -->
			<div class="form-floating mb-3" style="color: white;">
				아이디 기억하기 <input class="form-check-input" name="remember"
					type="checkbox" ${cookie.rememberId.value==null ? "":"checked" } />
				<input name="fromUrl" type="hidden" value="${fromUrl }" />
			</div>
			<a href="#" onclick="document.getElementById('login-form').submit();">
				<span></span> <span></span> <span></span> <span></span> 로그인
			</a>
		</form>
	</div>
</body>
<!-- Enter 키 눌렀을 때 폼 자동 제출 -->
<script>
	document.addEventListener("keydown", function(event) {
		if (event.key === "Enter") {
			document.getElementById('login-form').submit();
		}
	});
</script>

</html>