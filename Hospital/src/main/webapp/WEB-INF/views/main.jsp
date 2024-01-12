<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DaeWoo Hospital</title>
<link rel="stylesheet" href="resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<div id="topleft" style="margin-top: 10px; float: left;">
					<img src="resources/img/headLogo.png">
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
						<c:if test="${member.adminCk == 0 }">
						<span> <a href="/mypage/mypage">마이페이지</a>
						</span>
						</c:if>
					</c:if>
				</div>
			</div>
			<div class="top_area">
				<div class="land_area">
					<img src="resources/img/main2.png" width="100%" height="100%">
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

               <li><a href="home/info">과 정보</a></li>
               <li>|</li>
               <c:if test="${memberReserve == null}">
                  <li><a
                     href="javascript:void(window.open('member/reserve', '진료 예약','width=800, height=600'))">예약</a></li>
               </c:if>
               <c:if test="${memberReserve != null}">
                  <li><span>**이미 예약하셨습니다**</span></li>
               </c:if>


            </ul>
         </nav>
			<div class="intro_list">
				<div class="intro_box" onclick="location.href='/home/way';">
					<img src="resources/img/main1.png" alt="">
					<div class="intro_title">오시는 길</div>
					<div class="intro_desc">대우 Hospital로 오시는길을 확인해보세요</div>
				</div>
				<div class="intro_box"
					onclick="location.href='/medical/Doctorpage';">
					<img src="resources/img/main1.png" alt="">
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
				<br>
				<h2>
					안녕하십니까? <br>대우병원 홈페이지를 <br>방문해주셔서 감사드립니다.
				</h2>
				<br>
				<h3>
					대우 병원은 진료시스템을 개선하고, 쾌적한 시설 환경을 마련하는 등 <br>국민 여러분께서 최상의 의료서비스를
					받으실 수 있도록<br> 끝임없는 고민과 노력을 기울여 나가겠습니다.
				</h3>
				<br><Br>
			<video autoplay controls loop width="1100px" height="608px">
               <source src="resources/img/Hos.mp4" type="video/mp4" />

            </video>
            <div class="clearfix"></div>
        <div class="footer">
            <div class="footer_container">
                
                <div class="footer_left">
                    <img src="../resources/img/main1.png">
                </div>
                <div class="footer_right">
                    (주) DaeWooHospital    대표이사 : 노황민
                    <br>
                    사업자등록번호 : ooo-oo-ooooo
                    <br>
                    대표전화 : 010-oooo-oooo(발신자 부담전화)
                    <br>
                    <br>
                    <strong>https://github.com/nokyumhak/hospital</strong> 
                </div>
                <div class="clearfix"></div>
            </div>
        </div> <!-- class="footer" -->        
			</div>
		</div>
	</div>
	<script>
 
    /* gnb_area 로그아웃 버튼 작동 */
    $("#gnb_logout_button").click(function(){
        //alert("버튼 작동");
        $.ajax({
            type:"POST",
            url:"/member/logout.do",
            success:function(data){
                alert("로그아웃 성공");
                document.location.reload();     
            } 
        }); // ajax 
    });
    console.log("1" + ${memberReserve});
    
</script>
</body>
</html>