<%@ page import="java.util.ArrayList, com.kh.board.free.model.vo.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<Category> categoryList = (ArrayList<Category>) request.getAttribute("categoryList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<%@ include file="../../common/menubar.jsp"%>
<link href="<%= contextPath %>/resources/css/board/free/enroll.css" rel="stylesheet" type="text/css">
<script src="<%= contextPath %>/resources/js/board/free/thumbnail.js"></script>
</head>
<body class="free_submit_all">
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
		<form action="<%=contextPath%>/insert.bf" id="enroll-form" method="post" enctype="multipart/form-data">
			<div class="free_writer">
				<h2 style="font-size: 35px; color: rgb(255, 209, 51);">글쓰기</h2>
				<div class="free_buttons1" align="end">
					<button type="button" class="free_cancel" onClick="history.back()">취소</button>
					<button type="submit" class="free_register">등록</button>
				</div>
			</div>

			<div class="free_category">
				<select name="category" id="category" style="border: 2px solid rgb(204, 204, 204);">
					<%
						for (Category category : categoryList) {
					%>
					<option value="<%=category.getCategoryNo()%>"><%=category.getCategoryName()%></option>
					<%
						}
					%>
				</select>
				<div class="free_content_header" align="center">
					<input type="text" name="title" id="title" placeholder="제목을 입력해주세요.">
				</div>
			</div>

			<div class="free_content_main" align="center">
				<textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>
				
			</div>

			<div class="free_filebox">
				<label for="image" style="font-size: 13px;">파일선택</label>
				<input type="file" id="image" name="upfile" accept="image/*" onchange="setThumbnail(event);" multiple/>
			</div>
			<div id="abcd" align="center"></div>
		</form>
	</div>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>