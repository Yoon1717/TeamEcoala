<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecoala</title>
</head>
<link href="${pageContext.request.contextPath}/css/firstscreen.css" rel="stylesheet" />    

<body>
    <div class="left"></div>
    <div class="center">
        <div class="center-top">
            <div class="center-top-top"></div>
            <div class="center-top-mid">
            </div>
            <div class="center-top-bottom">
                <div class="left-bottom"></div>
                <div class="center-bottom">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" class="logo">
                </div>
                <div class="right-bottom"></div>
            </div>
        </div>
        <div class="center-mid">
            <div class="mid-top"></div>
            <div class="mid-bottom">
                <div class="mid-bottom-1"></div>
                <div class="mid-bottom-2">
                    <div class="admin"></div>
                </div>
                <div class="mid-bottom-3"></div>
                <div class="mid-bottom-4">
                    <div class="user"></div>
                </div>
                <div class="mid-bottom-5"></div>
            </div>
        </div>
        <div class="center-bottom">
        <ul style="font-size: 30px;">
   
</ul>
</div>
    </div>
    <div class="right">
        <div class="right-top">
            <div class="rgt-left">
                <div style="margin-top: 34px;">
                <b class="text-1">회원가입</b>
            </div>
            </div>
            <div class="rgt-right">
                <img src="${pageContext.request.contextPath}/assets/img/singup.png" alt="" class="signup">
            </div>
            
        </div>
        <div class="right-bottom-1"></div>
    </div>

</body>
<script>
	var loginUrl = "<c:url value='/login' />";
	var adminUrl = "<c:url value='/mngrlogin' />"
</script>
<script src="${pageContext.request.contextPath}/js/firstscreen.js"></script>

</html>