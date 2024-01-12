<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DaeWoo Hospital</title>
<link rel="stylesheet" href="../resources/css/home/info.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<div id="topleft" style="margin-top: 10px; float: left;">
					<img src="../resources/img/headLogo.png">
				</div>
				<div id="topright" style="margin-top: 10px; float: right;">
					<c:if test="${member == null}">
						<span><a href="/member/login">로그인</a></span>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>

					<c:if test="${member != null }">
						<c:if test="${member.adminCk == 1 }">
							<span><a href="/medical/medicalLogin">의료진 페이지</a></span>
						</c:if>
						<c:if test="${member.adminCk == 2 }">
							<span><a href="/admin/main">관리자 페이지</a></span>
						</c:if>
						<span> <a href="/member/logout.do">로그아웃</a>
						</span>
						<span> <a href="/mypage/mypage">마이페이지</a>
						</span>
					</c:if>
				</div>
			</div>
			<div class="top_area">
				<div class="land_area">
					<img src="../resources/img/main2.png" width="100%" height="100%">
				</div>
				<div class="clearfix"></div>
			</div>
			<nav id="nav1">
            <ul>
               <li>대우 병원 입니다</li>
               <li>|</li>
               <li><a href="/main">인사말</a></li>
               <li>|</li>
               <li><a href="/medical/Doctorpage">의료진 정보</a></li>
               <li>|</li>
               <li><a href="/home/way">오시는길</a></li>
               <li>|</li>

               <li><a href="/home/info">과 소개</a></li>
               <li>|</li>
               <c:if test="${memberReserve == null}">
                  <li><a
                     href="javascript:void(window.open('/member/reserve', '진료 예약','width=800, height=600'))">예약</a></li>
               </c:if>
               <c:if test="${memberReserve != null}">
                  <li><span>**이미 예약하셨습니다**</span></li>
               </c:if>


            </ul>
         </nav>
			<div class="intro_list">
				<div class="intro_box" onclick="location.href='/home/way';">
					<img src="../resources/img/main1.png" alt="">
					<div class="intro_title">오시는 길</div>
					<div class="intro_desc">대우 Hospital로 오시는길을 확인해보세요</div>
				</div>
				<div class="intro_box"
					onclick="location.href='/medical/Doctorpage';">
					<img src="../resources/img/main1.png" alt="">
					<div class="intro_title">의료진 정보</div>
					<div class="intro_desc">대우 병원의 최고의 의료진을 확인해보세요</div>
				</div>
				<div class="intro_box">
				<a href="javascript:void(window.open('/member/reserve', '진료 예약','width=800, height=600'))">
					<img src="../resources/img/main1.png" alt=""></a>
					<div class="intro_title"><a style="color: #1a7ad9"href="javascript:void(window.open('/member/reserve', '진료 예약','width=800, height=600'))">
					예약하기</a></div>
					<div class="intro_desc"><a href="javascript:void(window.open('/member/reserve', '진료 예약','width=800, height=600'))">
					미리 예약하여 대우병원의 진료를 경험해보세요</a></div>
				</div>
				<div class="clearfix"></div>
			</div>
			
			<div class="content_area">
			
				<table>
					<tr>
						<th colspan="2">과 이름</th>
						<th colspan="4">과 정보</th>
					</tr>
					<tr>
						<td colspan="2">정형외과</td>
						<td colspan="4">외과학 계열 진료과목, 손/발/척추를 구성하는 모든 해부학적 구조에 대한 진료를 하는 외과.</td>
					</tr>
					<tr>
						<td colspan="2">내과</td>
						<td colspan="4">신체의 기관에 생긴 병을 외과적 수술에 의존하지 않고 물리 요법이나 약물 등으로 치료하는 의학 분야.</td>
					</tr>
					<tr>
						<td colspan="2">소아과</td>
						<td colspan="4">신생아기로부터 청소년기의 환자를 대상으로 진료 및 연구를 행하는 임상의학</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script>
		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			}); // ajax 
		});
	</script>
</body>
</html>