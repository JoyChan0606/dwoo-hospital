<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/medical/recordDetail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
</head>
<body>
<%@include file="../includes/medical/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>진료 기록 상세</span></div>

                    <div class="admin_content_main">

                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>진료 타이틀</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="recordTitle" value="<c:out value="${recordInfo.recordTitle}"/>" disabled>
                    			</div>
                    		</div>
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>진료 기록 내용</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="recordContent" id="bookIntro_textarea" disabled>${recordInfo.recordContent}</textarea>
                    			</div>
                    		</div>        		
                    		
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">진료 기록 리스트</button>
	                    		<button id="modifyBtn" class="btn enroll_btn">수정 </button>
	                    	</div> 
                    </div>      

                	
                <form id="moveForm" method="get">
                	<input type="hidden" name="recordNum" value='<c:out value="${recordInfo.recordNum }"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
                </form>
                </div>
 				<%@include file="../includes/medical/footer.jsp" %>

<script>		
let moveForm = $("#moveForm");



/* 작가 관리 페이지 이동 버튼 */
$("#cancelBtn").on("click", function(e){
	
	e.preventDefault();
	
	$("input[name=recordNum]").remove();
	moveForm.attr("action", "/medical/recordList")
	moveForm.submit();
	
});

/* 작가 수정 페이지 이동 버튼 */
$("#modifyBtn").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.attr("action", "/medical/recordModify");
	moveForm.submit();
	
});
</script>
</body>
</html>