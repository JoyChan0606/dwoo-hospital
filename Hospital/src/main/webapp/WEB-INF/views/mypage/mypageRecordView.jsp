<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 진료 기록</title>
<link rel="stylesheet" href="/resources/css/mypage/mypageRecordView.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous">
   
</script>
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
                  <h1>내 진료 기록</h1>
               </div>
               <div class="table_wrap">
                  <table class="list_table">
                     <thead class="table_menu">
                        <tr>
                           <th>번호</th>
                           <th>제목</th>
                           <th>날짜</th>
                           <th>비용</th>
                           <th>담당의</th>
                        </tr>
                     </thead>
                     <c:forEach var="recordlist" items="${recordDetail}"   varStatus="status">
                        <tr>
                           <td>${status.index}</td>
                           <td><a class="move"
                              href='<c:out value="${recordlist.recordNum}"/>'> <c:out
                                    value="${recordlist.recordTitle}" />
                           </a></td>
                           <td><fmt:formatDate value="${recordlist.recordDate}"
                                 pattern="yyyy/MM/dd" /></td>
                           <td>${recordlist.expense}</td>
                           <td>${doctorDetail[status.index].doctorName}</td>
                        </tr>
                     </c:forEach>
                  </table>
               </div>

               <!-- 페이지 이동 인터페이스 영역 -->
               <div class="pageMaker_wrap">

                  <ul class="pageMaker">

                     <!-- 이전 버튼 -->
                     <c:if test="${pageMaker.prev}">
                        <li class="pageMaker_btn prev"><a
                           href="${pageMaker.pageStart - 1}">이전</a></li>
                     </c:if>

                     <!-- 페이지 번호 -->
                     <c:forEach begin="${pageMaker.pageStart}"
                        end="${pageMaker.pageEnd}" var="num">
                        <li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
                           <a href="${num}">${num}</a>
                        </li>
                     </c:forEach>
                     <!-- 다음 버튼 -->
                     <c:if test="${pageMaker.next}">
                        <li class="pageMaker_btn next"><a
                           href="${pageMaker.pageEnd + 1 }">다음</a></li>
                     </c:if>
                  </ul>
               </div>
               <form id="moveForm" action="/mypage/mypageRecordView" method="get">
                  <input type="hidden" name="pageNum"
                     value="${pageMaker.cri.pageNum}"> <input type="hidden"
                     name="amount" value="${pageMaker.cri.amount}"> <input
                     type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
               </form>
            </div>
         </div>
         <script>
            $(".move")
                  .on(
                        "click",
                        function(e) {

                           e.preventDefault();

                           moveForm
                                 .append("<input type='hidden' name='recordNum' value='"
                                       + $(this).attr("href")
                                       + "'>");
                           moveForm.attr("action",
                                 "/mypage/mypageRecordDetail");
                           moveForm.submit();

                        });

            let moveForm = $('#moveForm');

            /* 페이지 이동 버튼 */
            $(".pageMaker_btn a").on(
                  "click",
                  function(e) {

                     e.preventDefault();

                     moveForm.find("input[name='pageNum']").val(
                           $(this).attr("href"));

                     moveForm.submit();
                  });
         </script>
      </div>
   </div>
</body>
</html>