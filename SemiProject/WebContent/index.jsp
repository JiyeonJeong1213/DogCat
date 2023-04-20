<%@ page
	import="java.util.ArrayList, com.kh.board.model.vo.*, com.kh.chat.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>또오개냥 메인페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
}

.dog_land {
	background-image: url("resources/dog_run.gif");
	background-position: center;
	background-repeat: repeat-x; /* 배경이미지 가로로 반복 */
	height: 100px;
	width: 100%;
}

.main1{
	width: 100%;
	text-align: center;
	padding-top: 40px;
}

.main1-text {
	font-size: 45px;
	font-family: 'yg-jalnan', verdana, tahoma;
	color: #F7E3A5;
	text-shadow: -2px 0 #4758A8, 0 2px #4758A8, 2px 0 #4758A8, 0 -2px
		#4758A8;
}

.main1_img {
	width: 100%;
	background-image:url("https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%9D%B4%EC%9C%A0%EC%A7%84/%EA%B0%95%EC%95%84%EC%A7%80%EB%93%A4.png");
	height: 500px;
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}

.chat_icon {
	width: 50px;
	height: 50px;
	float: right;
	position: sticky;
	bottom: 30px;
	margin-right: 20px;
}

.main2 {
	padding: 60px 20px;
}

.main2_wrap {
	display: flex;
	max-width: 1200px;
	margin-left: 400px;
	margin-right: auto;
	column-gap: 30px;
}

.main2_title {
	font-style: normal;
	font-weight: 700;
	font-size: 36px;
	line-height: 30px;
	color: rgb(51, 51, 51);
	padding-right: 30px;
	border-right: 1px solid rgb(204, 204, 204);
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	position: relative;
}

.notice_lists {
	display: flex;
	flex-direction: column;
	row-gap: 20px;
	flex: 1 1 0px;
	list-style: none;
}

.notice_lists li {
	padding: unset;
	margin: unset;
	display: flex;
	column-gap: 20px;
	align-items: center;
}

.noticeTitle {
	font-size: 20px;
	font-weight: bold;
}

.noticeDate {
	font-size: 20px;
}

li {
	list-style: none;
}

.main3 {
	padding: 5px 20px;
}

.slideBoard {
	max-width: 1200px;
	margin: auto;
}

.slideTitle {
	margin-bottom: 32px;
	display: flex;
	align-items: center;
	font-weight: 700;
	font-size: 36px;
	line-height: 38px;
	font-family: 'yg-jalnan', verdana, tahoma;
	color: #F7E3A5;
	text-shadow: -2px 0 #4758A8, 0 2px #4758A8, 2px 0 #4758A8, 0 -2px
		#4758A8;
}

.slideTitle::before {
	content: "";
	background-image: url(resources/강아지발바닥.png);
	display: inline-block;
	background-size: cover;
	margin-right: 14px;
	width: 35px;
	height: 35px;
	flex: 0 0 auto;
}

.slideContent {
	/* background-image: url("https://sscampus.kr/images/components/board-frame.png"); */
	background-size: 100% 100%;
	background-repeat: no-repeat;
	padding: 49px 75px 73px;
	position: relative;
	overflow: hidden;
	width: 1050px;
	margin: 0 auto;
	height: 500px;
}

.slides {
	position: absolute;
	left: 0;
	top: 30px;
	padding-left: 10px;
}

.slides>li {
	list-style: none;
}

.slides.animated {
	transition: 0.5s ease-out;
}

.slides li {
	width: 250px;
	background-color: #E6F2FF;
	float: left;
	border-radius: 20px;
	text-align: center;
}

.slides li:not(:last-child) {
	margin-right: 10px;
}

.cardWrap {
	width: 100%;
	position: relative;
	flex-shrink: 0;
	height: 100%;
	position: relative;
	margin-right: 107px;
}

.imgWrap {
	text-align: center;
}

.cardImg {
	width: 90%;
	height: 200px;
	border-radius: 100%;
	overflow: hidden;
}

.cardContent {
	text-align: center;
	margin-top: 10px;
}

.card-title {
	font-size: 16px;
	font-weight: 600;
	white-space: normal;
	overflow: hidden;
}

