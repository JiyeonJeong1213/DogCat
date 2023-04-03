<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
 	request.setCharacterEncoding("UTF-8");
 	String alertMsg = request.getAttribute("alertMsg").toString();
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
		.search_Pwd_Container {
			padding: 30px;
			background-color: #fff;
			border-radius: 5px;
			box-shadow: 0 2px 4px rgba(0,0,0,0.2);
			max-width: 500px;
            margin-left: 565px;
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
		
		#btnLogin{
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
            width: 40%;
		}

        .search_logo{
            margin-left: 695px;
            width: 300px;
            margin-bottom: 50px;
        }

		input:focus {
            outline: none;
        }
        
        .found-login{
        	display: flex;
        	justify-content: space-around;
        }
	</style>
</head>
<body>
	<div class="search_logo">
    <a href="<%= contextPath %>"><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/logo.png" height="200" width="300" alt="">
    </a>
    </div>
    <div class="search_Pwd_Container">
<%
if (alertMsg == "success") {
%>     
		<div class = "container">
			<div class = "found-success">
				<h4 align="center"> 회원님의 임시 비밀번호가 이메일로 발송되었습니다. </h4>  
				<h4 align="center"> 로그인 후 비밀번호를 수정해주세요. </h4>  
			</div>
			<div class = "found-login">
				 <button type="button" id="btnLogin" onClick="goLogin()">로그인</button>
			</div>
		</div>
<%
} 
else {
%>
		<div class = "container">
	      	<div class = "found-fail">
		      	<h4 align="center">  등록된 정보가 없습니다 </h4>  
		     </div>
		     <div class = "found-login">
	 		    <button type="button" id="btnback" onClick="history.back()">뒤로가기</button>
	 		    <button type="button" id="btnjoin" onClick="goEnroll()">회원가입</button>
	       	</div>
       	</div>  
<%
}
%>      
	</div>
</body>
<script>
	function goLogin() {
		var link = '<%= contextPath %>/login.me';
		location.href = link;
	}
	
	function goEnroll() {
		var link = '<%=contextPath%>/views/member/memberEnroll.jsp';
			location.href = link;
	}
</script>
</html>