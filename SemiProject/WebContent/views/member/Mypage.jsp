<%@ page import="com.kh.member.model.vo.Member, java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.chat.model.vo.Chatroom, 
      com.kh.save.model.vo.Save, com.kh.count.model.vo.Count, com.kh.reply.model.vo.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
   ArrayList<Board> mlist = (ArrayList<Board>)request.getAttribute("mlist");      
   ArrayList<Chatroom> clist = (ArrayList<Chatroom>)request.getAttribute("clist");
   ArrayList<Save> slist = (ArrayList<Save>)request.getAttribute("slist");
   ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist");
   Count count = (Count) request.getAttribute("count");
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
.mypage {
   margin-top: 50px;
   height: 15%;
}

.profile_img {
   width: 70px;
   /*height: 60px;*/
   border-radius: 70%;
   margin: 0 auto;
   overflow: hidden;
}

#profileImg {
   width: 80%;
    height: 90%;
    object-fit: cover;
    margin-left: 17px;
    margin-top: 10px;
}

.mypage>h1 {
   text-align: center;
   font-size: xx-large;
   font-family: 'Lilita One', cursive;
   height: 20%;
   margin-top: 20px;
   margin-right: 110px;
   margin-left: 100px;
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
   height: 195px;
   border-radius: 50%;
   background-color: rgba(52, 152, 219, 0.52);
   /*margin: 20px 0px 15px 0px;*/
   margin-top: -50px;
   margin-left: 150px;
}

.myprofile {
   display: flex;
   justify-content: center;
   margin-top: 50px;
   margin-left: 190px;
}

#file, #reset-file {
   display: none;
}

.btn-upload, .btn-reset {
   height: 40px;
   padding: 5px 10px;
   border-radius: 15px;
   text-align: center;
   width: 120px;
   border: 3px solid #FFD133;
   color: #FFD133;
   margin-right: 30px;
}

/* .btn-upload {
   width: 120px;
   border: 3px solid #FFD133;
   color: #FFD133;
   margin-right: 30px;
} */

#reset-file{
   width: 80px;
}

#changebutton {
   width: 105px;
   height: 45px;
   font-size: small;
   border: 3px solid rgba(52, 152, 219, 0.52);
   border-radius: 15px;
}

.btn-reset {
   width: 120px;
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
<%@ include file="../common/menubar.jsp" %>
<div class="mypage">
   <h1 style="color: cornflowerblue; font-size: 60px;" onclick="">MyPage</h1>
</div>

<div class="content">
   <form action="<%= contextPath%>/userprofileupdate" method="post" enctype="multipart/form-data">
      <div class="content_2">
         <div class="myprofile_img">
            <input type="hidden" name="userNo"
               value="<%= loginUser.getUserNo() %>">
            <div class="img">
               <%if(loginUser.getFileName()!= null){ %>
               	<img id="profileImg" src="<%=request.getContextPath() %>/<%=loginUser.getFileName() %>">
               <%}else{ %>
               <img id="profileImg" src="resources/profile_basic.png">
               <%} %>
            </div>
            
	         </div>
	         <div class="myprofile">
	            <input type="file" name="file" id="file" >
	            <label for="file" class="btn-upload" >프로필 선택</label> 
	            
	            <input type="submit" name="reset-file" id="reset-file" onchange="" > 
	            <label for="reset-file" class="btn-reset">변경하기</label>
	         </div>
	      </div>
	   </form>
	   <div class="content_3">
	      <div class="info">
	         <table id="table">
	            <tr id="mymenu">
	               <th id="username" style="color: #FFD133;"><%= loginUser.getUserNickname()%>님</th>
	               <th id="board">게시글</th>
	               <th id="likelist">찜목록</th>
	               <th id="chatting">채팅</th>
	               <th id="walk mate" style="text-align: center; color: rgba(52, 152, 219, 0.52);">산책메이트</th>
	            </tr>
	            <tr>
	               <td><button type="button" id="changebutton" style="width: 150px;">
	               <a href="<%=contextPath%>/updateuser.me" style= "text-decoration: none;">회원정보 수정</a></button></td>
	               
	               <td style="text-align: center;"><%= count.getbCount()%></td>
	               <td style="text-align: center;"><%= count.getsCount()%></td>
	               <td style="text-align: center;"><%= count.getcCount()%></td>
	               <td style="text-align: center;"><%= count.getmCount()%></td>
	            </tr>
	         </table>
	      </div>
	   </div>
   <div class="content_4">
      <div class="content4_category">
         <div class="category_swiper">
            <button id="btn1" class="category_button">작성글</button>
         </div>
         <div class="category_swiper">
            <button id="btn2" class="category_button">채팅</button>
         </div>
         <div class="category_swiper">
            <button id="btn3" class="category_button">찜목록</button>
         </div>
         <div class="category_swiper">
            <button id="btn4" class="category_button">작성댓글</button>
         </div>
         <div class="category_swiper">
            <button id="btn5" class="category_button">산책메이트</button>
         </div>
      </div>
      <form id="free_main2" action="" method="post" class="category">
         <table>
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
            <table>
               <thead id="thead3">
                  <tr align="center">
                     <th style="width: 120px;">채팅방 번호</th>
                     <th style="width: 600px;">채팅방 이름</th>
                     <th style="width: 200px;">닉네임</th>
                     <th style="width: 250px;">날짜</th>
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
      <div class="content4_save" style="display:none;">
         <form id="free_main4" action="" method="post">
            <table>
               <thead id="thead4">
                  <tr align="center">
                     <th style="width: 120px;">게시글 번호</th>
                     <th style="width: 600px;">찜게시글 제목</th>
                     <th style="width: 200px;">회원번호</th>
                     <th style="width: 250px;">게시글 내용</th>
                     <!-- <th style="width: 100px;">조회수</th> -->
                  </tr>
               </thead>
               <tbody>
                  <%if(slist != null){ %>
                  <%for(Save s: slist) { %>
                  <tr align="center">
                     <td><%= s.getBoardNo()%></td>
                     <td><a href="#"><%= s.getBoardTitle() %></a></td>
                     <td><%= s.getUserNo() %></td>
                     <td><%= s.getBoardContent()%></td>
                     <%-- <td><%= b.getCount() %></td> --%>
                  </tr>
                  <% } %>
                  <%} else{ %>
                  <tr align="center">
                     <td colspan="5">조회된 찜목록이 없습니다.</td>
                  </tr>
                  <% } %>
               </tbody>
            </table>
         </form>
      </div>
      <div class="content4_reply" style="display:none;">
      <form id="free_main5" action="" method="post">
           <table>
            <thead id="thead5">
                        <tr align="center">
                            <th style="width: 120px;">댓글번호</th>
                            <th style="width: 200px;">게시글 번호</th>
                            <th style="width: 180px;">회원번호</th>
                            <th style="width: 600px;">댓글내용</th>
                            <th style="width: 200px;">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                       <%if(rlist != null){ %>
                     <%for(Reply r: rlist) { %>
                     <tr align="center">
                     <td><%= r.getReply_No()%></td>
                     <td><%= r.getRef_Bno()%></td>
                     <td><%= r.getReply_Writer()%></td>
                     <td><a href="#"><%= r.getReply_Content()%></a></td>
                     <td><%= r.getCreate_Date()%></td>      
                  </tr>
                  <% } %>
                  <%} else{ %>
                  <tr align="center">
                     <td colspan="5">조회된 댓글이 없습니다.</td>
                  </tr>
                  <% } %>
                    </tbody>
                </table>
            </form>
          </div> 
          <div class="content4_mate" style="display:none;">
      <form id="free_main6" action="" method="post">
           <table>
            <thead id="thead5">
                        <tr align="center">
                            <th style="width: 200px;">게시글 번호</th>
                            <th style="width: 600px;">내용</th>
                            <th style="width: 180px;">작성자</th>
                            <th style="width: 200px;">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                       <%if(mlist != null){ %>
                     <%for(Board m: mlist) { %>
                     <tr align="center">
                     <td><%= m.getBoardNo()%></td>
                     <td><a href="#"><%= m.getBoardTitle()%></a></td>
                     <td><%= m.getBoardWriter()%></td>
                     <td><%= m.getCreateDate()%></td>      
                  </tr>
                  <% } %>
                  <%} else{ %>
                  <tr align="center">
                     <td colspan="5">조회된 댓글이 없습니다.</td>
                  </tr>
                  <% } %>
                    </tbody>
                </table>
            </form>
          </div> 
      </div>
   </div>



<script>
$('input[name="file"]').change(function(){
    setImageFromFile(this, '#profileImg');
});

function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
    $(expression).attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
  }
}

