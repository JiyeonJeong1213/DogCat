<%@   page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String contextPath = request.getContextPath();
   Member loginUser = (Member) session.getAttribute("loginUser");
   //String fileName = loginUser.getFileName();
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
   rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
   
</head>
<style>
* {
   font-family: 'Noto Sans KR', sans-serif;
}

.nav-area {
   background-color: #E6F2FF;
   align-items: center;
   margin: auto;
}

.menu {
   display: table-cell;
   height: 80px;
   width: 250px;
}

#nav {
   color: #FFD133;
   font-size: 20px;
}

.menu a:hover {
   font-weight: bold;
}

.logo {
   display: flex;
   justify-content: center;
}

.mypage {
   margin-top: 50px;
   height: 15%;
   display:flex;
   justify-content: center
}

.mypage>h1 {
   text-align: center;
   height: 20%;
   margin-top: 20px;
   /* font-size: 20px; */
}

#board {
   margin-top: 20px;
}

.content {
   height: 40%;
   display: flex;
   flex-direction: column;
   align-items: center;
   margin: 50px 0px 0px 0px;
   /* margin-left: 120px; */
}

.content_2, .content_4, .content_5 {
   width: 60%;
   height: 15rem;
   border: 1px solid black;
}

.myprofile_img {
   border: 1px solid black;
   height: 10rem;
   width: 30%;
   display: flex;
   flex-direction: column;
   align-items: center;
   border-top-left-radius: 30px;
   border-bottom-left-radius: 30px;
}

.myprofile {
   width: 50%;
   height: 10rem;
   border: 1px solid black;
   border-top-right-radius: 30px;
   border-bottom-right-radius: 30px;
}

.img {
   width: 60%;
   height: 10rem;
   /* border: 0px solid black; */
   border-radius: 55%;
   display: flex;
   align-items: center;
   justify-content: center;
   background-color: rgba(52, 152, 219, 0.52);
   margin: 20px;
}

#profilechange, #rset {
   margin: 60px 0px 0px 30px;
}

button {
   border-radius: 10px;
   cursor: pointer;
}

button:hover {
   background-color: lightgray;
}

#div1, #div2, #div3, #div4, #div5, #div6 {
   border: 1px solid black;
   width: 350px;
   margin: 0px 0px 0px 115px; 
}

#span1 {
   border: 1px solid black;
   width: 350px;
   margin-right: 0px;
}

#tt {
   background-color:  rgb(230, 242, 255);
}

#bb {
   background-color: white;
   width: 500px;
   padding-left: 30px;
}

table td {
   height: 60px;
   align: center;
}

#btn {
   border: 0px solid lightgray;
   width: 50px;
   height: 20px;
   border-radius: 5px;
   background-color: rgb(224, 224, 224);
   font-size: 10px;
}

#btn2 {
   border: 0px solid lightgray;
   width: 70px;
   height: 20px;
   border-radius: 5px;
   background-color: rgb(224, 224, 224);
   font-size: 5px;
   margin-top: 10px;
}

.table {
   margin-bottom: 140px;
   border:2px solid gray;

}

/* @font-face {
   font-family: 'yg-jalnan';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
} */

.btn-div {
   display: flex;
   justify-content: center;
}

.update {
   margin-right: 50px;
}


.footer {
   margin-bottom: 30px;
}

.footer>div {
   display: inline-block;
   vertical-align: middle;
   color: rgb(158, 158, 158);
   margin: 10px;
}

.footer2>div>li, .footer4>div>li {
   list-style-type: none;
   display: inline;
   margin: auto;
   text-decoration: none;
}

.footer4 {
   float: right;
   margin: 30px;
}

.footer2>div>li a {
   color: rgb(158, 158, 158);
   padding-right: 20px;
}

.footer4>div>li a {
   padding-right: 9px;
}
</style>
<body>

<% 		
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String userNickname = loginUser.getUserNickname();
		String userPwd = loginUser.getUserPwd();
		String phone = loginUser.getPhone();
		String email = loginUser.getEmail();
		String address = loginUser.getAddress();
		int userNo =  loginUser.getUserNo();
		String userPet = loginUser.getPet();
