<%@   page
	import="com.kh.member.model.vo.Member, java.util.ArrayList, com.kh.board.model.vo.Board , com.kh.chat.model.vo.Chatroom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   String contextPath = request.getContextPath();
   Member loginUser = (Member) session.getAttribute("loginUser");
   String fileName = loginUser.getFileName();
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
   ArrayList<Chatroom> clist = (ArrayList<Chatroom>)request.getAttribute("clist");
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.mypage {
	margin-top: 50px;
	height: 15%;
}

.profile_img {
	width: 70px;
	height: 60px;
	border-radius: 70%;
	margin: 0 auto;
	overflow: hidden;
}

#profile_img {
	width: 95%;
	height: 93%;
	object-fit: cover;
	margin-left: 6px;
}

.mypage>h1 {
	text-align: center;
	font-size: xx-large;
	font-family: 'Lilita One', cursive;
	height: 20%;
	margin-top: 20px;
	margin-right: 90px;
}

.content {
	width: 100%;
	height: 60rem;
	border: 0px solid red;
	display: flex;
	align-items: center;
	flex-direction: column;
}

.content_2, .content_3, .content_5, #pf {
	width: 60%;
	height: 15rem;
	border: 0px solid black;
}

.content_4 {
	width: 60%;
	height: 15rem;
	border: 1px solid black;
}

/*프로필 수정 & 버튼*/
.img {
	width: 200px;
	height: 200px;
	border-radius: 50%;
	background-color: rgba(52, 152, 219, 0.52);
	margin: 20px 0px 15px 0px;
}

.myprofile {
	border: 0px solid blue;
	display: flex;
	justify-content: center;
}

#file {
	display: none;
}

.btn-upload, .btn-reset {
	height: 40px;
	border: 1px solid red;
	padding: 5px 10px;
	border-radius: 15px;
}

.btn-upload {
	width: 105px;
	border: 3px solid #FFD133;
	color: #FFD133;
	margin-right: 30px;
}

#changebutton {
	width: 105px;
	height: 45px;
	font-size: small;
	border: 3px solid rgba(52, 152, 219, 0.52);
	border-radius: 15px;
}

.btn-reset {
	width: 135px;
	border: 3px solid gray;
	color: gray;
}

.content_2 {
	display: flex;
	align-items: center;
	flex-direction: column;
}

.content_3 {
	display: flex;
	align-items: center;
	justify-content: center;
}

#mymenu th {
	text-align: center;
	color: rgba(52, 152, 219, 0.52);
	width: 150px;
	font-size: 1.5rem;
	font-weight: 900;
}

#changebutton:hover {
	cursor: pointer;
}

.info {
	width: 100%;
	height: 8rem;
	border: 2px solid black;
	border-radius: 20px;
}

#table {
	margin: 0 auto;
	border-spacing: 15px;
	border-collapse: separate;
}

/*숨겨진 내용*/
#btn1, #btn2, #btn3, #btn4, #btn5 {
	cursor: pointer;
	border-radius: 0px;
	border-color: lightgray;
	width: 227.7px;
}

thead {
	border: 1px solid black;
}

/*카테고리버튼*/
.content4_category {
	display: flex;
}

.category_swipperWrap {
	display: flex;
	justify-content: center;
}

.category_swipper {
	width: 150px;
	margin: 0px;
	box-sizing: content-box;
}

.category_button {
	padding: 9px;
	background: rgb(226, 226, 226);
	border: 1.5px solid rgb(255, 255, 255);
	border-radius: 10px 10px 0px 0px;
	font-style: normal;
	font-weight: 900;
	font-size: 18px;
	line-height: 23px;
	text-align: center;
	color: rgb(102, 102, 102);
	white-space: nowrap;
	width: 200px;
	max-width: 100%;
}

.category_button:hover {
	background-color: rgb(83, 193, 243);
	color: white;
}
</style>
</head>
<div class="mypage">
	<h1 style="color: cornflowerblue; font-size: 60px;" onclick="">My
		Page</h1>
</div>



