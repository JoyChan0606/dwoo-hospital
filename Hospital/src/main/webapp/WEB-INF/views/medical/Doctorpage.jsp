<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/doctorpage.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
<script
   src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<style type="text/css">
#result_card img {
   max-width: 100%;
   height: 120px;
   width : 100px;
   display: block;
   margin-top: 10px;
   margin: auto;
}

</style>
<script>
   var arrlist = [];
   var table = 0;
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

               <li><a href="/home/info">과 정보</a></li>
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
      <div class="goods_table_wrap">
         <!-- 상품 리스트 O -->
         <c:if test="${listcheck != 'empty'}">
            <table class="goods_table">
               <thead>
                  <tr>
                     <td class="th_column_1"></td>
                     <td class="th_column_1">의사번호</td>
                     <td class="th_column_2">의사 이름</td>
                     <td class="th_column_3">의사 내용</td>
                     <td class="th_column_3">진료과</td>
                  </tr>
               </thead>
               <c:forEach items="${list}" var="list">
                  <tr>
                     <td>
                        <div class="form_section">
                             <div class="form_section_content">

                           <div id="uploadReslut${list.doctorNum}">
                                                      
                           </div>
                             </div>
                          </div>
                          <script>
                             arrlist.push("${list.doctorNum}");
                             table++;
                          </script>
                     </td>
                     <td><c:out value="${list.doctorNum}"></c:out></td>
                     <td><c:out value="${list.doctorName}"></c:out></td>
                     <td><c:out value="${list.doctorContent}"></c:out></td>
                     <td><c:out value="${list.subject}"></c:out></td>
                  </tr>
               </c:forEach>
            </table>
         </c:if>
         <!-- 상품 리스트 X -->
         <c:if test="${listCheck == 'empty'}">
            <div class="table_empty">등록된 작가가 없습니다.</div>
         </c:if>
      </div>

      <!-- 검색 영역 -->
      <div class="search_wrap">
         <form id="searchForm" action="/medical/Doctorpage" method="get">
            <div class="search_input">
               <input type="text" name="keyword"
                  value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
               <input type="hidden" name="pageNum"
                  value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
               <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
               <input type="hidden" name="type" value="G">
               <button class='btn search_btn'>검 색</button>
            </div>
         </form>
      </div>

      <!-- 페이지 이름 인터페이스 영역 -->
      <div class="pageMaker_wrap">
         <ul class="pageMaker">

            <!-- 이전 버튼 -->
            <c:if test="${pageMaker.prev }">
               <li class="pageMaker_btn prev"><a
                  href="${pageMaker.pageStart -1}">이전</a></li>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach begin="${pageMaker.pageStart }"
               end="${pageMaker.pageEnd }" var="num">
               <li
                  class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
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

      <form id="moveForm" action="/medical/Doctorpage" method="get">
         <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
         <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
         <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
      </form>

   <%@include file="../includes/admin/footer.jsp"%>
   </div>



   <script>
   
      $(document).ready(function(){
         
         /*이미지 정보 호출*/
         let uploadReslut = [];
         for(var i=0;i<table;i++){
            uploadReslut[i] = $("#uploadReslut" + arrlist[i]);
            console.log(uploadReslut[i]);
         }
        
         (async function() {
             for (var i = 0; i < table; i++) {
                 try {
                     const arr = await $.getJSON("/getAttachList", { doctorNum: arrlist[i] });
                     
                     let str = "";
                     if (arr.length === 0) {
                         str += "<div id='result_card'>";
                         str += "<img src='/resources/img/DoctorNoImage.PNG'>";
                         str += "</div>";
                     } else {
                         const obj = arr[0];
                         console.log(obj);
                         const fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                         str += "<div id='result_card'";
                         str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
                         str += ">";
                         str += "<img src='/display?fileName=" + fileCallPath + "'>";
                         str += "</div>";
                     }

                     uploadReslut[i].html(str);
                 } catch (error) {
                     console.error(error);
                 }
             }
         })();
         
      });
      
      let searchForm = $('#searchForm');
      let moveForm = $('#moveForm');
      
      /* 목록 이동 버튼 */
      $("#cancelBtn").on("click", function(e){
         e.preventDefault();
         $("#moveForm").submit();   
      });   
      /* 페이지 이동 버튼 */
      $(".pageMaker_btn a").on("click", function(e) {

         e.preventDefault();
         moveForm.find("input[name='pageNum']").val($(this).attr("href"));
         moveForm.submit();

      });
      /* 수정 페이지 이동 */
      $("#modifyBtn").on("click", function(e){
         e.preventDefault();
         let addInput = '<input type="hidden" name="bookId" value="${goodsInfo.bookId}">';
         $("#moveForm").append(addInput);
         $("#moveForm").attr("action", "/medical/Doctorpage");
         $("#moveForm").submit();
      });   
   
   </script>
</body>
</html>