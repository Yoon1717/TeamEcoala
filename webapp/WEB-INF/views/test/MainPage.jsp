<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecoala</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" />    
   
</head>

<body>
    <div class="content-container">
        <div class="additional-div">
            <%@include file="/WEB-INF/inc/left.jsp" %>
                
        <div class="main-contain">
            <div class="top">
                <div class="top-left">
                    <h1 class="title">DASHBOARD</h1>
                </div>
                <div class="top-center"></div>
                <div class="top-right">
                    <div class="right-logout">
                        <div class="top-logout"></div>
                        <div class="bottom-logout"></div>
                    </div>
                    <div class="right-mypage">
                        <div class="top-mypage">
                            <div class="left2-mypage">
                                <img class="img-mypage" src="./assets/img/mypage.png" alt="">
                            </div>
                            <div class="right2-mypage">
                                <img class="img-logout" src="./assets/img/logout.png" alt="">
                            </div>
                        </div>
                        <div class="bottom-mypage">
                            <div class="left2-mypage">
                                <b class="text-1">My Page</b>
                            </div>
                            <div class="right2-mypage">
                                <b class="text-2">Logout </b>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <div class="bottom">
                <div class="bottom-left-1"></div>
                <div class="bottom-right-1"></div>
                <div class="bottom-left-2"></div>
                <div class="bottom-right-2"></div>
            </div>
        </div>

    </div>
    </div>

</body>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

</html>