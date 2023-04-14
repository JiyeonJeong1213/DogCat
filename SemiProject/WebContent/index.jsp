<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>또오개냥 메인페이지</title>
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

.main1, .main4 {
	width: 100%;
	text-align: center;
	padding-top: 40px;
}

.main1-text, .main4-text {
	font-size: 45px;
	font-family: 'yg-jalnan', verdana, tahoma;
	color: #F7E3A5;
	text-shadow: -2px 0 #4758A8, 0 2px #4758A8, 2px 0 #4758A8, 0 -2px
		#4758A8;
}

.main1_img {
	width: 100%;
	background-image: url("resources/강아지들.png");
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

.main2_title::before {
	content: "NEWS";
	position: absolute;
	left: 0px;
	top: 0px;
	font-style: normal;
	font-weight: 400;
	font-size: 20px;
	line-height: 15px;
	color: rgb(51, 51, 51);
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

.slide_wrapper {
	position: relative;
	width: 1050px;
	margin: 0 auto;
	height: 500px;
	overflow: hidden;
}

.slides {
	position: absolute;
	left: 0;
	top: 0;
	padding-left: 10px;
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

a {
	text-decoration: none;
	color: black;
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
	
	<script>
		$(function(){
			$.ajax({
				type:"get",
				async:false,
				url:"<%=request.getContextPath()%>/main.bo",
				success:function(result){
					console.log(result);
					
					return result;		
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
		<div class="main4" data-aos="fade-up">
			<div class="main4-text mb-3">
				실시간 메이트들의<br>활동을<br>확인해보세요.
			</div>
			<div class="slide_wrapper">
				<ul class="slides">
					<li>
						<div class="cardWrap">
							<div class="cards">
								<div class="imgWrap mt-3">
									<img src="resources/산책.jpg" class="cardImg">
									<a href="#" class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="cardWrap">
							<div class="cards">
								<div class="imgWrap mt-3">
									<img src="resources/산책.jpg" class="cardImg">
									<a href="#" class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="cardWrap">
							<div class="cards">
								<div class="imgWrap mt-3">
									<img src="resources/산책.jpg" class="cardImg">
									<a href="#" class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="cardWrap">
							<div class="cards">
								<div class="imgWrap mt-3">
									<img src="resources/산책.jpg" class="cardImg">
									<a href="#" class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="cardWrap">
							<div class="cards">
								<div class="imgWrap mt-3">
									<img src="resources/산책.jpg" class="cardImg">
									<a href="#" class="btn btn-outline-warning btn-sm my-3">같이걷개</a>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="chat_icon">
			<a href="#"><img src="resources/chat_icon.png" width="50px"></a>
		</div>


	</div>



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