<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
 *{
        font-family: 'Noto Sans KR', sans-serif;
    }
    .nav-area{
        background-color: #E6F2FF;
        align-items: center;
        margin: auto;
    }
    #nav{
        color: gray;
        font-size: 20px;
    }

    .nav-item a:hover{
        font-weight: bold;
        color: #FFD133;
    }
    .logo{
        display: flex;
        justify-content: center;
    }
</style>
</head>
<body>
	
   <div class="logo">
        <a href=""><img src="resources/logo2.png" width="210px" ></a>
    </div>
        
    <div class="nav-area" style="margin-bottom: 20px;">
        <ul class="nav justify-content-center">
            <li class="nav-item">
              <a class="nav-link active" id="nav" aria-current="page" href="#">프로필</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="#">회원관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="#">게시판관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="#">공지사항관리</a>
            </li>
        </ul>
    </div>
	


</body>
</html>