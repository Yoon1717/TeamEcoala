<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up</title>
<link href="${pageContext.request.contextPath}/css/signup.css"
	rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="main-contain">
		<div class="left"></div>
		<div class="center">
			<div class="top-center"></div>
			<div class="mid-center">
				<div class="top-center-1">
					<h1 class="title">SIGN UP</h1>
				</div>
				<div class="top-center-2">
					<div class="logo"></div>
					<div class="login-box">
						<form name="myForm"
							action="${pageContext.request.contextPath}/registDo"
							method="post" onsubmit="return false;">
							<div class="user-box">
								<input type="text" name="id" id="id"> <label>ID</label>
								<button type="button" onclick="checkId()">중복 확인</button>
							</div>
							<div class="user-box">
								<input type="password" id="pw" name="pw" required=""
									placeholder=" 4자이상"> <label>Password</label>
							</div>
							<div class="user-box">
								<input type="password" id="confirmPw" name="confirmPw"
									required="" placeholder=" 4자이상"> <label>비밀번호 확인</label>
							</div>
							<div class="user-box">
								<input type="text" name="name" required=""> <label>Name</label>
							</div>
							<div class="user-box">
								<select name="memno">
									<option value="1">1인가구</option>
									<option value="2">2~3인가구</option>
									<option value="3">4인이상</option>
								</select> <label>가구원 수</label>
							</div>
							<div class="user-box">
								<select name="jobtype">
									<option value="1">외벌이</option>
									<option value="2">맞벌이</option>
									<option value="3">노령(상주)</option>
								</select> <label>직업형태</label>
							</div>
							<div class="user-box">
								<select name="housetype">
									<option value="1">아파트</option>
									<option value="2">단독주택</option>
									<option value="3">빌라</option>
								</select> <label>집 유형</label>
							</div>
							<div class="user-box">
								<select name="housearea">
									<option value="1">80㎡(24평)이하</option>
									<option value="2">116㎡(35평)이하</option>
									<option value="3">116㎡(35평)초과</option>
								</select> <label>집 면적</label>
							</div>
							<div class="user-box">
								<select name="region">
									<option value="1">순천시</option>
									<option value="2">목포시</option>
									<option value="3">여수시</option>
									<option value="4">광양시</option>
									<option value="5">나주시</option>
								</select> <label>지역</label>
							</div>
							<div class="user-box">
								<a href="#" onclick="validatePassword()"> <span></span> <span></span>
									<span></span> <span></span> 회원가입
								</a>
							</div>
						</form>
					</div>
				</div>
				<div class="top-center-3"></div>
			</div>
			<div class="bottom-center"></div>
		</div>
		<div class="right"></div>
	</div>
</body>
<script>
function checkId() {
    var id = $("#id").val();
    if (!id) {
        alert("ID를 입력하세요.");  // ID를 입력하지 않았을 때 alert 창 띄우기
        return;
    }
    // Ajax를 이용하여 서버에 ID 중복 확인 요청
    $.ajax({
        url: "${pageContext.request.contextPath}/checkId", // 중복 확인을 위한 서버의 URL
        type: "POST",
        data: { id: id },
        success: function (result) {
            if (result > 0) {
                alert("이미 사용 중인 ID입니다.");
            } else {
                alert("사용 가능한 ID입니다.");
                
            }
        },
        error: function () {
            alert("서버 요청 실패");
        }
    });
}
	function validatePassword() {
		var password = document.getElementById("pw").value;
		var confirmPassword = document.getElementById("confirmPw").value;

		if (password !== confirmPassword) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}
		// 비밀번호와 확인 비밀번호가 4자리 이상인지 확인
	    if (password.length < 4) {
	        alert("비밀번호는 최소 4자 이상이어야 합니다.");
	        return false;
	    }

		// 폼 제출
		document.forms["myForm"].submit();
	}
</script>
</html>
