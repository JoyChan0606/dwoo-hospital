<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/DoctorDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
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
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 상세</span>
		</div>

		<div class="admin_content_main">
			<form action="/admin/doctorModify" method="post" id="modifyForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>의사 번호</label>
					</div>
					<div class="form_section_content">
						<input value="<c:out value="${goodsInfo.doctorNum}"/>" disabled>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>의사 이름</label>
					</div>
					<div class="form_section_content">
						<input name="doctorName"
							value="<c:out value="${goodsInfo.doctorName}"/>">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>의사 내용</label>
					</div>
					<div class="form_section_content">
						<input name="doctorContent"
							value="<c:out value="${goodsInfo.doctorContent}"/>">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>소속</label>
					</div>
					<div class="form_section_content">
						<select name="subject">
							<option value="none" selected="selected">===선택===</option>
							<option value="정형외과">정형외과</option>
							<option value="내과">내과</option>
							<option value="피부과">피부과</option>
							<option value="소아과">소아과</option>
						</select> <span id="warn_nationId">소속된 과를 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이미지</label>
					</div>
					<div class="form_section_content">
						<input type="file" id="fileItem" name='uploadFile'
							style="height: 30px;">
						<div id="uploadResult"></div>
					</div>
				</div>

				<input type="hidden" name='doctorNum' value="${goodsInfo.doctorNum}">
			</form>
			<div class="btn_section">
				<button id="cancelBtn" class="btn">상품 목록</button>
				<button id="modifyBtn" class="btn enroll_btn">수정</button>
				<button id="deleteBtn" class="btn delete_btn">삭 제</button>
			</div>
		</div>


		<form id="moveForm" action="/admin/DoctorList" method="get">
			<input type="hidden" name="pageNum" value="${cri.pageNum}"> <input
				type="hidden" name="amount" value="${cri.amount}"> <input
				type="hidden" name="keyword" value="${cri.keyword}">
		</form>

	</div>
	<%@include file="../includes/admin/footer.jsp"%>
	<script>
		$(document).ready(function() {

							let aaa = '${goodsInfo.subject}';
							let selectElement = document.getElementsByName('subject')[0]; // name이 subject인 첫 번째 <select> 요소를 가져옵니다.
							/* 기존 이미지 출력 */
							let doctorNum = '<c:out value="${goodsInfo.doctorNum}"/>';
							let uploadResult = $("#uploadResult");
							
							for (let i = 0; i < selectElement.options.length; i++) {
								if (selectElement.options[i].value == aaa) {
									selectElement.options[i].selected = true; // 값이 일치하는 경우 해당 옵션을 선택합니다.
									break; // 선택 후 반복문을 종료합니다.
								}
							}
							
							
							$.getJSON("/getAttachList", {doctorNum : doctorNum}, function(arr){
								
								console.log(arr);
								
								if(arr.length === 0){
									
									
									let str = "";
									str += "<div id='result_card'>";
									str += "<img src='/resources/img/goodsNoImage.png'>";
									str += "</div>";
									
									uploadResult.html(str);				
									return;
								}
								
								let str = "";
								let obj = arr[0];
								
								let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
								str += "<div id='result_card'";
								str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
								str += ">";
								str += "<img src='/display?fileName=" + fileCallPath +"'>";
								str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
								str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
								str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
								str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
								str += "</div>";
								
								uploadResult.html(str);			
								
							});// GetJSON
		});
						
		$("input[type='file']").on("change", function(e){
			
			/* 이미지 존재시 삭제 */
			if($("#result_card").length > 0){
				deleteFile();
			}
					
			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			
			if(!fileCheck(fileObj.name, fileObj.size)){
				return false;
			}
			
			formData.append("uploadFile", fileObj);
			
			$.ajax({
				url: '/admin/uploadAjaxAction',
		    	processData : false,
		    	contentType : false,
		    	data : formData,
		    	type : 'POST',
		    	dataType : 'json',
		    	success : function(result){
		    		console.log(result);
		    		showUploadImage(result);
		    	},
		    	error : function(result){
		    		alert("이미지 파일이 아닙니다.");
		    	}
			});		

			
		});
			
		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 5242880; //1MB	
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;		
			
		}
		
		/* 이미지 출력 */
		function showUploadImage(uploadResultArr){
			
			/* 전달받은 데이터 검증 */
			if(!uploadResultArr || uploadResultArr.length == 0){return}
			
			let uploadResult = $("#uploadResult");
			
			let obj = uploadResultArr[0];
			
			let str = "";
			
			let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
			//replace 적용 하지 않아도 가능
			//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			
			str += "<div id='result_card'>";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
			str += "</div>";		
			
	   		uploadResult.append(str);     
	        
		}
		
		/* 목록 이동 버튼 */
		$("#cancelBtn").on("click", function(e) {
			e.preventDefault();
			$("#moveForm").submit();
		});

		/* 수정 버튼 */
		$("#modifyBtn").on("click", function(e) {
			e.preventDefault();
			$("#modifyForm").submit();
		});

		/* 삭제 버튼 */
		$("#deleteBtn").on("click",function(e) {
							e.preventDefault();
							let moveForm = $("#moveForm");
							moveForm.find("input").remove();
							moveForm
									.append('<input type="hidden" name="doctorNum" value="${goodsInfo.doctorNum}">');
							moveForm.attr("action", "/admin/doctorDelete");
							moveForm.attr("method", "post");
							moveForm.submit();
						});
		
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			
			deleteFile();
			
		});
		
		/* 파일 삭제 메서드 */
		function deleteFile(){
			$("#result_card").remove();
			
		}
	</script>
</body>
</html>