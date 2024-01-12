<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/member/reserve.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>진료 예약 페이지</title>
</head>
<body>
	<div class="wrapper">
		<form id="reserve_form" method="post" action="/member/reserve">
			<div class="wrap">
				<div class="subjecet">
					<span>진료 예약</span>
				</div>
				<div class="caution_wrap">
					<div class="caution_fieldset">
						<fieldset id="caution">
							<legend>*주의 사항*</legend>
							<list>
							<li>당일 예약시간 20분 전에 내원하여 원무팀 수납/창구 방문 접수 후 진료 받으시기 바랍니다</li>
							<li>예약 변경/취소는 진료 1일전까지 꼭 연락 주시기 바랍니다.</li>
							</list>
						</fieldset>
					</div>
				</div>
				<div class="user_wrap">
					<input type="hidden" name="memberNum"
						value="${reserveDetail.memberNum}">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="memberName" readonly="readonly"
							value="${reserveDetail.memberName}">
					</div>
				</div>
				<div class="idnum_wrap">
					<div class="idnum_name">주민 등록 번호</div>
					<div class="idnum_input_box">
						<input class="idnum_input" name="memberIDNum" maxlength="14"
							value="${reserveDetail.memberIDNum}" readonly="readonly">
					</div>
				</div>
				<div class="phone_wrap">
					<div class="phone_name">전화 번호</div>
					<div class="phone_input_box">
						<input class="phone_input" name="memberPhone" readonly="readonly"
							value="${reserveDetail.memberPhone}">
					</div>
				</div>
				<div class="subject_wrap">
					<div class="subject_name">진료 과</div>
					<div class="subject_input_box">
						<select class="subject_input" name="subject">
							<option value="정형외과">정형외과</option>
						</select>
					</div>
				</div>
				<div class="checkDate_wrap">
					<div class="checkDate_name">진료 희망일</div>
					<input name="checkDate" autocomplete="off" readonly="readonly">
				</div>
				<div class="checkTime_wrap">
					<div class="checkTime_name">진료 희망시간</div>
					<div class="checkTime_input_box">
						<select class="checkTime_input" name="checkTime">
							<option value="09:00">9:00 AM</option>
							<option value="10:00">10:00 AM</option>
							<option value="11:00">11:00 AM</option>
							<option value="12:00">12:00 AM</option>
							<option value="13:00">1:00 PM</option>
							<option value="12:00">2:00 PM</option>
							<option value="15:00">3:00 PM</option>
							<option value="16:00">4:00 PM</option>
							<option value="17:00">5:00 PM</option>
						</select>
					</div>
				</div>
				<div class="reserve_button_wrap">
					<input type="submit" class="reserve_button" value="예약하기">
				</div>
			</div>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			//예약 버튼(예약 기능 작동)
			$(".reserve_button").click(function(e) {
				// 폼 서브밋을 막음
				e.preventDefault();

				// AJAX를 사용한 비동기 서브밋
				$.ajax({
					type : "POST",
					url : $("#reserve_form").attr("action"),
					data : $("#reserve_form").serialize(),
					success : function(data) {
						// 서브밋이 성공하면 창을 닫음
						window.close();
					},
					error : function(error) {
						// 에러 처리
						console.error("서브밋 오류:", error);
					}
				});
			});
		});

		/* 캘린더 위젯 적용 */

		/* 설정 */
		const config = {
			dateFormat : 'yy-mm-dd',
			showOn : "button",
			buttonText : "날짜 선택",
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			yearSuffix : '년',
			changeMonth : true,
			changeYear : true
		}

		/* 캘린더 */
		$(function() {
			$("input[name='checkDate']").datepicker(config);
		});
	</script>
</body>
</html>