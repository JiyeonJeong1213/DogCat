<%@ page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
         width: 1000px;
     
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
      .notice{
          width: 750px;
      }
      .notice_enroll{
      	margin-left: 15px;
      }
      .notice-content{
      	  width: 200%;
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
        <div class="item notice">
            <h2 class="master_notice_title">공지사항 작성하기</h2>
            <form action="<%= request.getContextPath() %>/insert.no" method="post" style="border: 1px solid gray;">
                <input type="hidden" name="userNo" value="<%= loginUser.getUserNo()%>">
                <table class="notice_enroll">
                    <tr>
                        <td width="80px">글제목</td>
                        <td width="280px"><input type="text" name="title"></td>
                    </tr>
                    <tr>
                        <td>글내용</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea class="notice-content" name="content" rows="10" style="resize:none;" required >
                            </textarea>
                        </td>
                    </tr>
                </table>
                
                <div class="btn-area">
	                <button type="submit" class="btn btn-secondary btn-sm">등록하기</button>
	                <button type="button" class="btn btn-primary btn-sm" onclick="history.back();">뒤로가기</button>
                </div>
            </form>
        </div>
    </div>




</body>
</html>