<div class="content">

	<form action="<%= contextPath%>/userprofileupdate" method="post"
		enctype="multipart/form-data">

		<div class="content_2">
			<div class="myprofile_img">
				<input type="hidden" name="userNo"
					value="<%= loginUser.getUserNo() %>">
				<div class="img">
					<%if(loginUser.getFileName() != null){ %>
					<img id="profile_img"
						src="<%=request.getContextPath() %>/<%=loginUser.getFileName() %>">
					<%}else{ %>
					<img id="profile_img" src="resources/profile_basic.png">
					<%} %>
				</div>
			</div>
			<div class="myprofile">
				<input type="file" name="file" id="file" onchange="loadImg(this)">
				<label for="file" class="btn-upload">프로필 변경</label> <input
					type="file" name="reset-file" id="file" onchange=""> <label
					for="reset-file" class="btn-reset">기본이미지 변경</label>
			</div>
		</div>

	</form>
	<div class="content_3">
		<div class="info">
			<table border="0px" id="table">
				<tr id="mymenu">
					<th id="username">o o o님</th>>
					<th id="board">게시글</th>
					<th id="likelist">찜목록</th>
					<th id="chatting">채팅</th>
					<th id="walk mate"
						style="text-align: center; color: rgba(52, 152, 219, 0.52);">산책메이트</th>
				</tr>
				<tr>
					<td><button type="button" id="changebutton"
							style="width: 150px;">
							<a href="<%=contextPath%>/updateuser.me"
								style="text-decoration: none;">회원정보 수정</a>
						</button></td>
					<td style="text-align: center;">0건</td>
					<td style="text-align: center;">0건</td>
					<td style="text-align: center;">0건</td>
					<td style="text-align: center;">0건</td>
				</tr>
			</table>
		</div>
	</div>


	<div class="content_4">
		<div class="content4_category">
			<div class="category_swiper">
				<button id="btn1" class="category_button">작성글(0)</button>
			</div>
			<div class="category_swiper">
				<button id="btn2" class="category_button">작성댓글(0)</button>
			</div>
			<div class="category_swiper">
				<button id="btn3" class="category_button">찜목록(0)</button>
			</div>
			<div class="category_swiper">
				<button id="btn4" class="category_button">채팅(0)</button>
			</div>
			<div class="category_swiper">
				<button id="btn5" class="category_button">산책메이트(0)</button>
			</div>
		</div>
		<form id="free_main2" action="" method="post" class="category">
			<table align="" border="0">
				<thead id="thead2">
					<tr align="center">
						<th style="width: 120px;">글번호</th>
						<th style="width: 600px;">제목</th>
						<th style="width: 150px;">작성자</th>
						<th style="width: 180px;">날짜</th>
						<th style="width: 100px;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%if(list != null){ %>
					<%for(Board b: list) { %>
					<tr align="center">
						<td><%= b.getBoardNo() %></td>
						<td><a href="#"><%= b.getBoardTitle() %></a></td>
						<td><%= b.getBoardWriter() %></td>
						<td><%= b.getCreateDate() %></td>
						<td><%= b.getCount() %></td>
					</tr>
					<% } %>
					<%} else{ %>
					<tr align="center">
						<td colspan="5">조회된 글이 없습니다.</td>
					</tr>
					<% } %>

				</tbody>
			</table>
		</form>
		<div class="content4_chatroom" style="display:none;">
			<form id="free_main3" action="" method="post">
				<table align="" border="0">
					<thead id="thead3">
						<tr align="center">
							<th style="width: 120px;">채팅방 번호</th>
							<th style="width: 600px;">채팅방 이름</th>
							<th style="width: 150px;">닉네임</th>
							<th style="width: 180px;">날짜</th>
							<!-- <th style="width: 100px;">조회수</th> -->
						</tr>
					</thead>
					<tbody>
						<%if(clist != null){ %>
						<%for(Chatroom c: clist) { %>
						<tr align="center">
							<td><%= c.getChatroomNo()%></td>
							<td><a href="#"><%= c.getChatroomName() %></a></td>
							<td><%= c.getBuyer() %></td>
							<td><%= c.getCreateDate() %></td>
							<%-- <td><%= b.getCount() %></td> --%>
						</tr>
						<% } %>
						<%} else{ %>
						<tr align="center">
							<td colspan="5">조회된 채팅이 없습니다.</td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</form>
		</div>
	</div>

<!-- 	<div id="comment" style="display: none;">
		<thead id="thead4">
			<tr align="center">
				<th style="width: 120px;">채팅번호</th>
				<th style="width: 600px;">닉네임</th>
				<th style="width: 180px;">날짜</th>
				<th style="width: 100px;">조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr align="center">
				<td>1</td>
				<td><a href="#">O O O님과의 채팅</a></td>
				<td>2023-03-20</td>
				<td>10</td>
			</tr>
		</tbody>
		</table>
		</form>
		`
	</div> -->

	<div id="wishlist" style="display: none;"></div>

	<div id="chatting" style="display: none;"></div>

	<div id="runningmate" style="display: none;"></div>

</div>
</div>

</div>


<script>
	// 내가쓴 글 확인 창
	const btn1 = document.getElementById('btn1');
	const category = document.querySelector(".category");
	const btn2 = document.getElementById('btn2');
	const comment = document.querySelector(".content4_chatroom");
	
	btn1.addEventListener('click', function() {
	  if (category.style.display === 'none') {
	    category.style.display = 'block';
	    comment.style.display = 'none';
	  } else {
	    category.style.display = 'none';
	  }
	});

	// 작성댓글
	btn2.addEventListener('click', function() {
		console.log(comment);
		if(comment.style.display === 'none'){
			comment.style.display = 'block';
			category.style.display = 'none';
	  	} else {
	    	category.style.display = 'none';
	  	}
	});

/* // 찜목록
const btn3 = document.getElementById('btn3');
const wishlist = document.getElementById('wishlist');

btn3.addEventListener('click', function() {
    let data = `<form id="free_main3" action="" method="post">
        <table align="" border="0" >
            <thead id="thead3">
                        <tr align="center">
                            <th style="width: 120px;">글번호</th>
                            <th style="width: 600px;">제목</th>
                            <th style="width: 150px;">작성자</th>
                            <th style="width: 180px;">날짜</th>
                            <th style="width: 100px;">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr align="center">
                            <td>1</td>
                            <td><a href="#">첫번째 찜목록</a></td>
                            <td>작성자1</td>
                            <td>2023-03-20</td>
                            <td>10</td>
                        </tr>
                        <tr align="center">
                            <td>2</td>
                            <td><a href="#">두번째 찜목록</a></td>
                            <td>작성자2</td>
                            <td>2023-03-19</td>
                            <td>20</td>
                        </tr>
                    </tbody>
                </table>
            </form>`;
            container.innerHTML = data;
});

// 채팅
const btn4 = document.getElementById('btn4');
const chatting = document.getElementById('chatting');

btn4.addEventListener('click', function() {
  let data = `<form id="free_main4" action="" method="post">
        <table align="" border="0" >
            <thead id="thead4">
                        <tr align="center">
                            <th style="width: 120px;">채팅번호</th>
                            <th style="width: 600px;">닉네임</th>
                            <th style="width: 180px;">날짜</th>
                            <th style="width: 100px;">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr align="center">
                            <td>1</td>
                            <td><a href="#">O O O님과의 채팅</a></td>
                            <td>2023-03-20</td>
                            <td>10</td>
                        </tr>
                    </tbody>
                </table>
            </form>`
            container.innerHTML = data;
});

// 산책메이트
const btn5 = document.getElementById('btn5');
const runningmate = document.getElementById('runningmate');

btn5.addEventListener('click', function() {
  let data = `<form id="free_main5" action="" method="post">
        <table align="" border="0" >
            <thead id="thead5">
                        <tr align="center">
                            <th style="width: 120px;"></th>
                            <th style="width: 600px;">닉네임</th>
                            <th style="width: 180px;">산책시작날짜</th>
                            <th style="width: 180px;">산책종료날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr align="center">
                            <td>1</td>
                            <td><a href="#">O O O님과의 산책</a></td>
                            <td>2023-03-20</td>
                            <td>2023-03-21</td>
                        </tr>
                    </tbody>
                </table>
            </form>`
            container.innerHTML = data;
}); */
</script>

</body>
</html>