.main4 {
	padding: 120px 0px 123px;
	background-image: url(resources/back.png);
	background-size: 100%;
	background-repeat: no-repeat;
	/* background-position: right center; */
	position: relative;
}

.main4::after {
	content: "";
	background-image: url(resources/Big.png);
	background-position: right bottom;
	background-size: auto 82.9876%;
	background-repeat: no-repeat;
	width: 1200px;
	left: 50%;
	transform: translate(-50%);
	position: absolute;
	bottom: 0px;
	top: 0px;
	pointer-events: none;
}

.main4Wrap {
	max-width: 1200px;
	margin: auto;
	padding: 0px 20px;
}

.main4Title {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	margin-bottom: 36px;
	font-weight: 700;
	font-size: 36px;
	line-height: 38px;
	font-family: 'yg-jalnan', verdana, tahoma;
	color: #F7E3A5;
	text-shadow: -2px 0 #4758A8, 0 2px #4758A8, 2px 0 #4758A8, 0 -2px
		#4758A8;
}

.main4Title::before {
	content: "";
	background-image: url(resources/강아지발바닥.png);
	display: inline-block;
	background-size: cover;
	margin-right: 14px;
	width: 35px;
	height: 35px;
	flex: 0 0 auto;
}

.main4Content {
	font-style: normal;
	font-weight: 400;
	font-size: 20px;
	line-height: 30px;
	color: F7E3A5;
}

.testGo {
	margin-top: 50px;
	background: rgb(83, 193, 243);
	border: 1px solid rgb(83, 193, 243);
	border-radius: 50px;
	padding: 12px 45px;
	font-style: normal;
	font-weight: 700;
	font-size: 16px;
	line-height: 30px;
	text-align: center;
	color: rgb(255, 255, 255);
	cursor: pointer;
	transition: all 0.3s ease-in-out 0s;
}

a {
	text-decoration: none;
	color: black;
}

.chat-area {
	border-radius: 20px;
	border: 1px solid gray;
	width: 500px;
	display: none;
	position: absolute;
	top: 60%;
	left: 85%;
	transform: translate(-50%, -50%);
}

.chat-title {
	background-color: white;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
}

.btn-close {
	border: none;
	background-color: white;
}

.btn-close:focus {
	outline: none;
}

.chat-content {
	background-color: rgb(251, 246, 240);
	height: 400px;
	overflow: hidden;
	text-overflow: ellipsis;
	overflow-y: scroll;
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
	width: 100%;
}

.chat-content1 {
	background-color: rgb(251, 246, 240);
	overflow: hidden;
	text-overflow: ellipsis;
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
	width: 100%;
}

.chat-content2 {
	background-color: rgb(251, 246, 240);
	overflow: hidden;
	text-overflow: ellipsis;
	overflow-y: scroll;
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
	width: 100%;
}

.chat-response {
	width: 70%;
	display: flex;
	padding-top: 20px;
}

.chat-request {
	display: flex;
	padding-top: 20px;
	justify-content: right;
}

.chat-request>img {
	margin-left: 10px;
}

.chat-bubble {
	width: 100%;
	background-color: rgb(255, 218, 119);
	margin-left: 15px;
	padding: 5px;
	overflow-wrap: break-word;
	word-wrap: break-word;
}

.chat-bubble2 {
	width: 70%;
	background-color: rgb(255, 218, 119);
	margin-left: 15px;
	padding: 5px;
	overflow-wrap: break-word;
	word-wrap: break-word;
}

.chat-question {
	display: flex;
	justify-content: space-between;
	height: 60px;
}

.chat-question>input {
	width: 100%;
	height: 60px;
	border-bottom-left-radius: 20px;
	border: none;
}

.chat-question>input:focus {
	outline: none;
}

.chat-question>button {
	border: none;
	border-bottom-right-radius: 20px;
	width: 100px;
	background-color: rgb(230, 242, 255);
	color: rgb(0, 123, 255);
}

.chat-question>button:focus {
	outline: none;
}

.chat-buttons {
	align-items: center;
	padding: 30px;
	background-color: rgb(251, 246, 240);
}

.chat-button {
	background-color: rgb(230, 242, 255);
	border: none;
	border-radius: 10px;
	width: 200px;
	margin: 5px;
}

.chat-question {
	display: flex;
	justify-content: space-between;
	height: 60px;
}

