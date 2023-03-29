<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
            width: 900px;
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

        .notice_table {
            width: 700px;
            padding: 0px 10px 0px 10px;

        }

        .notice_table tr, .notice_table td, .notice_table th{
            text-align: center;
            border: 1px solid gray;

        }
        .notice_write_btn{
            text-align: right;
            text-decoration: none;
        }
        .notice_write_btn>a{
            background-color: #FFD133;
            border: 1px solid darkblue;
            color: black;
            margin-bottom: 10px;
        }
        .notice_table>tbody>tr:hover{
        	cursor:pointer;
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
        <div class="item">
            <h2 class="master_notice_title">공지사항 관리</h2>
            
            <div class="notice_write_btn">
                <a class="btn btn-sm btn-primary" href="<%= request.getContextPath() %>/insert.no">글작성</a>
            </div>
            <table class="notice_table">
                <thead>
                    <tr style="background-color: rgb(190, 187, 187);">
                        <th width="20px" height="35px">No.</th>
                        <th width="150px">글제목</th>
                        <th width="100px">작성자</th>
                        <th width="150px">작성일자</th>
                        <th width="40px">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(list.isEmpty()){ %>
                    	<tr>
                    		<td colspan="5">존재하는 공자사항이 없습니다.</td>
                    	</tr>
                    <% } else { %>
                    	
                    	<% for (Board b : list) { %>
							<tr>
								<td><%= b.getBoardNo() %></td>
								<td><%= b.getBoardTitle() %></td>
								<td><%= b.getBoardWriter() %></td>
								<td><%= b.getCreateDate() %></td>
								<td><%= b.getCount() %></td>
							</tr>                    	
                    	<% } %>
                    <% } %>
                    
                    
                    
                </tbody>
            </table>
        </div>
    </div>
	
	<script>
		$(function(){
			$(".notice_table>tbody>tr").click(function(){
				let bno = $(this).children().eq(0).text();
				
				location.href = "<%= request.getContextPath()%>/detail.no?bno="+bno;
			});
		});
		
	
	</script>
	
	

</body>
</html>