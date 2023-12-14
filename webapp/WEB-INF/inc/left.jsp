<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="${pageContext.request.contextPath}/css/list.css"
	rel="stylesheet" />

<nav>
	<div class="nav-logo">
		<a href="${pageContext.request.contextPath}/mainView" class="logo">
			<img src="./assets/img/logo.png" alt=""
			style="width: 220px; height: 230px;">
		</a>
	</div>
	<div class="nav-menu">
		<ul class="menu">
			<li><a class="list" href="#"><b>전력량</b></a>
				<ul class="submenu">
					<li><a class="list"
						href="${pageContext.request.contextPath}/eleInquiryView"><b>전력량
								조회하기</b></a></li>
					<li><a class="list"
						href="${pageContext.request.contextPath}/eleAnalysisView"><b>전력량
								분석하기</b></a></li>
				</ul></li>
			<li><a class="list"
				href="${pageContext.request.contextPath}/billPlanView"><b>전기세
						계획하기</b></a></li>
			<li><a class="list"
				href="${pageContext.request.contextPath}/billDetView"><b>요금
						상세보기</b></a></li>
			<li><a class="list"
				href="${pageContext.request.contextPath}/cboPointView"><b>탄소포인트</b></a>

			</li>
			<li><a class="list"
				href="${pageContext.request.contextPath}/boardView"><b>게시판</b></a></li>
		</ul>
	</div>
	<div class="nav-chatbot">
		<div class="chatbot-top">
			<div class="chatbot" onclick="toggleChat()">
				<img src="${pageContext.request.contextPath}/assets/img/chatbot.png" alt="" style="height:100%;width:100%;">
			</div>

		</div>
		<div class="chatbot-bottom">
			<b class="text-3">대화하기</b>
		</div>
	</div>
</nav>
<div class="chat-container" id="chatContainer">
	<div class="chat-header" onmousedown="startDrag(event)"
		style="display: flex;">
		<div>CoalaBot</div>
		<div class="header-icons" style="display: flex;">
			<div class="resizer" onmousedown="startResize(event)"
				style="margin-right: 10px;">
				<i class="bi bi-arrows-angle-contract"></i>
			</div>
			<div class="exit" onclick="toggleChat()">
				<i class="bi bi-x-circle-fill"></i>
			</div>
		</div>

	</div>
	<div class="chat-body" id="chatBody"></div>
	<div class="chat-footer">
		<input type="text" placeholder="Type your message..."
			class="chat-input" id="userInput" onkeydown="handleKeyPress(event)">
		<button onclick="sendMessage()">Send</button>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/list.js"></script>