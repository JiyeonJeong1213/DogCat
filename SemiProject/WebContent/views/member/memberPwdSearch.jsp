<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
		}
		.search_Pwd_Container {
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
	<div class="search_Pwd_Container">
		<h1>비밀번호 찾기</h1>
		<form>
			<input type="text" id="user_Id" name="user_Id" placeholder="아이디를 입력해주세요.">
			<input type="text" id="user_Name" name="user_Name" placeholder="이름을 입력해주세요.">
			<button type="submit">아이디 찾기</button>
		</form>
	</div>
</body>
</html>