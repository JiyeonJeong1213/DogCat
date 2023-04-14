<%@ page import="java.util.ArrayList, com.kh.board.free.model.vo.Category, com.kh.board.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<Category> categoryList = (ArrayList<Category>) request.getAttribute("list");
	System.out.println(categoryList);
	Board b = (Board) request.getAttribute("b");
	Attachment at = (Attachment) request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 수정</title>
<style>
.free_submit_all button:focus,input:focus, textarea:focus, select:focus{
	outline: none;
}

.free_submit_all h1 {
	color: rgb(255, 209, 51);
	font-family: Arial, sans-serif;
	border-bottom: 1px solid black;
	line-height: 50px;
}

.free_header {
	position: relative;
	margin-top: 60px;
}

.free_img1 {
	position: absolute;
	bottom: 60px;
	right: 274px;
	left: 0;
}

.free_img2 {
	position: absolute;
	right: 0px;
	left: 279px;
	bottom: 61px;
}

.free_submit_all a {
	text-decoration: none;
	color: black;
}

.free_main {
	max-width: 1460px;
	margin: 0 auto;
	padding: 20px;
}

.free_category {
	display: flex;
	margin-left: 266px;
	margin-top: 2px;
}

.free_filebox {
	margin-left: 266px;
    margin-top: -5px;
}

.free_writer {
	display: flex;
	align-items: end;
	margin-left: 263px;
}

.free_buttons1 {
	margin-left: 560px;
    margin-bottom: -2px;
}

.free_buttons1>.free_cancel {
	padding: 10px 35px;
	font-size: 16px;
	font-weight: bold;
	color: rgb(64, 64, 64);
	background-color: rgb(224, 224, 224);
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.free_buttons1>.free_register {
	padding: 10px 35px;
	font-size: 16px;
	font-weight: bold;
	color: rgb(0, 123, 255);
	background-color: rgb(230, 242, 255);
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.free_content_header>input[type="text"] {
	width: 740px;
    height: 48px;
	padding: 0 10px;
	border: 2px solid #ccc;
	border-radius: 5px;
}

.free_content_main>textarea {
	width: 888px;
	height: 450px;
	padding: 0 10px;
	border: 2px solid #ccc;
	border-radius: 5px;
	resize: none;
}

.free_content_main {
	margin-right: 0px;
}

.free_category>select {
	width: 148px;
	height: 48px;
	color: black;
	font-size: 13px;
	text-align: center;
	border-radius: 5px;
}

.free_filebox label {
	display: inline-block;
	padding: .3em .4em;
	color: rgb(255, 255, 255);
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: rgb(0, 123, 255);
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.free_filebox input[type="file"] {
	width: 1px;
	height: 1px;
}

#abcd img{
	width: 443px;
    height: auto;
}

#abcd{
	margin-left: 268px;
    margin-right: 266px;
}
</style>
</head>
<body class="free_submit_all">
	<%@ include file="../../common/menubar.jsp"%>
	<div class="free_header" align="center">
		<div class="free_img1">
			<img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png" alt="" width="44" height="45">
		</div>
		<div class="free_img2">
			<img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png" alt="" width="44" height="45">
		</div>
		<h1>멍냥수다방</h1>
		<p>
			우리 아이 자랑도하고 정보도 나누고<br> 궁금한 건 질문도 해요!
		</p>
	</div>
	<div class="free_main">
		<form action="<%=contextPath%>/update.bf" id="update-form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
			<div class="free_writer">
				<h2 style="font-size: 35px; color: rgb(255, 209, 51);">수정하기</h2>
				<div class="free_buttons1" align="end">
					<button type="button" class="free_cancel" onClick="history.back()">취소</button>
					<button type="submit" class="free_register">등록</button>
				</div>
			</div>

			<div class="free_category">
				<select name="category" id="category" style="border: 2px solid rgb(204, 204, 204);">
					<% for(Category c : categoryList){ %>
								<option value="<%=c.getCategoryNo() %>"  
								<% if(c.getCategoryName().equals(b.getBoardCategory())){ %>
									selected="selected"
								<% } %>
								><%=c.getCategoryName() %></option>	
							<%} %>
				</select>
				
						<script>
							$(function(){
									
								$("#update-form option").each(function(){
									if($(this).text() == "<%= b.getBoardCategory() %>"){
									}	
								})
							})
						</script>
						
				<div class="free_content_header" align="center">
					<input type="text" name="title" id="title" value="<%=b.getBoardTitle() %>" required>
				</div>
			</div>

			<div class="free_content_main" align="center">
				<textarea name="content" id="content" cols="30" rows="10" required><%=b.getBoardContent() %></textarea>
			</div>

			<div class="free_filebox">
				<label for="image" style="font-size: 13px;">파일선택</label>
				<% if(at != null) { %>
							<%= at.getOriginName() %>
							
							<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
							<input type="hidden" name="changeFileName" value="<%= at.getChangeName() %>">
						<% } %>
				<input type="file" id="image" name="upfile" accept="image/*" onchange="setThumbnail(event);" multiple/>
			</div>
			<div id="abcd" align="center"></div>
			<br>
			
		</form>
	</div>
	
	<%@ include file="../../common/footer.jsp"%>
	
	<script>
      function setThumbnail(event) {
        for (var image of event.target.files) {
          var reader = new FileReader();

          reader.onload = function(event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            document.querySelector("div#abcd").appendChild(img);
          };

          console.log(image);
          reader.readAsDataURL(image);
        }
      }
    </script>
</body>
</html>