.chat-question>input:focus {
	outline: none;
}

.chat-question>button {
	border: none;
	border-right-radius: 20px;
	width: 100px;
	background-color: rgb(230, 242, 255);
	color: rgb(0, 123, 255);
}

.chat-question>button:focus {
	outline: none;
}

#chatImg:hover {
	cursor: pointer;
}

.firstChat {
	width: 70%;
	display: flex;
	padding-top: 20px;
}

#msg-content {
	padding-left: 20px;
}
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp"%>
	<script>
		$(function(){
			$.ajax({
				type:"get",
				async:false,
				url:"<%=request.getContextPath()%>/main.no",
				success:function(result){
					let str = "";
					for(let i = 0; i<result.length; i++){
						str += "<li class='notice_list'>"
							+"<div class='noticeDate'>" + result[i].createDate + "</div>"
							+"<div class='noticeTitle'>" + result[i].boardTitle + "</div>"
							+ "</li>"
					}
					$(".notice_lists").html(str);
				}
			});
		});
	
	</script>
	
<	<script>
		$(function(){
			$.ajax({
				type:"get",
				async:false,
				url:"<%=request.getContextPath()%>/main.bo",
				success:function(result){
				console.log(result);
					let str="";
					let url="";
					let bno=0;
					for(let i=0; i<result.length; i++){
						url = result[i].fileName;
						bno = result[i].refBno;
						str += "<li>" +"<div class='cardWrap'>"+"<div class='cards'>"+"<div class='imgWrap mt-3'>"
							+ "<img src="+url+" class='cardImg'>"
							+"<a href="+'<%=request.getContextPath()%>/detail.mate?bno=bno'+" class='btn btn-outline-warning btn-sm my-3'>같이걷개</a>"
							+"</div>"+"</div>"+"</div>"+"</li>"
							
					}
					$(".slides").html(str);	
				}
			});
		});
	
	</script> 


	<div class="main-content">
		<div class="main1">
			<div class="main1-text" data-aos="fade-up">
				집사들을 위한 <br>반려동물<br> 커뮤니케이션 사이트
			</div>
			<div class="main1_img" data-aos="fade-up"></div>
		</div>
		<div class="main2 my-5" data-aos="fade-up">
			<div class="main2_wrap">
				<div class="main2_title">공지사항</div>
				<div>
					<ul class="notice_lists"></ul>
				</div>
			</div>
		</div>
		<div class="dog_land"></div>
		<div class="main3" data-aos="fade-up">
			<div class="slideBoard">
				<div class="slideTitle">같이걷개</div>
				<div class="slideContent">
					<ul class="slides">
						<li>
							<div class="cardWrap">
								<div class="cards">
									<div class="imgWrap mt-3">
										<img src="resources/산책.jpg" class="cardImg"> <a href="#"
											class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="cardWrap">
								<div class="cards">
									<div class="imgWrap mt-3">
										<img src="resources/산책.jpg" class="cardImg"> <a href="#"
											class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="cardWrap">
								<div class="cards">
									<div class="imgWrap mt-3">
										<img src="resources/산책.jpg" class="cardImg"> <a href="#"
											class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="cardWrap">
								<div class="cards">
									<div class="imgWrap mt-3">
										<img src="resources/산책.jpg" class="cardImg"> <a href="#"
											class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="cardWrap">
								<div class="cards">
									<div class="imgWrap mt-3">
										<img src="resources/산책.jpg" class="cardImg"> <a href="#"
											class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main4" data-aos="fade-up">
			<div class="main4Wrap" data-aos="fade-up">
				<div class="main4Title">
					우리집 뽀삐<br> 대체 뭔 생각을 하는가
				</div>
				<div class="main4Content">DBTI를 통해 강아지 성격을 확인해보세요!</div>
				<a href="<%=request.getContextPath()%>/dbti">
					<button class="testGo">테스트하러가기</button>
				</a>
			</div>

		</div>
	</div>
	<div class="chat_icon">
		<img id="chatImg" src="resources/chat_icon.png" width="50px">
	</div>



	<script>
			$(function(){
				$("#chatImg").click(function(){
					 $(".chat-area").css("display","block");
					 $(".chat_icon").css("display","none")
					 let infor = "<div class='firstChat'>"
						 	+"<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png'width='50px' height='50px'>"
					 		+"<div class='chat-bubble'>안녕하세요! 또오개냥에 방문해주셔서 감사합니다:) 무엇을 도와 드릴까요?</div>"
					 		 +"</div>";
			 		$(".chat-content").append(infor);
					$.ajax({
						 url:'<%= contextPath%>/InsertChattBot',
						 type:'get',
						 data:{buyer : ${loginUser.userNo}},
						 success : function(checkResult){
							 if(checkResult == 'N'){
								 console.log("성공/채팅방생성");
							 }else{
								 console.log("성공/메세지 읽어오기");
								 
								 $.ajax({
									 url:'<%=contextPath%>/ReadChatbot',
									 type:'get',
									 data:{reader:${loginUser.userNo}},
									 success:function(mList){
										 console.log("메시지 읽어오기 성공");
										 if(mList!=null){
											 let str = "";
											 for(let i = 0; i<mList.length; i++){
												 if(mList[i].sender != ${loginUser.userNo}){
													 str += "<div class='chat-response'>"
													 	+"<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png'width='50px' height='50px'>"
												 		+"<div class='chat-bubble'>"+mList[i].messageContent+"</div>"
												 		 +"</div>";
												 }else{
													 str += "<div class='chat-request'>"
		                                        			+ "<div class='chat-bubble2'>"+mList[i].messageContent+"</div>"
		                                        			+ "<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png' width='50px' height='50px'>"
		                                        		  +"</div>"; 
												 }
											 }
											 $(".chat-content").append(str);
										 }
									 },
									 error:function(){
										 console.log("메세지 읽어오기 실패");
									 }
								 });
							 }
						 },
						error:function(){
							console.log("ajax통신실패");
						}
					 });
					 websocket();
				});
				
			     $(".btn-close").click(function(){
	                $(".chat-area").css("display","none");
	                $(".chat_icon").css("display","block");
	                $(".chat-content").empty();
	            });
	            
			});
			
			let socket;
			
			function websocket(){
				socket = new WebSocket("ws://localhost:8081<%= contextPath %>/chattingServer")
				
				socket.onopen = function(e){
					console.log("접속성공");
				}
				socket.onmessage = function(e){
					
					let data = JSON.parse(e.data);
					for(let i = 0; i<data.length; i++){
						if('${loginUser.userNo}' == data[i].sender){
							let msg = $("<div class='chat-request'>");
							let img = $("<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png' width='50px' height='50px'>");
							let msgContent = $("<div class='chat-bubble2'>");
							
							msgContent.append(data[i].msg);
							msg.append(msgContent);
							msg.append(img);
							$(".chat-content").append(msg);
						}else{
							let msg = $("<div class='chat-response'>");
	        				let img = $("<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png' width='50px' height='50px'>");
	        				let msgContent = $("<div class='chat-bubble'>");
	        				
	        				msgContent.append(data[i].msg);
	        				msg.append(img);
	        				msg.append(msgContent);
	        				$(".chatContent").append(msg);
						}
					}
				}
				socket.onclose = function(e){
					console.log("접속해제");
				}
				
			}
			
			function sendMsg(){
				let msg = $("#msg-content").val();
				socket.send(msg);
				
				$.ajax({
					url:'<%= contextPath%>/insertChatMessage',
					type:'get',
					data:{ buyer : ${loginUser.userNo}, msg : $("#msg-content").val()},
					success:function(){
						console.log("메시지 전송 성공");
					},
					error: function(){
						console.log("메시지 전송 실패");
					}
				});
				$("#msg-content").val("");
			} 
		</script>



	<!-- 채팅/문의영역  -->
	<div class="chat-area">
		<div class="chat-title">
			<img src="resources/돋보기.png" width="50px"> <span
				style="font-size: 29px; font-weight: bold;">또오개냥 문의하기</span>
			<button type="button" class="btn-close" aria-label="Close"
				style="font-size: 23px; float: right; margin-right: 20px; margin-top: 8px;">X</button>
		</div>

		<div class="chat-content"></div>

		<div class="chat-buttons">
			<button class="chat-button" name='1'>회원탈퇴</button>
			<button class="chat-button" name='2'>이용약관</button>
			<button class="chat-button" name='3'>나눔&거래 방식</button>
			<button class="chat-button" name='4'>산책메이트 신청하기</button>
		</div>

		<div class="chat-question">
			<input type="text" id="msg-content" placeholder="관리자에게 문의해보세요.">
			<button onclick="sendMsg()">전송</button>
		</div>
	</div>
	<script>
        $(document).ready(function () {
            $("button[name='1']").click(function () {
                $(".chat-content").append("<div class='chat-response'>"
                                    +"<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png'width='50px' height='50px'>"
                                    +"<div class='chat-bubble'>마이페이지에서 회원탈퇴를 진행해주시기 바랍니다.</div>"
                                    +"</div>");
            });
            $("button[name='2']").click(function () {
                $(".chat-content").append("<div class='chat-response'>"
                                    +"<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png'width='50px' height='50px'>"
                                    +"<div class='chat-bubble'>쓸말이 읎엉</div>"
                                    +"</div>");
            });
            $("button[name='3']").click(function () {
                $(".chat-content").append("<div class='chat-response'>"
                                    +"<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png'width='50px' height='50px'>"
                                    +"<div class='chat-bubble'>쓸말이 읎엉</div>"
                                    +"</div>");
            });
            $("button[name='4']").click(function () {
                $(".chat-content").append("<div class='chat-response'>"
                                    +"<img src='https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png'width='50px' height='50px'>"
                                    +"<div class='chat-bubble'>쓸말이 읎엉</div>"
                                    +"</div>");
            });
        });
    </script>




	<script>
		AOS.init();

		setInterval(function() {
			$('.dog_land').css({
				'background-position' : '-=7'
			});
		}, 80);
	</script>


	<script>
		var slides = document.querySelector(".slides"), slide = document
				.querySelectorAll(".slides li"), currentIndx = 0, slideCount = slide.length, slideWidth = 250, slideMargin = 10;

		makeClone();

		function makeClone() {
			for (var i = 0; i < slideCount; i++) {
				//a.cloneNode(), a.cloneNode(true) => a의 자식까지 복사
				var cloneSlide = slide[i].cloneNode(true);
				cloneSlide.classList.add('clone');
				//a.appendChind(b)
				slides.appendChild(cloneSlide);
			}

			for (var i = slideCount - 1; i >= 0; i--) {
				//a.cloneNode(), a.cloneNode(true) => a의 자식까지 복사
				var cloneSlide = slide[i].cloneNode(true);
				cloneSlide.classList.add('clone');
				//a.prepend(b)
				slides.prepend(cloneSlide);
			}
			updateWidth();
			setInitialPos();
			setTimeout(function() {
				slides.classList.add('animated');
			}, 100);

		}

		function updateWidth() {
			var currenSlides = document.querySelectorAll(".slides li");
			var newSlideCount = currenSlides.length;

			var newWidth = (slideWidth + slideMargin) * newSlideCount
					- slideMargin + 'px';
			slides.style.width = newWidth;
		}

		function setInitialPos() {
			var initialTranslateValue = -(slideWidth + slideMargin)
					* slideCount;
			// slides {transform:translateX(-1000px);}
			slides.style.transform = 'translateX(' + initialTranslateValue
					+ 'px)';
		}

		function moveSlide(num) {
			slides.style.left = -num * (slideWidth + slideMargin) + 'px';
			currentIndx = num;
			
			if (currentIndx == slideCount || currentIndx == -slideCount) {

				setTimeout(function() {
					slides.classList.remove('animated');
					slides.style.left = '0px';
					currentIndx = 0;
				}, 500);
				setTimeout(function() {
					slides.classList.add('animated');
				}, 600);
			}
		};

		var timer = undefined;

		function autoSlide() {
			if (timer == undefined) {
				timer = setInterval(function() {
					moveSlide(currentIndx + 1);
				}, 3000);
			}
		}
		autoSlide();
		function stopSlide() {
			clearInterval(timer);
			timer = undefined;
		}
		slides.addEventListener('mouseenter', function() {
			stopSlide();
		});
		slides.addEventListener('mouseleave', function() {
			autoSlide();
		});
	</script>

	<%@ include file="views/common/footer.jsp"%>
</body>
</html>