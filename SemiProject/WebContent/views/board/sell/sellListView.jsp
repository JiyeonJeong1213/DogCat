<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	div {
        box-sizing: border-box;
        /* border: 1px solid lightgray; */
    }
    #contents {
        width: 1200px;
        height: auto;
        margin: auto;
        margin-top: 50px;
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
    
    #board-list {
        border: 0.3px solid lightgray;
        text-align: center;
        margin-bottom: 30px;
    }
    .search2 {
        display: none;
    }
    button:focus {
        border: none;
        outline: none;
    }
    #search-btn{
        border-radius: 7px;
        border: 0;
        padding: 3px 10px;
        background-color: rgb(0, 123, 255);
        color: white;
    }
    #search-area {
        display: flex;
        justify-content: center;
        position: relative;
        margin-bottom: 30px;
    }
    #search-area>button {
        border-radius: 7px;
        border: 0;
        padding: 3px 10px;
        background-color: rgb(230, 242, 255);
        color: rgb(0, 123, 255);
        position: absolute;
        right: 0;
    }
    #search-area select:focus {
        outline: none;
    }
    #search-area input:focus {
        outline: none;
    }
    .paging-area {
        text-align: center;
    }
    .paging-area button {
        border: 0;
        border-radius: 7px;
    }
    .paging-area button:focus {
        background-color: #FFD133;
    }
