<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="/resources/css/mypage/mypage.css">
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
					
						<span> <a href="/member/logout.do">로그아웃</a>
						</span>
						<span> <a href="/mypage/mypage">마이페이지</a>
						</span>
				</div>
			</div>
         <div class="mypage_header">
            	<ul>
            		<li>
            			<a class="mypage_list_01" href="/mypage/mypageUpdate">개인정보 수정</a>
            		</li>
            		<span class="line">|</span>
            		<li>
            			<a class="mypage_list_02" href="/mypage/mypageReserveView">예약정보 확인</a>
            		</li>
            		<span class="line">|</span>
            		<li>
            			<a class="mypage_list_03" href="/mypage/mypageRecordView">내 정보 보기</a>
            		</li>
            		<span class="line">|</span>
            		<li>
            			<a class="mypage_list_03" href="/mypage/mypage">마이 페이지</a>
            		</li>
            		<span class="line">|</span>
            		<li>
            			<a class="mypage_list_04" href="/main">홈페이지</a>
            		</li>
            	</ul>                   
            </div>
         <div class="content_area">
            <h1>Profile</h1>
            <br>
            <div class="user_wrap">
               <div class="user_name">이름</div>
               <div class="user_input_box">
                  <input class="user_input" name="memberName" readonly="readonly" value="${mypageDetail.memberName}">
               </div>
            </div>
            <div class="phone_wrap">
               <div class="phone_name">전화 번호</div>
               <div class="phone_input_box">
                  <input class="phone_input" name="memberPhone" readonly="readonly" value="${mypageDetail.memberPhone}">
               </div>
            </div>
            <div class="id_wrap">
               <div class="id_name">아이디</div>
               <div class="id_input_box">
                  <input class="id_input" name="memberId" readonly="readonly" value="${mypageDetail.memberId}">
               </div>
            </div>
            <div class="pw_wrap">
               <div class="pw_name">비밀번호</div>
               <div class="pw_input_box">
                  <input class="pw_input" type="password" name="memberPw" readonly="readonly" value="${mypageDetail.memberPw}">
               </div>
            </div>
            <div class="email_wrap">
               <div class="email_name">이메일</div>
               <div class="email">
                  <input class="email_input" name="memberEmail" readonly="readonly" value="${mypageDetail.memberEmail}">
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>