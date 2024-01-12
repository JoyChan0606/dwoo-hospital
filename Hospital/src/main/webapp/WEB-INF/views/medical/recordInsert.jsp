	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/medical/recordInsert.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>
</head>
<body>
 
    <%@include file="../includes/medical/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>진료 기록 등록</span></div>
                    <div class="admin_content_main">
                    	<form action="/medical/recordInsert" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>환자 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="authorName_input" readonly="readonly">
									<input id="authorId_input" name="memberNum" type="hidden" value="96">
									<button class="authorId_btn">환자 선택</button>
									<span class="ck_warn authorId_warn">환자를 선택해주세요</span>
                    			</div>
                    		</div>       
                    		    	
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>진료 기록</label>
                    			</div>
                    			<div class="form_section_content">
	                    			<div class="form_section_content">
	                    				<label>진료 타이틀</label>
	                    				<input name="recordTitle">
	                    				<span class="ck_warn bookName_warn">진료 제목을 입력해주세요.</span>
	                    			</div>
	                    			<div>
	                    				<label>진료 내용</label>
	                    				<textarea name="recordContent" id="bookIntro_textarea"></textarea>
	                    				<span class="ck_warn bookIntro_warn">진료 기록을 입력해주세요.</span>
                    				</div>
                    			</div>
                    		</div>   
                    	</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>
                </div>
    <%@include file="../includes/medical/footer.jsp" %>

<script>

	let enrollForm = $("#enrollForm")
	
	
	/* 취소 버튼 */
	$("#cancelBtn").click(function(){
	
	location.href="/medical/main"
	
	});
	
	/* 상품 등록 버튼 */
	$("#enrollBtn").on("click",function(e){
		
		enrollForm.submit();
	
	});
	
	/* 작가 선택 버튼 */
	$('.authorId_btn').on("click",function(e){
		
		e.preventDefault();
		
		let popUrl = "patientPop";
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"환자 목록",popOption);
	});
	
	/* 책 소개 */
	ClassicEditor
		.create(document.querySelector('#bookIntro_textarea'))
		.catch(error=>{
			console.error(error);
	});
</script>
 
</body>
</html>