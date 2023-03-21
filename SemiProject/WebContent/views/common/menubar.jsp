<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>메뉴바 만들기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
    *{
        font-family: 'Noto Sans KR', sans-serif;
    }
    .nav-area{
        background-color: #E6F2FF;
        align-items: center;
        margin: auto;
    }
    .menu{
        display:table-cell;
        height:80px;
		width:250px;
    }
    #nav{
        color: #FFD133;
        font-size: 20px;
    }

    .menu a:hover{
        font-weight: bold;
    }
    .logo{
        display: flex;
        justify-content: center;
    }
</style>
</head>
<body>

 	<div class="login-area" >
        <ul class="nav justify-content-end">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">로그인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">회원가입</a>
            </li>
        </ul>
    </div>     

    <div class="logo">
        <a href=""><img src="<%= request.getContextPath() %>/resources/logo2.png" width="250px" ></a>
    </div>


	
    <div class="nav-area" >
        <ul class="nav justify-content-center">
            <li class="nav-item">
              <a class="nav-link active" id="nav" aria-current="page" href="#">같이걷개</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="#">멍냥수다</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="#">나눔&거래</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" id="nav"  style="color: gray;">대빵용</a>
            </li>
        </ul>
    </div>

</body>
</html>