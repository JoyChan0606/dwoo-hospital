<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/medical/recordModify.css">
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
					<form id="modifyForm" action="/medical/recordModify" method="post">
                    <div class="admin_content_main">

                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>진료 타이틀</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="recordTitle" value="<c:out value="${recordInfo.recordTitle}"/>">
                    			</div>
                    		</div>
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>진료 기록 내용</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="recordContent" id="bookIntro_textarea">${recordInfo.recordContent}</textarea>
                    			</div>
                    		</div>        		
                    		
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
                   				<input type="hidden" name="recordNum" value='<c:out value="${recordInfo.recordNum }"/>'>
	                    		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	                    		<button id="deleteBtn" class="btn delete_btn">삭 제</button>
	                    	</div> 
	                    	
                    </div>      
			</form>
                	
                	<form id="moveForm" method="get" >
 						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
                	</form>
                	
                </div>
 				<%@include file="../includes/medical/footer.jsp" %>

<script>		
	$(document).ready(function(){
		
		
		
		
		/* 책 소개 */
		ClassicEditor
			.create(document.querySelector('#bookIntro_textarea'))
			.catch(error=>{
				console.error(error);
		});
		
		/* 취소 버튼 */
		$("#cancelBtn").on("click", function(e){
			e.preventDefault();
			$("#moveForm").submit();
		});
		
		/* 수정 버튼 */
		$("#modifyBtn").on("click",function(e){
			
			e.preventDefault();
			
			$("#modifyForm").submit();
			
			
		});
		
		/* 삭제 버튼 */
		$("#deleteBtn").on("click", function(e){
			e.preventDefault();
			let moveForm = $("#moveForm");
			moveForm.find("input").remove();
			moveForm.append('<input type="hidden" name="recordNum" value="${recordInfo.recordNum}">');
			moveForm.attr("action", "/medical/recordDelete");
			moveForm.attr("method", "post");
			moveForm.submit();
		});
	});
</script>
</body>
</html>