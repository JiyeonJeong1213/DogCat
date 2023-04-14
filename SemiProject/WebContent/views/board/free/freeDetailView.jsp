<%@ page import="java.util.ArrayList, com.kh.board.free.model.vo.Reply, com.kh.board.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Board b = (Board) request.getAttribute("b");
Attachment at = (Attachment) request.getAttribute("at");
ArrayList<Reply> list = (ArrayList<Reply>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<%@ include file="../../common/menubar.jsp"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<%= contextPath %>/resources/css/board/free/detail.css" rel="stylesheet" type="text/css">
</head>

<body class="free_detail_all">
    <div class="free_header" align="center">
        <div class="free_img1">
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-dog-2396837.png"
                alt="" width="44" height="45">
        </div>
        <div class="free_img2">
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%ED%95%9C%EB%8F%99%ED%9C%98/free-icon-cat-2195875.png"
                alt="" width="44" height="45">
        </div>
        <h1>멍냥수다방</h1>
        <p>우리 아이 자랑도하고 정보도 나누고<br>
            궁금한 건 질문도 해요!
        </p>
    </div>
    <div class="free_main">
		<table id="detail-area"  align="center" border="1">
        	<div class="free_content_header" align="center" >
            <input type="text" name="free_content_header1" id="free_content_header1" value="[<%= b.getBoardCategory() %>] <%= b.getBoardTitle()%>" readonly>
            <input type="text" name="free_content_header2" id="free_content_header2" value="<%=b.getBoardWriter() %> || <%=b.getCreateDate() %> || <%= b.getCount()%>" readonly>
        </div>

<% if(at == null ) { %>
        <div class="free_content_main">
            <p><%= b.getBoardContent() %></p>
        </div>
        <div class="free_content_file">
	        <p style="color: rgb(94, 94, 94);">사진 파일 : 	
					첨부파일이 없습니다	
			</p>
		</div>
<% } else { %>
		<div class="free_content_main">
            <p><%= b.getBoardContent() %></p>
            <img src= "<%=contextPath %>/<%= at.getFilePath()+at.getChangeName() %>" width="450" height="auto">
            
        </div>        
        <div class="free_content_file">
	        <p style="color: rgb(94, 94, 94);">사진 파일 : 
					<a download="<%=at.getOriginName() %>" href="<%=contextPath %>/<%= at.getFilePath()+at.getChangeName() %>" style="text-decoration: none; color: rgb(255, 209, 51);"><%=at.getOriginName() %> </a>
			</p>
		</div>
<% } %>
		
		</table>
        <div class="free_buttons1" align="center">
            <a href="<%=contextPath %>/list.bf?currentPage=1" class="free_back" style="text-decoration: none; color: rgb(0, 123, 255);">목록으로</a>
            
			<% if(loginUser != null && loginUser.getUserId().equals( b.getBoardWriter())) {%>
				<a href="<%= contextPath %>/update.bf?bno=<%=b.getBoardNo() %>" class="free_retouch" style="text-decoration: none; color: rgb(0, 123, 255);">수정하기</a>
				<button onclick="deleteBoard();" class="free_delete" >삭제하기</button>
			<% } %>	
        </div>
        <br><br><br><br>
    </div>
    
    	<div id="reply-area">
			<table class="free_table" border="1" align="center">
				<thead>
					<% if(loginUser != null) { %>
						<!--  로그인이 되어있을 경우 -->
						<tr>
							<td style="border: 2px solid #ccc;">
                        		<textarea id="replyContent" cols="50" rows="3" style="resize:none;"></textarea>
                    		</td>
                    		<th style="text-align: center; border: none;">
                    		<button style="width: 100%; height: 83px;" onclick="insertReply();"><b>댓글등록</b></button>
                    		</th>
						</tr>
					<% } else { %>
						<tr>
							<td style="border: 2px solid #ccc;">
                        		<textarea id="replyContent" cols="50" rows="3" style="resize:none;" readonly>로그인후 이용가능한 서비스입니다.</textarea>
                    		</td>
                    		<th style="text-align: center; border: none;">
                    		<button style="width: 100%; height: 60px;" onclick="insertReply();" disabled><b>댓글등록</b></button>
                    		</th>
						</tr>
					<% } %>
				</thead>
				<tbody>
					<% for(Reply r : list){ 
					
						int replyNo = r.getReplyNo();
					%>
						<tr id="replyTr_<%= replyNo %>">
							<td class="main_td">
							<span><b><%=r.getReplyContent() %></b></span><br>
							
							<span><%=r.getReplyWriter() %></span><br>
							
                    		<span class="td_date"><%=r.getCreateDate() %></span>
                    		
							</td>
							
							<% if(loginUser != null && loginUser.getUserId().equals( r.getReplyContent())) {%>
							<td class="button_td" valign="top" style="border: 2px solid #ccc; border-left: none;">
							<button class="reply_update" onclick="updateReply();">수정</button>
                        	
                   			<button class="reply_delete" onclick="deleteReply(<%= replyNo %>);">삭제</button>
							</td>
							<% } else { %>
							<td class="button_td" valign="top" style="border: 2px solid #ccc; border-left: none;">
							</td>
							<% } %>
						</tr>
					<% } %>
					
				</tbody>
			</table>
		</div>
	</div>

	<script>
		function deleteBoard(){
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			location.href = "<%= contextPath %>/delete.bf?bno=<%= b.getBoardNo() %>";
		}
	
	
		function insertReply(){
			$.ajax({
				url : "<%= contextPath%>/rinsert.bf",
				data :{
					content : $("#replyContent").val() , 
					bno     : "<%= b.getBoardNo() %>"
				}, 
				success : function(result){
					
					if(result > 0){
						
						selectReplyList();
						
						$("#replyContent").val("");
					}
					
				}, error : function(){
					console.log("댓글작성실패")
				}
			})
		}
		
		function selectReplyList(){
			
			$.ajax({
				url : "<%= contextPath %>/rlist.bf",
				data : {bno : "<%= b.getBoardNo() %>"},
				success : function(list){
					
					let result  = "";
					for(let i of list){
						  result += "<tr>" +
									"<td class=\"main_td\">"+
									"<span><b>"+ i.replyContent + "</b></span><br>" +
									"<span>"+ i.replyWriter +"</span><br>" +
		                    		"<span class=\"td_date\">" + i.createDate + "</span>" +                    		
									"</td>"+
									"<td class=\"button_td\" valign=\"top\" style=\"border: 2px solid #ccc; border-left: none;\">" +
									"<button class=\"reply_update\" onclick=\"updateReply();\">수정</button>" +                        	
		                   			"<button class=\"reply_delete\" onclick=\"deleteReply();\">삭제</button>" +
									"</td>" +
									"</tr>"	
						
					}
					
					$("#reply-area tbody").html(result);
				},
				error : function(){
					console.log("게시글 목록조회 실패")
				}
			});
		}
		
		function deleteReply(replyNo){
			if (!confirm("삭제하시겠습니까?")) {
		        return;
		    }
		    $.ajax({
		        url: "<%= contextPath %>/rdelete.bf",
		        data: { replyNo : replyNo },
		        success: function(result){
		            if (result=="OK") {
		                $("#replyTr_"+replyNo).remove();
		                alert("삭제되었습니다.");
		            } else{
		                alert("이미 삭제된 댓글입니다.");
		            }
		        }
		    });
		}
	</script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>