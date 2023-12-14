<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" />
</head>
<link rel="stylesheet" href="style.css">

<body>
    <div class="logo"></div>
    <div class="login-box">
        <h2>Login</h2>
        <form method="post"
			action="${pageContext.request.contextPath}/login.do" id="login-form">
            <div class="user-box">
                <input type="text" name="" required=""
                value="${cookie.rememberId.value }"/>
                <label>Username</label>
            </div>
            <div class="user-box">
                <input type="password" name="" required="">
                <label>Password</label>
            </div>
            <a href="#">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
               <input type="submit" value="로그인">
            </a>
        </form>
    </div>

</body>

</html>