</style>
</head>
<body>
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

        <table id="board-list" border="1">
            <tr>
                <th width="200"></th>
                <th width="650">제목</th>
                <th width="200">작성자</th>
                <th width="100">조회수</th>
                <th width="100">찜</th>
            </tr>
            <tr>
                <td></td>
                <td>안녕하세요. 관리자입니다.</td>
                <td>관리자</td>
                <td>30</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>안녕하세요. 관리자입니다.</td>
                <td>관리자</td>
                <td>30</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>안녕하세요. 관리자입니다.</td>
                <td>관리자</td>
                <td>30</td>
                <td></td>
            </tr>
            <tr>
                <td><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/%EA%B8%B0%EB%B3%B8%EC%9D%B4%EB%AF%B8%EC%A7%80.png" width="100px"></td>
                <td>가격 내림, 새상품) 강아지 옷</td>
                <td>정지연</td>
                <td>13</td>
                <td>2</td>
            </tr>
            <tr>
                <td><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/%EA%B8%B0%EB%B3%B8%EC%9D%B4%EB%AF%B8%EC%A7%80.png" width="100px"></td>
                <td>가격 내림, 새상품) 강아지 옷</td>
                <td>정지연</td>
                <td>13</td>
                <td>2</td>
            </tr>
            <tr>
                <td><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/%EA%B8%B0%EB%B3%B8%EC%9D%B4%EB%AF%B8%EC%A7%80.png" width="100px"></td>
                <td>가격 내림, 새상품) 강아지 옷</td>
                <td>정지연</td>
                <td>13</td>
                <td>2</td>
            </tr>
            <tr>
                <td><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/%EA%B8%B0%EB%B3%B8%EC%9D%B4%EB%AF%B8%EC%A7%80.png" width="100px"></td>
                <td>가격 내림, 새상품) 강아지 옷</td>
                <td>정지연</td>
                <td>13</td>
                <td>2</td>
            </tr>
            <tr>
                <td><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%A0%95%EC%A7%80%EC%97%B0/%EA%B8%B0%EB%B3%B8%EC%9D%B4%EB%AF%B8%EC%A7%80.png" width="100px"></td>
                <td>가격 내림, 새상품) 강아지 옷</td>
                <td>정지연</td>
                <td>13</td>
                <td>2</td>
            </tr>
        </table>
        <div id="search-area">
            <form action="" method="get">
                <select name="search1" class="search1">
                    <option value="" selected disabled hidden>광역시/도</option>
                    <option>서울특별시</option>
                    <option>인천광역시</option>
                    <option>대전광역시</option>
                    <option>광주광역시</option>
                    <option>대구광역시</option>
                    <option>부산광역시</option>
                    <option>울산광역시</option>
                    <option>세종특별자치시</option>
                    <option>제주특별자치도</option>
                    <option>강원도</option>
                    <option>경기도</option>
                    <option>경상남도</option>
                    <option>경상북도</option>
                    <option>전라남도</option>
                    <option>전라북도</option>
                    <option>충청남도</option>
                    <option>충청북도</option>
                </select>
                <select id="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>강남구</option>
                    <option>강동구</option>
                    <option>강북구</option>
                    <option>강서구</option>
                    <option>관악구</option>
                    <option>광진구</option>
                    <option>구로구</option>
                    <option>금천구</option>
                    <option>노원구</option>
                    <option>도봉구</option>
                    <option>동대문구</option>
                    <option>동작구</option>
                    <option>마포구</option>
                    <option>서대문구</option>
                    <option>서초구</option>
                    <option>성동구</option>
                    <option>성북구</option>
                    <option>송파구</option>
                    <option>양천구</option>
                    <option>영등포구</option>
                    <option>용산구</option>
                    <option>은평구</option>
                    <option>종로구</option>
                    <option>중구</option>
                    <option>중랑구</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>강화군</option>
                    <option>계양구</option>
                    <option>남동구</option>
                    <option>동구</option>
                    <option>미추홀구</option>
                    <option>부평구</option>
                    <option>서구구</option>
                    <option>연수구</option>
                    <option>옹진군</option>
                    <option>중구</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>대덕구</option>
                    <option>동구</option>
                    <option>서구</option>
                    <option>유성구</option>
                    <option>중구</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>광산구</option>
                    <option>남구</option>
                    <option>동구</option>
                    <option>북구</option>
                    <option>서구</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>남구</option>
                    <option>달서구</option>
                    <option>달성군</option>
                    <option>동구</option>
                    <option>북구</option>
                    <option>서구</option>
                    <option>수성구</option>
                    <option>중구</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>강서구</option>
                    <option>금정구</option>
                    <option>기장군</option>
                    <option>남구</option>
                    <option>동구</option>
                    <option>동래구</option>
                    <option>부산진구</option>
                    <option>북구</option>
                    <option>사상구</option>
                    <option>사하구</option>
                    <option>서구</option>
                    <option>수영구</option>
                    <option>연제구</option>
                    <option>영도구</option>
                    <option>중구</option>
                    <option>해운대구</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>남구</option>
                    <option>동구</option>
                    <option>북구</option>
                    <option>울주군</option>
                    <option>중구</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>세종특별자치시</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>서귀포시</option>
                    <option>제주시</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>강릉시</option>
                    <option>고성군</option>
                    <option>동해시</option>
                    <option>삼척시</option>
                    <option>속초시</option>
                    <option>양구군</option>
                    <option>양양군</option>
                    <option>영월군</option>
                    <option>원주시</option>
                    <option>인제군</option>
                    <option>정선군</option>
                    <option>철원군</option>
                    <option>춘천시</option>
                    <option>태백시</option>
                    <option>평창군</option>
                    <option>홍천군</option>
                    <option>화천군</option>
                    <option>횡성군</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>가평군</option>
                    <option>고양시 덕양구</option>
                    <option>고양시 일산동구</option>
                    <option>고양시 일산서구</option>
                    <option>과천시</option>
                    <option>광명시</option>
                    <option>광주시</option>
                    <option>구리시</option>
                    <option>군포시</option>
                    <option>남양주시</option>
                    <option>동두천시</option>
                    <option>부천시</option>
                    <option>성남시</option>
                    <option>성남시 분당구</option>
                    <option>성남시 수정구</option>
                    <option>성남시 중원구</option>
                    <option>수원시</option>
                    <option>수원시 권선구</option>
                    <option>수원시 영통구</option>
                    <option>수원시 장안구</option>
                    <option>수원시 팔달구</option>
                    <option>시흥시</option>
                    <option>안산시</option>
                    <option>안산시 상록구</option>
                    <option>안성시</option>
                    <option>안양시</option>
                    <option>안양시 동안구</option>
                    <option>안양시 만안구</option>
                    <option>양주시</option>
                    <option>양평군</option>
                    <option>여주시</option>
                    <option>연천군</option>
                    <option>오산시</option>
                    <option>용인시</option>
                    <option>용인시 기흥구</option>
                    <option>용인시 수지구</option>
                    <option>용인시 처인구</option>
                    <option>의왕시</option>
                    <option>의정부시</option>
                    <option>이천시</option>
                    <option>파주시</option>
                    <option>평택시</option>
                    <option>포천시</option>
                    <option>하남시</option>
                    <option>화성시</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>거제시</option>
                    <option>거창군</option>
                    <option>고성시</option>
                    <option>김해시</option>
                    <option>남해군</option>
                    <option>밀양시</option>
                    <option>사천시</option>
                    <option>산청군</option>
                    <option>양산시</option>
                    <option>의령군</option>
                    <option>진주시</option>
                    <option>창령군</option>
                    <option>창원시</option>
                    <option>통영시</option>
                    <option>하동군</option>
                    <option>함안군</option>
                    <option>함양군</option>
                    <option>합천군</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>경산시</option>
                    <option>경주시</option>
                    <option>고령군</option>
                    <option>구미시</option>
                    <option>군위군</option>
                    <option>김천시</option>
                    <option>문경시</option>
                    <option>봉화군</option>
                    <option>상주시</option>
                    <option>성주군</option>
                    <option>안동시</option>
                    <option>영덕군</option>
                    <option>영양군</option>
                    <option>영주시</option>
                    <option>영천시</option>
                    <option>예천군</option>
                    <option>울릉군</option>
                    <option>울진군</option>
                    <option>의성군</option>
                    <option>청도군</option>
                    <option>청송군</option>
                    <option>칠곡군</option>
                    <option>포항시</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>강진군</option>
                    <option>고흥군</option>
                    <option>곡성군</option>
                    <option>광양시</option>
                    <option>구례군</option>
                    <option>나주시</option>
                    <option>담양군</option>
                    <option>목포시</option>
                    <option>무안군</option>
                    <option>보성군</option>
                    <option>순천시</option>
                    <option>신안군</option>
                    <option>여수시</option>
                    <option>영광군</option>
                    <option>영암군</option>
                    <option>완도군</option>
                    <option>장성군</option>
                    <option>장흥군</option>
                    <option>진도군</option>
                    <option>함평군</option>
                    <option>해남군</option>
                    <option>화순군</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>고창군</option>
                    <option>군산시</option>
                    <option>김제시</option>
                    <option>남원시</option>
                    <option>무주군</option>
                    <option>부안군</option>
                    <option>순창군</option>
                    <option>완주군</option>
                    <option>익산시</option>
                    <option>임실군</option>
                    <option>장수군</option>
                    <option>전주시</option>
                    <option>정읍시</option>
                    <option>진안군</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>계룡시</option>
                    <option>공주시</option>
                    <option>금산군</option>
                    <option>논산시</option>
                    <option>당진시</option>
                    <option>보령시</option>
                    <option>부여군</option>
                    <option>서산시</option>
                    <option>서천군</option>
                    <option>아산시</option>
                    <option>연기군</option>
                    <option>예산군</option>
                    <option>천안시</option>
                    <option>청양군</option>
                    <option>태안군</option>
                    <option>홍성군</option>
                </select>
                <select name="search2" class="search2">
                    <option value="" selected disabled hidden>시/구/군</option>
                    <option>괴산군</option>
                    <option>단양군</option>
                    <option>보은군</option>
                    <option>영동군</option>
                    <option>옥천군</option>
                    <option>음성군</option>
                    <option>제천시</option>
                    <option>증평군</option>
                    <option>진천군</option>
                    <option>청원군</option>
                    <option>청주시</option>
                    <option>충주시</option>
                </select>
                <input type="text" name="search3" size="30" placeholder="제목/내용 검색">
                <button type="submit" id="search-btn">검색</button>
            </form>
            <button type="button" id="write">글쓰기</button>
            <script>
                $(function(){
                    $(".search1").change(function(){
                        // 강사님 코드
                        // let selectedValue = $(this).val();
                        // $(".search1 option").each(function(index, ele){
                        //     if($(ele).val() == selectedValue){
                        //         $(".search2").css("display", "none");
                        //         $(".search2").eq(index-1).css("display", "inline");
                        //     }
                        // });
                        
                        // 내 코드
                        for(let i= 1; i <= 17; i++){
                            if($(".search1 option:selected").val() == $(".search1 option").eq(i).val()){
                            	$("#search2").css("display", "none");
                                $(".search2").css("display", "none");
                                $(".search2").eq(i-1).css("display", "inline");
                            }
                        }
                    });
                    
                    $("#write").click(function(){
                    	location.href= "<%= request.getContextPath() %>/insertBoard.sell";
                    });
                });
            </script>
        </div>
        <div class="paging-area">
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>6</button>
            <button>7</button>
            <button>8</button>
            <button>9</button>
            <button>10</button> 
        </div>
    </div>
</body>
</html>