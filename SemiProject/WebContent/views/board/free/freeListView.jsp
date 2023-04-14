<%@ page import="com.kh.common.model.vo.PageInfo, java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.board.free.model.dao.FreeDao, com.kh.board.free.model.service.FreeService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String type = request.getParameter("type");
    String keyword = request.getParameter("keyword");

    boolean isSearch = type != null && keyword != null;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
.free_all button:focus,input:focus,select:focus{
	outline: none;
}
.free_header h1 {
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

#free_table {
	border-collapse: collapse;
}

#free_table th {
	background-color: rgb(224, 224, 224);
	border: 1px solid rgb(255, 209, 51);
}

#free_table>tbody>tr>td {
	text-align: center;
	cursor: pointer;
}

#free_table>tbody>tr {
	border-bottom: 1px solid black;
}

.free_container {
	max-width: 1460px;
	margin: 0 auto;
	padding: 20px;
	align-items: center;
}

.free_search {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	margin-left: 520px;
}

.free_search-options {
	margin-left: 468px;
}

.free_search input[type="text"] {
	width: 320px;
	height: 40px;
	padding: 0 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.free_search button {
	width: 80px;
	height: 40px;
	color: #fff;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	
}

.free_write {
	margin-left: 208px;
	border: 10px solid rgb(230, 242, 255);
	background-color: rgb(230, 242, 255);
	border-radius: 7px;
	width: 73px;
	text-align: center;
}

.free_page {
	display: flex;
	justify-content: center;
}

.free_page button {
	display: block;
            margin: 0 5px;
            width: 30px;
            height: 30px;
            text-align: center;
            color: #333;
            border: 1px solid #ccc;
            border-radius: 20%;
            text-decoration: none;
}

.free_page button:hover {
	background-color: rgb(255, 209, 51);
	color: #fff;
}

.free_search-options select {
	width: 100px;
	height: 40px;
	padding: 5px;
	color: black;
	font-size: 13px;
}
</style>
</head>
<body class="free_all">
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
	<table id="free_table" align="center" border="0">
	
		<thead>
			<tr style="text-align: center;">
				<th style="width: 80px;">No.</th>
				<th style="width: 140px;">카테고리</th>
				<th style="width: 420px;">제목</th>
				<th style="width: 150px;">작성자</th>
				<th style="width: 180px;">작성일</th>
				<th style="width: 100px;">조회수</th>
			</tr>
		</thead>
		
		<tbody>
<% if(list.isEmpty()) {%>
			<tr>
				<td colspan="6">조회된 리스트가 없습니다.</td>
			</tr>
<% } else { 
				for(Board b  :  list) { %>
			<tr>
				<td><%= b.getBoardNo() %></td>
				<td><%= b.getBoardCategory() %></td>
				<td><%= b.getBoardTitle() %></td>
				<td><%= b.getBoardWriter() %></td>
				<td><%= b.getCreateDate() %></td>
				<td><%= b.getCount() %></td>
			</tr>
	<% } %>
<% } %>
		</tbody>
		
	</table>

	<div class="free_container">
		<div class="free_search">
		    <form name="search" method="get" action="<%=contextPath%>/searchWordAction.bf">
			<input type="text" id="searchWord" name="searchText" placeholder="제목/작성자 검색">
			<button type="submit" class="free_search_btn">검색</button>
			</form>
			<% if(loginUser != null) { %>
			<a href="<%=contextPath%>/insert.bf" class="free_write" style="color: rgb(0, 123, 255); text-decoration: none; margin-left: 205px;" >글쓰기</a>
			<% } %>
		</div>
		
		<div class="free_page">
		<% if(currentPage != 1) { %>
			<button class="arrow left-arrow" onclick="location.href = '<%=contextPath %>/list.bf?currentPage=<%= currentPage -1 %>'">&lt;</button> 
			<% } else {%>
			<button class="arrow left-arrow" onclick="location.href = '<%=contextPath %>/list.bf?currentPage=<%= currentPage %>'">&lt;</button> 
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++ ) { %>
			
				<% if(i != currentPage) { %>
					<button onclick="location.href = '<%=contextPath%>/list.bf?currentPage=<%= i %>'; "><%= i %></button> 
				<% } else { %>
					<button disabled><%=i %></button>
				<% } %>
				
			<% } %>
			
			<% if(currentPage != maxPage) { %>
				<button class="arrow right-arrow" onclick="location.href = '<%=contextPath %>/list.bf?currentPage=<%=currentPage + 1 %>'">&gt;</button>
			<% } else {%>
				<button class="arrow right-arrow" onclick="location.href = '<%=contextPath %>/list.bf?currentPage=<%=currentPage %>'">&gt;</button>
			<% } %>
		</div>
	</div>
	

<%@ include file="../../common/footer.jsp"%>



	<script>
		$(function(){
			$("#free_table>tbody>tr").click(function(){
				let bno = $(this).children().eq(0).text();
				location.href = '<%= contextPath %>/detail.bf?bno='+bno;
			});
		});
	</script>


</body>
</html>