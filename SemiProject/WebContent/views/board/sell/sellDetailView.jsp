<%@ page import="java.util.ArrayList, com.kh.board.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Board b = (Board)request.getAttribute("b");
	String address = b.getAddress();
	int index = address.indexOf(",");
	String address1 = address.substring(0,index);
	String address2 = address.substring(index+1);
	
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
        box-sizing: border-box;
        /* border: 1px solid lightgray; */
        line-height: 35px;
    }
    #contents {
        width: 1200px;
        height: auto;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
    }
    #page-title {
        text-align: center;
        color: #FFD133;
        font-size: 35px;
    }
    hr {
        margin: 5px 0;
        border: 0.7px solid lightgray;
    }
    #page-description {
        text-align: center;
        font-size: 13px;
        margin-bottom: 30px;
    }

    #button-area {
        display: flex;
        justify-content: right;
    }
    #button-area button {
        border-radius: 7px;
        border: 0;
        padding: 5px 15px;
        font-size: 20px;
    }
    #button-area button:focus{
    	border: none;
        outline: none;
    }
    #chatting {
        background-color: rgb(230, 242, 255);
        color: rgb(0, 123, 255);
    }
    #like {
    	background-color: #FFD133;
    	color: white;
    }
    .search2 {
        display: none;
    }
    #title-area {
        display: flex;
        justify-content: space-evenly;
    }
    #title-area div, #title-area2 div {
        border: 2px solid rgb(204, 204, 204);
        height: 40px;
        color: black;
        font-size: 15px;
        border-radius: 5px;
        padding: 0 10px;
    }
    #title-area .address {
        width: 150px;
        text-align: center;
    }
    #title-area .content-title {
        width: 888px;
    }
    #title-area2 div {
        width: 100%;
    }
    #content-area>div{
        width: 100%;
        height: 450px;
        padding: 0 10px;
        border: 2px solid #ccc;
        border-radius: 5px;
        resize: none;
    }
    h5 {
        color: #FFD133;
    }
    #map {
    	margin-bottom: 5px;
    }
    #under-button {
    	display: flex;
        justify-content: center;
    }
    #under-button>button {
    	border-radius: 7px;
        border: 0;
        padding: 5px 15px;
        font-size: 15px;
    }
    #under-button button:focus{
    	border: none;
        outline: none;
    }
    #updateBtn {
    	background-color: #FFD133;
    	color : white;
    }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	
	<div id="contents">
        <div id="page-title">
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/KakaoTalk_20230316_095326819_01.png" width="45px">
            나눔&거래
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/KakaoTalk_20230316_095326819_02.png" width="45px">
        </div>
        <hr>
        <div id="page-description">
            우리 아이가 좋아하지 않는 장난감, 옷, 사료 등을 팔고, <br>
            필요한 물품들을 싸게 사보세요!
        </div>

        <div id="button-area">
        	<c:if test="${!empty loginUser and loginUser.userId ne b.boardWriter}">
        		<button type="button" id="like">찜하기</button>
                <button type="button" id="chatting">구매 문의 채팅</button>
            </c:if>
        </div>
        <div id="title-area">
            <div class="address" id="address1"><%= address1 %></div>
            <div class="address" id="address2"><%= address2 %></div>
            <div class="content-title"><%= b.getBoardTitle() %></div>
        </div>
        <div id="title-area2">
            <div class="title-detail"><%=b.getBoardWriter() %> || <%=b.getCreateDate() %> || <%= b.getCount() %></div>
        </div>
        <div id="content-area">
            <div id="content-main">
            	<%= b.getBoardContent() %>
            	<br><br>
            
	            <c:if test="${!empty requestScope.list }">
	        		<c:forEach var="at" items="${requestScope.list }" varStatus="status">
	        			<img src="<%=contextPath%>${at.filePath}${at.changeName}" width='150' height='120'>
	        			<br>
	        		</c:forEach>
	        	</c:if>
            </div>
        </div>

        <hr>
        <h5>거래 희망 장소</h5>
        <div id="map" style="width:100%; height:350px;">

        </div>
        
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae890d646304659e5b68c9a99be204bf"></script>
        <script>
        const lat = <%=b.getLatitude() %>;
        const long = <%= b.getLongitude()%>;
        
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(lat, long), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
        
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
        var marker = new kakao.maps.Marker({ 
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter() 
        }); 
        // 지도에 마커를 표시합니다
        marker.setMap(map);
        </script>
        <div id="under-button">
        	<button type="button" align="center" onclick="toList();">목록으로</button>
        	<c:if test="${!empty loginUser and loginUser.userId eq b.boardWriter}">
        		<button type="button" id="updateBtn" onclick="toUpdate();">수정하기</button>
        	</c:if>
        </div>
        <script>
        	function toList(){
        		location.href="<%= contextPath%>/list.sell";
        	}
        	function toUpdate(){
        		location.href="<%=contextPath%>/update.sell?bno=<%=b.getBoardNo()%>";
        	}
        </script>
    </div>

	<%@ include file="../../common/footer.jsp" %>
</body>
</html>