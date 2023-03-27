<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	
	    * {
            margin: 0;
            padding: 0;
            font-family: "맑은고딕", MalgunGothic, "Malgun Gothic", 'Noto Sans KR', "돋움", Dotum, Arial, sans-serif;
            box-sizing: border-box;
        }

        #sub .sub_in #content {
            position: relative;
            width: 1150px;
            margin: 0 auto;
        }

        .sub_left {
            width: 100%;
            float: left;
        }

        .sub_left .sub_top2 {
            width: 100%;
        }

        .sub_left .sub_top2 .tit {
            height: 45px;
        }

        .sub_left .sub_top2 .tit .sub_tit1 {
            font-size: 1.1rem;
            color: #808080;
            float: left;
            font-weight: 700;
            line-height: 45px;
        }

        .sub_left .sub_contents {
            border-top: 1px solid #777;
            position: relative;
        }

        p,
        div {
            letter-spacing: -0.3px;
        }

        .register02 {
            width: 100%;
            margin-top: 40px;
            border: 1px solid #999;
        }

        table {
            border-collapse: collapse;
        }

        .register02 tr {
            width: 100%;
            font-size: 1;
            border-bottom: 1px solid #999;
        }

        .register02 tr th {
            width: 20%;
            font-size: .85rem;
            line-height: 1.4rem;
            background-color: rgba(41, 128, 185, 0.45);
            text-align: center;
        }

        .register02 tr td {
            width: 80%;
            font-size: .85rem;
            line-height: 1.4rem;
            padding: 20px;
        }

        td {
            vertical-align: middle;
        }

        input[type=button] {
            border: 1px solid #999;
            display: inline-block;
            background-color: #ddd;
            text-align: center;
            font-size: .75rem;
            line-height: 20px;
            height: 20px;
            padding: 0 5px;
            margin-left: 10px;
            vertical-align: top;
            cursor: pointer;
        }

        a:link {
            text-decoration: none;
            color: #111;
        }

        .register02 tr td span {
            margin-left: 30px;
            font-size: .75rem;
            display: inline-block;
        }

        input {
            vertical-align: top;
        }

        .register02 tr td p {
            display: inline-block;
            margin-left: 5px;
            font-size: .75rem;
            line-height: 20px;
            vertical-align: top;
        }

        .register02_btn {
            width: 100%;
            text-align: center;
            display: inline-block;
            margin-top: 30px;
        }

        .register02_btn button {
            display: inline-block;
            width: 100px;
            height: 35px;
            line-height: 30px;
            background-color: rgba(41, 128, 185, 0.46);
            text-align: center;
            font-size: .8rem;
            border-radius: 10px;
            border: none;
            font-weight: 600;
            color: #fff;
            cursor: pointer;
        }

        .register02 tr td span {
            margin-left: 30px;
            font-size: .75rem;
            display: inline-block;
        }

        input:focus {
            outline: none;
        }
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<article id="sub">
            <div class="sub_in">

                <section id="content" class="cb" style=" margin-top:15px;">

                    <div class="sub_left " style="max-width:100% !important">
                        <div class="sub_top2"><!--서브타이틀, 공지사항, 탭-->
                            <div class="tit">
                                <h2 class="sub_tit1">회원가입</h2>
                            </div><!--tit-->

                        </div><!--sub_top-->


                        <form id="enroll-form" action="<%=contextPath %>/insert.me" method="post">

                            <div class="sub_contents cb" style="margin:10;">
                                <div class="wrap cb">

                                    <table class="register02">
                                        <colgroup></colgroup>
                                        <tbody>
                                            <tr>
                                                <th>아이디</th>
                                                <td>
                                                    <input type="text" id="register_id" class="register_id">
                                                    <input type="button" id="address_btn" value="중복확인" onclick="idCheck();">
                                                    <span>※ 아이디는 4~12자, 영문 대소문자, 숫자만 가능합니다.</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>닉네임</th>
                                                <td>
                                                    <input type="text" id="register_nick" class="register_nick"
                                                        autocomplete="off">
                                                    <input type="button" id="address_btn" value="중복확인">
                                                    <span>
                                                        ※ 닉네임은 2~10자 이내로 입력해 주셔야 합니다. (특수문자 불가)<br>
                                                        ※ 닉네임은 변경이 불가하니 신중하게 입력해 주시기 바랍니다.<br>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호</th>
                                                <td>
                                                    <input type="password" id="register_pw" class="register_pw">
                                                    <span>※ 비밀번호는 8~20자 영문 대소문자, 숫자, 특수문자 혼합해서 사용해야 됩니다.</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호 확인</th>
                                                <td>
                                                    <input type="password" id="pw_check" class="pw_check" onchange="pwdCheck()">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>이메일 중복확인 및<br>인증번호 발송</th>
                                                <td>
                                                    <input type="text" id="email_check" class="email_check" size="15">
                                                    <p>@naver.com</p>
                                                    <input type="button" id="address_btn" value="인증번호 발송">
                                                    <span>
                                                        ※ Naver 계정으로만 가입 가능합니다.<br>
                                                        ※ 메일 주소는 변경이 불가하며, 아이디/비번찾기 등에 사용됩니다.<br>
                                                        ※ 최대 5분 정도 소요됩니다. 메일이 오지 않을 경우 스팸메일함을 확인부탁드립니다
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>이메일 인증 키</th>
                                                <td>
                                                    <input type="text" id="email_key" class="email_key">
                                                    <input type="button" id="address_btn" value="확인">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>핸드폰</th>
                                                <td>
                                                    <input type="text" id="phone" class="phone">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>주소</th>
                                                <td>
                                                    <input type="text" id="sample6_postcode" size="10"
                                                        style="text-align: center;">
                                                    <input type="button" onclick="sample6_execDaumPostcode()"
                                                        value="우편번호 찾기"><br>
                                                    <input type="text" id="sample6_address" size="40">
                                                    <input type="text" id="sample6_extraAddress" size="20"><br>
                                                    <input type="text" id="sample6_detailAddress" size="40">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>반려동물</th>
                                                <td>
                                                    <select name="animal">

                                                        <option value="dog" selected> 강아지

                                                        <option value="cat"> 고양이

                                                        <option value="bird"> 조류

                                                        <option value="reptile"> 파충류

                                                        <option value="amphibia"> 양서류

                                                        <option value="pisces"> 어류
                                                    </select>
                                                    <br>
                                                    <select name="animal_gender">

                                                        <option value="am" selected> 남

                                                        <option value="af"> 여
                                                    </select>
                                                    <br>
                                                    <input type="text" id="animal_name" class="animal_name"><span>※ 이름음
                                                        입력해 주시기 바랍니다.</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>취미</th>
                                                <td>
                                                    <input type="text" name="hobby" class="hobby">
                                                    <span>※ 없을시 공백으로 남겨 주시기 바랍니다.</span>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>

                                    <div class="register02_btn">
                                        <button type="submit" onclick="return checks();" disabled>회원가입</button>
                                        <button type="button" onclick="hrefLink();"
                                            style="margin-left:20px; background-color:#bbb">취소</button>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>

                </section>

            </div>
        </article>
	<script>
		function idCheck(){
			const $userId = $("#enroll-form [name=userId]");
			
			$.ajax({
				url : "<%= contextPath %>/idCheck.me",
				data :{ userId : $userId.val() },
				success : function(result){
					if(result == 'NNNNN'){
						alert("이미 존재하거나 회원탈퇴한 아이디입니다");
						$userId.focus();
					}else{
						if(confirm("사용가능한 아이디 입니다. 사용 하시겠습니까?")){
							$userId.attr("readonly",true);
							$("#enroll-form :submit").removeAttr("disabled");			
						}else{
							$userId.val("");
							$userId.focus();
						}
					}
				},
				error : function(){
					console.log("아이디 중복체크 실패");
				}
			});
			
			
		}
		
	</script>
	
	 <script type="text/javascript">

            link = "<%=contextPath%>";

            function hrefLink() {
                location.href = link;
            }

        </script>

        <script>
            function sample6_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function (data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if (data.userSelectedType === 'R') {
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== '' && data.apartment === 'Y') {
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraAddr !== '') {
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("sample6_extraAddress").value = extraAddr;

                        } else {
                            document.getElementById("sample6_extraAddress").value = '';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample6_postcode').value = data.zonecode;
                        document.getElementById("sample6_address").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("sample6_detailAddress").focus();
                    }
                }).open();
            }
        </script>

        <script>
            function checks() {
                var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{4,12}$/); // 아이디
                var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/); // 닉네임
                var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
                var animalnameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/); // 반려동물이름
                var emailCheck = RegExp(/^[A-Za-z0-9_\-]{4,12}$/); // 이메일
                var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/); // 폰번호

                // 아이디 공백 확인
                if ($("#register_id").val() == "") {
                    alert("아이디를 입력해주세요.");
                    $("#register_id").focus();
                    return false;
                }

                // 아이디 유효성검사
                if (!userIdCheck.test($("#register_id").val())) {
                    alert("아이디는 4~12자, 영문 대소문자, 숫자만 가능합니다.");
                    $("#register_id").val("");
                    $("#register_id").focus();
                    return false;
                }

                // 닉네임 공백 검사
                if ($("#register_nick").val() == "") {
                    alert("닉네임을 입력해주세요.");
                    $("#register_nick").focus();
                    return false;
                }

                // 닉네임 유효성 검사
                if (!nickNameCheck.test($("#register_nick").val())) {
                    alert("닉네임은 2~8자 이내로 입력해 주셔야 합니다. (특수문자 불가)")
                    $("#register_nick").val("");
                    $("#register_nick").focus();
                    return false;
                }

                // 비밀번호 공백 확인
                if ($("#register_pw").val() == "") {
                    alert("비밀번호를 입력해주세요.");
                    $("#register_pw").focus();
                    return false;
                }

                // 비밀번호 유효성검사
                if (!passwdCheck.test($("#register_pw").val())) {
                    alert("비밀번호는 8~20자 영문 대소문자, 숫자, 특수문자 혼합해서 사용해야 됩니다.");
                    $("#register_pw").val("");
                    $("#register_pw").focus();
                    return false;
                }

                // 비밀번호 확인란 공백 확인
                if ($("#pw_check").val() == "") {
                    alert("비밀번호를 다시 입력해주세요.");
                    $("#pw_check").focus();
                    return false;
                }

                // 비밀번호 확인
                if ($("#register_pw").val() != $("#pw_check").val()) {
                    alert("비밀번호가 다릅니다. 다시 입력해주세요.");
                    $("#register_pw").val("");
                    $("#pw_check").val("");
                    $("#register_pw").focus();
                    return false;
                }

                // 이메일 공백 확인
                if ($("#email_check").val() == "") {
                    alert("이메일을 입력해주세요.");
                    $("#email_check").focus();
                    return false;
                }

                // 이메일 키 공백 확인
                if ($("#email_key").val() == "") {
                    alert("이메일을 입력해주세요.");
                    $("#email_key").focus();
                    return false;
                }

                // 이메일 유효성 검사
                if (!emailCheck.test($("#email_check").val())) {
                    alert("이메일 형식에 맞게 입력해주세요.")
                    $("#email_check").val("");
                    $("#email_check").focus();
                    return false;
                }

                // 폰번호 공백 확인
                if ($("#phone").val() == "") {
                    alert("핸드폰 번호를 입력해주세요.");
                    $("#phone").focus();
                    return false;
                }

                // 폰번호 유효성 검사
                if (!phonNumberCheck.test($("#phone").val())) {
                    alert("핸드폰 번호를 형식에 맞게 입력해주세요.")
                    $("#phone").val("");
                    $("#phone").focus();
                    return false;
                }

                // 주소 공백 확인
                if ($("#phone").val() == "") {
                    alert("핸드폰 번호를 입력해주세요.");
                    $("#phone").focus();
                    return false;
                }

                // 반려동물이름 공백 확인
                if ($("#animal_name").val() == "") {
                    alert("반려동물 이름을 입력해주세요.");
                    $("#animal_name").focus();
                    return false;
                }

            }
        </script>
	
</body>
</html>