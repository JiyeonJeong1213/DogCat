<%@ page import="com.kh.board.model.vo.Board, com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b= (Board) request.getAttribute("b");
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container {
	    display: flex;
	    justify-content: space-evenly;
	    align-items: flex-start;
	    padding: 10px;
	    width: 800px;
	}
	.profile {
	    text-align: center;
	}
	.profile_img {
	    background-image: url(resources/chatbot.png);
	    background-size: contain;
	    background-repeat: no-repeat;
	    width: 80px;
	    height: 80px;
	    border-radius: 100%;
	    margin: 0 auto;
	}
	.master_notice_title {
         border-bottom: #FFD133 solid;
         width: 250px;
         font-weight: bold;
         text-align: center;
    }
	.notice-detail{
		border: 1px solid gray;
		width: 700px;
		
	}
	 .btn-area{
      	text-align:center;
      	padding: 10px;
      	margin:10px;
      }
</style>
</head>
<body>

<%@ include file= "../../admin/adminMenubar.jsp" %>

	<div class="container">
	 	<div class="item profile">
            <div class="profile_img" style="background-color: gray;"></div>
            <div style="font-weight: bold;">관리자님</div>
        </div>
		<div class="item notice-detail">
            <h2 class="master_notice_title">공지사항 상세보기</h2>
            
            <table class="detail-area"border="1">
                <tr>
                    <th width="80px">글제목</th>
                    <td width="280px" colspan="3"><%= b.getBoardTitle() %></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%= b.getBoardWriter() %></td>
                    <th>작성일</th>
                    <td><%= b.getCreateDate() %></td>
                </tr>
                <tr>
                	<th>내용</th>
                    <td colspan="3">
                    	<p style="height:150px;"><%= b.getBoardContent() %></p>
                    </td>
                </tr>
            </table>
            
            <div class="btn-area">
            	<a href="<%= request.getContextPath()%>/list.no" class="btn btn-secondary btn-sm">목록</a>
            	<% if(loginUser != null && loginUser.getUserNickname().equals(b.getBoardWriter())) { %>
            		<a href="<%= request.getContextPath()%>/update.no?bno=<%=b.getBoardNo() %>" class="btn btn-secondary btn-sm">수정</a>
            		<a href="<%= request.getContextPath()%>/delete.no?bno=<%=b.getBoardNo() %>" class="btn btn-danger btn-sm">삭제</a>
            	<% } %>
            
            </div>
        </div>
	
	</div>
</body>
</html>