<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="/resources/css/mypage/mypageRecordDetail.css">
<meta charset="UTF-8">
<title>소견서 상세 페이지</title>
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
            <div class="content-white_area">
               <div class="title">
                  <h1>${recordDetail.recordTitle}</h1>
               </div>
               <div class="table_wrap">
                  <table class="record-semi">
                     <tr>
                        <td class="colum">번호</td>
                        <td class="data">${recordDetail.recordNum}</td>
                     </tr>
                     <tr>
                        <td class="colum">날짜</td>
                        <td class="data" ><fmt:formatDate value="${recordDetail.recordDate}"
                              pattern="yyyy/MM/dd" /></td>
                     </tr>
                     <tr>
                        <td class="colum">비용</td>
                        <td class="data">${recordDetail.expense}</td>
                     </tr>
                     <tr>
                        <td class="colum">담당의</td>
                         <td class="data">${doctorDetail.doctorName}</td>
                     </tr>
                     <tr>
                        <td class="content" colspan="2">${recordDetail.recordContent}</td>
                     </tr>
                  </table>
               </div>
               <a class="return" href="/mypage/mypageRecordView">목록으로</a>
               <form id="moveForm" method="get">
                  <input type="hidden" name="recordNum"
                     value='<c:out value="${recordDetail.recordNum}"/>'> <input
                     type="hidden" name="pageNum" value="${cri.pageNum}"> <input
                     type="hidden" name="amount" value="${cri.amount}"> <input
                     type="hidden" name="keyword" value="${cri.keyword}">
               </form>
            </div>
         </div>
      </div>
   </div>
</body>
</html>