const btn1 = document.getElementById('btn1');
const category = document.querySelector(".category");
const btn2 = document.getElementById('btn2');
const chat = document.querySelector(".content4_chatroom");
const btn3 = document.getElementById('btn3');
const save = document.querySelector(".content4_save");
const btn4 = document.getElementById('btn4');
const reply = document.querySelector(".content4_reply");
const btn5 = document.getElementById('btn5');
const mate = document.querySelector(".content4_mate");


function hideAllExcept(divToShow) {
 
  if (divToShow === category) {
    chat.style.display = 'none';
    save.style.display = 'none';
    reply.style.display = 'none';
    mate.style.display = 'none';
  } else if (divToShow === chat) {
    category.style.display = 'none';
    save.style.display = 'none';
    reply.style.display = 'none';
    mate.style.display = 'none';
  } else if (divToShow === save) {
    category.style.display = 'none';
    chat.style.display = 'none';
    reply.style.display = 'none';
    mate.style.display = 'none';
  } else if (divToShow === reply) {
    category.style.display = 'none';
    chat.style.display = 'none';
    save.style.display = 'none';
    mate.style.display = 'none';
  } else if (divToShow === mate) {
    category.style.display = 'none';
    chat.style.display = 'none';
    save.style.display = 'none';
    reply.style.display = 'none';
  }
}

btn1.addEventListener('click', function() {
  if (category.style.display === 'none') {
    category.style.display = 'block';
    hideAllExcept(category); 
  } else {
    category.style.display = 'none';
  }
});

// 채팅
btn2.addEventListener('click', function() {
  if(chat.style.display === 'none'){
    chat.style.display = 'block';
    hideAllExcept(chat); 
  } else {
    chat.style.display = 'none';
  }
});

// 찜목록
btn3.addEventListener('click', function() {
  if(save.style.display === 'none'){
    save.style.display = 'block';
    hideAllExcept(save); 
  } else {
    save.style.display = 'none';
  }
});

// 댓글
btn4.addEventListener('click', function() {
  if(reply.style.display === 'none'){
    reply.style.display = 'block';
    hideAllExcept(reply); 
  } else {
    reply.style.display = 'none';
  }
});

// 산책메이트
btn5.addEventListener('click', function() {
  if(mate.style.display === 'none'){
    mate.style.display = 'block';
    hideAllExcept(mate); 
  } else {
    mate.style.display = 'none';
  }
});

</script>

</body>
</html>