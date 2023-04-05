<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
		}
		
		.all {
			width: 1350px;
			margin: 0 auto;
        }
		.search_Pwd_Container {
			padding: 30px;
			background-color: #fff;
			border-radius: 5px;
			box-shadow: 0 2px 4px rgba(0,0,0,0.2);
			max-width: 500px;
            margin-left: 404px;
		}
		h1 {
			font-size: 24px;
			margin: 0 0 20px;
			text-align: start;
		}
		label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
		}
		input[type="text"], input[type="password"] {
			padding: 10px;
			border-radius: 5px;
			border: 1px solid rgba(224, 224, 224, 0.34);
			width: 95%;
			margin-bottom: 20px;
            background-color: rgba(224, 224, 224, 0.34);
		}
		button {
			background-color: rgba(52, 152, 219, 0.84); /* 파란색 */
			border: none;
			color: #fff;
			padding: 12px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.3s;
            width: 100%;
		}
		
        .search_logo{
            margin-left: 536px;
            width: 300px;
            margin-bottom: 50px;
        }

		input:focus {
            outline: none;
        }
	</style>
</head>
<body>
<div class="all">
	<div class="search_logo">
     <a href="<%= contextPath %>"><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/logo.png" height="200" width="300" alt="">
    </a>
    </div>
	<div class="search_Pwd_Container">
		<h1>비밀번호 찾기</h1>
		<form name="pwdfindscreen" method ="POST" action="<%= contextPath %>/pwdSearch.me">
			<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
			<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요.">
			<button type="submit" id="searchBtn" onClick="return checks();">비밀번호 찾기</button>
		</form>
	</div>
</div>
</body>
<script>
	function checks() {
		var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{4,12}$/); // 아이디
		var userNameCheck = RegExp(/^[가-힣]{2,4}$/); // 이름
		
		// 아이디 공백 확인
		if ($("#userId").val() == "") {
			alert("아이디를 입력해 주시기 바랍니다.");
			$("#userId").focus();
			return false;
		}

		// 아이디 유효성검사
		if (!userIdCheck.test($("#userId").val())) {
			alert("아이디가 일치하지 않습니다.");
			$("#userId").val("");
			$("#userId").focus();
			return false;
		}
		
		// 이름 공백 확인
		if ($("#userName").val() == "") {
			alert("이름를 입력해 주시기 바랍니다.");
			$("#userName").focus();
			return false;
		}

		// 이름 유효성검사
		if (!userNameCheck.test($("#userName").val())) {
			alert("이름이 일치하지 않습니다.");
			$("#userName").val("");
			$("#userName").focus();
			return false;
		}
		
	}
   </script>
</html>