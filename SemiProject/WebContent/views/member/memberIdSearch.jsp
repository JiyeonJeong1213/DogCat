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
		.search_Id_Container {
			padding: 30px;
			background-color: #fff;
			border-radius: 5px;
			box-shadow: 0 2px 4px rgba(0,0,0,0.2);
			max-width: 500px;
            margin-left: 500px;
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
            margin-left: 636px;
            width: 300px;
            margin-bottom: 50px;
        }

		input:focus {
            outline: none;
        }
	</style>
</head>

<body>

	<div class="search_logo">
    <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/logo.png" height="200" width="300" alt="">
    </div>
	
	<div class="search_Id_Container">
		<form name="idfindscreen" method ="POST" action="<%= contextPath %>/idSearch.me" >
			<h1>아이디 찾기</h1>
				<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요.">
				<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요.">
				<button type="submit" id="searchBtn" onClick="return checks();">아이디찾기</button>
		</form>
	</div>
	
	<script>
	function checks() {
		var userNameCheck = RegExp(/^[가-힣]{2,4}$/); // 이름
		var emailCheck = RegExp(/^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/); // 이메일
		
		// 이름 공백 확인
		if ($("#userName").val() == "") {
			alert("아이디를 입력해 주시기 바랍니다.");
			$("#userName").focus();
			return false;
		}

		// 이름 유효성검사
		if (!userNameCheck.test($("#userName").val())) {
			alert("이름은 2~4자, 한글만 입력해 주시기 바랍니다.");
			$("#userName").val("");
			$("#userName").focus();
			return false;
		}
		
		// 이메일 공백 확인
		if ($("#email").val() == "") {
			alert("이메일을 입력해 주시기 바랍니다.");
			$("#email").focus();
			return false;
		}
		
		// 이메일 유효성 검사
		if (!emailCheck.test($("#email").val())) {
			alert("이메일 형식에 맞게 입력해 주시기 바랍니다.")
			$("#email").val("");
			$("#email").focus();
			return false;
		}
	}
   </script>
</body>
</html>