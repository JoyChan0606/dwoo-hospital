<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<form id="join_form" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="memberId">
					</div>
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
						class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
						class="final_id_ck">아이디를 입력해주세요.</span>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" name="memberPw">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input">
					</div>
					<span class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
						class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span> <span
						class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="memberName">
					</div>
					<span class="final_name_ck">이름을 입력해주세요.</span>
				</div>
				<div class="idnum_wrap">
					<div class="idnum_name">주민 등록 번호</div>
					<div class="idnum_input_box">
						<input class="idnum_input" name="memberIDNum" maxlength="14">
					</div>
					<span class="idnum_input_re_1">사용 가능한 주민번호입니다.</span> <span
						class="idnum_input_re_2">주민번호가 이미 존재합니다.</span> <span
						class="final_idnum_ck">주민번호를 입력해주세요.</span>
				</div>
				<div class="phone_wrap">
					<div class="phone_name">전화 번호</div>
					<div class="phone_input_box">
						<input class="phone_input" name="memberPhone" maxlength="13">
					</div>
					<span class="phone_input_re_1">사용 가능한 전화 번호입니다.</span> <span
						class="phone_input_re_2">전화 번호가 이미 존재합니다.</span> <span
						class="final_phone_ck">전화번호를 입력해주세요.</span>
				</div>
				<div class="mail_wrap">
					<div class="mail_name">이메일</div>
					<div class="mail_input_box">
						<input class="mail_input" name="memberEmail">
					</div>
					<span class="final_mail_ck">이메일을 입력해주세요.</span> <span
						class="mail_input_box_warn"></span>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled">
						</div>
						<div class="mail_check_button">
							<span>인증번호 전송</span>
						</div>
						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
					</div>
				</div>
				<div class="gender_wrap">
					<div class="gender_name">성별</div>
					<div class="gender_input_box">
						<fieldset>
							<label> <input type="radio" id="gender_input"
								name="gender" value="1" checked="checked" /> <span>남자</span>
							</label> <label> <input type="radio" id="gender_input"
								name="gender" value="0" /> <span>여자</span>
							</label>
						</fieldset>
					</div>
				</div>
				<div class="join_button_wrap">
					<input type="button" class="join_button" value="가입하기">
				</div>
			</div>
		</form>
	</div>
	<script>
	var code = "";                // 이메일 전송 인증번호 저장위한 코드
	/* 유효성 검사 통과유무 변수 */
	var idCheck = false;            // 아이디
	var idckCheck = false;          // 아이디 중복 검사
	var pwCheck = false;            // 비밀번호
	var pwckCheck = false;          // 비밀번호 확인
	var pwckcorCheck = false;       // 비밀번호 확인 일치 확인
	var nameCheck = false;          // 이름
	var mailCheck = false;          // 이메일
	var mailnumCheck = false;       // 이메일 인증번호 확인
	var idnumCheck = false;         // 주민번호
	var idnumckCheck = false;       // 주민번호 중복 검사
	var phoneCheck = false;         // 전화번호
	var phoneckCheck = false;       // 전화번호 중복 검사
	
	$(document).ready(function(){
		
		$(".join_button").click(function () {
		    /* 입력값 변수 */
		    var id = $('.id_input').val();          // id 입력란
		    var pw = $('.pw_input').val();          // 비밀번호 입력란
		    var pwck = $('.pwck_input').val();      // 비밀번호 확인 입력란
		    var name = $('.user_input').val();      // 이름 입력란
		    var mail = $('.mail_input').val();      // 이메일 입력란
		    var phone = $('.phone_input').val();    // 전화번호 입력란
		    var idnum = $('.idnum_input').val();    // 주민번호 입력란

	        
	        //$("#join_form").attr("action", "/member/join");
	        //$("#join_form").submit();
	        /* 아이디 유효성검사 */
	        if(id == ""){
	            $('.final_id_ck').css('display','block');
	            idCheck = false;
	        }else{
	            $('.final_id_ck').css('display', 'none');
	            idCheck = true;
	        }
	        /* 비밀번호 유효성 검사 */
	        if(pw == ""){
	            $('.final_pw_ck').css('display','block');
	            pwCheck = false;
	        }else{
	            $('.final_pw_ck').css('display', 'none');
	            pwCheck = true;
	        }
	        /* 비밀번호 확인 유효성 검사 */
	        if(pwck == ""){
	            $('.final_pwck_ck').css('display','block');
	            pwckCheck = false;
	        }else{
	            $('.final_pwck_ck').css('display', 'none');
	            pwckCheck = true;
	        }
	        /* 이름 유효성 검사 */
	        if(name == ""){
	            $('.final_name_ck').css('display','block');
	            nameCheck = false;
	        }else{
	            $('.final_name_ck').css('display', 'none');
	            nameCheck = true;
	        }
	        /* 이메일 유효성 검사 */
	        if(mail == ""){
	            $('.final_mail_ck').css('display','block');
	            mailCheck = false;
	        }else{
	            $('.final_mail_ck').css('display', 'none');
	            mailCheck = true;
	        }
	        /* 전화번호 유효성 검사 */
	        if(phone == ""){
	            $('.final_phone_ck').css('display','block');
	            phoneCheck = false;
	        }else{
	            $('.final_phone_ck').css('display', 'none');
	            phoneCheck = true;
	        }
	        /* 주민번호 유효성 검사 */
	        if(idnum == ""){
	            $('.final_idnum_ck').css('display','block');
	            idnumCheck = false;
	        }else{
	            $('.final_idnum_ck').css('display', 'none');
	            idnumCheck = true;
	        }
	        /* 최종 유효성 검사 */
	        if (idCheck && idckCheck && pwCheck && pwckCheck && pwckcorCheck && nameCheck
	            && mailCheck && mailnumCheck && idnumCheck && phoneCheck) {
	            $("#join_form").attr("action", "/member/join");
	            $("#join_form").submit();
	        }
	        return false;
	        
	    });
	});
	
	//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function(){

		var memberId = $('.id_input').val();			// .id_input에 입력되는 값
		var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				// console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");		
					// 아이디 중복이 없는 경우
					idckCheck = true;
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");
					// 아이디 중복이 있는 경우
					idckCheck = false;
				}
			}// success 종료
		}); // ajax 종료	
	});// function 종료
	/* 비밀번호 확인 일치 유효성 검사 */
	 
	$('.pwck_input').on("propertychange change keyup paste input", function(){
	 
	    var pw = $('.pw_input').val();
	    var pwck = $('.pwck_input').val();
	    $('.final_pwck_ck').css('display', 'none');
	 
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    }        
	});    
	//폰번호 중복검사
	$('.phone_input').on("propertychange change keyup paste input", function(){
		autoHyphen(this);
		var memberPhone = $('.phone_input').val();			// .phone_input에 입력되는 값
		var data = {memberPhone : memberPhone}				// '컨트롤에 넘길 데이터 이름' : '데이터(.phone_input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/memberPhoneChk",
			data : data,
			success : function(result){
				// console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.phone_input_re_1').css("display","inline-block");
					$('.phone_input_re_2').css("display", "none");
					var phoneckCheck = true; 
				} else {
					$('.phone_input_re_2').css("display","inline-block");
					$('.phone_input_re_1').css("display", "none");
					var phoneckCheck = false; 
				}
			}// success 종료
		}); // ajax 종료	
	});// function 종료
	
	//주민번호 중복검사
	$('.idnum_input').on("propertychange change keyup paste input", function(){
		autoHyphen2(this);
		var memberIDNum = $('.idnum_input').val();			// .idnum_input에 입력되는 값
		var data = {memberIDNum : memberIDNum}				// '컨트롤에 넘길 데이터 이름' : '데이터(.idnum_input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/memberIDNumChk",
			data : data,
			success : function(result){
				// console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.idnum_input_re_1').css("display","inline-block");
					$('.idnum_input_re_2').css("display", "none");
					var idnumckCheck = true; 
				} else {
					$('.idnum_input_re_2').css("display","inline-block");
					$('.idnum_input_re_1').css("display", "none");	
					var idnumckCheck = false; 
				}
			}// success 종료
		}); // ajax 종료
	});// function 종료
	/* 입력 이메일 형식 유효성 검사 */
	 function mailFormCheck(email){
	    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    return form.test(email);
	}
	const autoHyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		};
	const autoHyphen2 = (target) => {
		target.value = target.value
		.replace(/[^0-9]/g, '')
		.replace(/^(\d{6})(\d{7})$/, `$1-$2`);
		};
			
		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function(){
		    
		    var email = $(".mail_input").val();            // 입력한 이메일
		    var cehckBox = $(".mail_check_input");        // 인증번호 입력란
		    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
		    var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
		    /* 이메일 형식 유효성 검사 */
		    if(mailFormCheck(email)){
		        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
		        warnMsg.css("display", "inline-block");
		    } else {
		        warnMsg.html("올바르지 못한 이메일 형식입니다.");
		        warnMsg.css("display", "inline-block");
		        return false;
		    }    
		    $.ajax({
		        
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
		            
		            //console.log("data : " + data);
		            cehckBox.attr("disabled",false);
		            boxWrap.attr("id", "mail_check_input_box_true");
		            code = data;
		            
		        }
		                
		    });
		    
		});
		/* 인증번호 비교 */
		$(".mail_check_input").blur(function(){
		    
		    var inputCode = $(".mail_check_input").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
		    
		    if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");  
		        mailnumCheck = true;     // 일치할 경우
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		        mailnumCheck = false;     // 불일치할 경우
		    }    
		    
		});
	</script>
</body>
</html>