%>


   <div class="login-area">
      <ul class="nav justify-content-end">
         <li class="nav-item"><a class="nav-link active"
            aria-current="page" href="#">로그인</a></li>
         <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
         <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
         <li class="nav-item"><a class="nav-link disabled">이용규칙</a></li>
      </ul>
   </div>

   <div class="logo">
      <a href=""><img src="또오개냥/logo.png" width="200px"></a>
   </div>



   <div class="nav-area">
      <ul class="nav justify-content-center">
         <li class="nav-item"><a class="nav-link active" id="nav"
            aria-current="page" href="#">같이걷개</a></li>
         <li class="nav-item"><a class="nav-link" id="nav" href="#">멍냥수다</a>
         </li>
         <li class="nav-item"><a class="nav-link" id="nav" href="#">나눔&거래</a>
         </li>
         <li class="nav-item"><a class="nav-link disabled" id="nav"
            style="color: gray;">대빵용</a></li>
      </ul>
   </div>

   <div class="mypage">
      <img src="resources/mypageUpdate.png" width="50px" height="50px">
      <h1 style="font-size: 3rem; color:gray;">정보 수정</h1>
   </div>

   <div class="content">
      <div class="content_2">
         <div class="myprofile_img">
            <div class="img">
               <img src="또오개냥/프로필 사진.png" style="height: 70px;">
            </div>
         </div>
         <div class="myprofile">
            <input type="submit" value="프로필 수정" id="profilechange">
            <input type="reset" value="기본이미지 변경" id="rset"> <br>

         </div>
      </div>
      <div class="content_3">
         <form action="<%=contextPath %>/updateuser.me" method="post">
            <div class="user">
               <div class="ID" id="ID">
                  <table class="table" border="1">
                     <tbody id="tt">
                        <tr>
                           <td align="center" width="345">ID</td>
                           <td id="bb"><input type="text" name="userId" value="<%= userId %>">
                           <!--<label style="font-size: x-small;">※ 아이디 변경 불가</label> --></td>
                        </tr>
                        <tr>
	                  		<input type="hidden" name="userName" value="<%= userName %>">
                           <td align="center">닉네임</td>
                           <td id="bb"><input type="text" name="userNickname" value="<%= userNickname %>">
                           <!--<label style="font-size: x-small;">※ 닉네임 변경 불가</label> --></td>
                        </tr>
                        <tr>
                           <td align="center">신규비밀번호</td>
                           <td id="bb"><input type="text" name="userPwd"></td>
                        </tr>
                        <tr>
                           <td align="center">신규비밀번호 확인</td>
                           <td id="bb"><input type="text"></td>
                        </tr>
                        <tr>
                           <td align="center">이메일</td>
                           <td id="bb"><input type="text" name="email" value="<%= email%>">
                           <label style="font-size: x-small;">※ 이메일 변경 불가</label></td>
                        </tr>
                        <tr>
                           <td align="center">주소</td>
                           <td id="bb"><input type="text" name="address"> <button id="btn2" style="font-weight: lighter;" value="우편번호 검색"></button><br><br>
                                  <input type="text" size="50" placeholder="※ 상세주소를 입력해주세요.">
                           </td>
                        </tr>
                        <tr>
                           <td align="center">펫정보</td>
                           <td id="bb">
                              <input type="checkbox" name="pet" value="DOG"><label for="DOG">강아지</label>
                              <input type="checkbox" name="pet" value="CAT"><label for="CAT">고양이</label>
                              <input type="checkbox" name="pet" value="ECT"><label for="ECT">기타</label>
                           </td>
                        </tr>
                        <tr>
                           <td align="center">취미</td>
                           <td id="bb"><%=loginUser.getHobby() %></td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
            <div class="btn-div">
               <button type="submit" class="update">수정하기</button>
               <button class="reset">돌아가기</button>
            </div>
         </form>
      </div>

   </div>

   <div class="footer">
      <div class="footer1">
         <img
            src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%9D%B4%EC%9C%A0%EC%A7%84/logo3.png"
            width="200px">
      </div>

      <div class="footer2">
         <div>
            <li><a href="">개인정보취급방침</a></li>
            <li><a href="">청소년보호정책</a></li>
            <li><a href="">이용약관</a></li>
         </div>
         <div>문의 : ddoogaenang.naver.com</div>
         <div>Copyrightⓒ 2023 ddooganang all rights reserved</div>
      </div>

      <div class="footer3"></div>


      <div class="footer4">
         <div>
            <li><a href=""><img
                  src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%9D%B4%EC%9C%A0%EC%A7%84/twitter.png"
                  width="30px"></a></li>
            <li><a href=""><img
                  src="<%= request.getContextPath() %>/resources/facebook.png"
                  width="25px"></a></li>
            <li><a href=""><img
                  src="<%= request.getContextPath() %>/resources/instagram.png"
                  width="30px"></a></li>
         </div>
      </div>
   </div>


   </div>
</body>
</html>