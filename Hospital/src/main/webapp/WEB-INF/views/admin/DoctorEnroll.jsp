<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/DoctorEnroll.css">
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
<script
   src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
 #result_card img {
	max-width: 100%;
	width:100px;
	height: 120px;
	display: block;
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
         <span>작가 등록</span>
      </div>
      <div class="admin_content_main">
         <form action="/admin/doctorEnroll" method="post" id="enrollForm">
            <div class="form_section">
               <div class="form_section_title">
                  <label>의사 이름</label>
               </div>
               <div class="form_section_content">
                  <input name="doctorName"> <span id="warn_authorName">의사의
                     이름을 입력 해주세요.</span>
               </div>
            </div>
            <div class="form_section">
               <div class="form_section_title">
                  <label>소속</label>
               </div>
               <div class="form_section_content">
                  <select name="subject">
                     <option value="none" selected>=== 선택 ===</option>
                     <option value="정형외과">정형 외과</option>

                  </select> <span id="warn_nationId">소속된 과를 선택해주세요.</span>
               </div>
            </div>
            <div class="form_section">
               <div class="form_section_title">
                  <label>의사소개</label>
               </div>
               <div class="form_section_content">
                  <input name="doctorContent" type="text"> <span
                     id="warn_authorIntro">의사 소개를 입력 해주세요.</span>
               </div>
            </div>
            <div class="form_section">
               <div class="form_section_title">
                  <label>상품 이미지</label>
               </div>
               <div class="form_section_content">
                  <input type="file" multiple="multiple" id="fileItem" name='uploadFile' style="height: 30px;">
                  <div id="uploadResult">   
                     
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
   <%@include file="../includes/admin/footer.jsp"%>
   <script>
      let enrollForm = $("#enrollForm")
      /* 등록 버튼 */
      $("#enrollBtn").on("click",function(e){
    	  let nameCheck = false;            // 작가 이름
    	    let subjectCheck = false;        // 소속 국가
    	    let introCheck = false;            // 작가 소개
    	    let imageCheck = false;
    	 
    	    /* 입력값 변수 */
    	    let doctorName = $('input[name=doctorName]').val();        // 작가 이름
    	    let subject = $('select[name=subject]').val();        // 소속 국가
    	    let doctorContent = $('input[name=doctorContent]').val();    // 작가 소개
    	    let uploadFile = $('input[name=uploadFile]').val();
    	    
    	    /* 공란 경고 span태그 */
    	    let wAuthorName = $('#warn_authorName');
    	    let wNationId = $('#warn_nationId');
    	    let wAuthorIntro = $('#warn_authorIntro');    
    	    
    	    /* 작기 이름 공란 체크 */
    	    if(doctorName ===''){
    	        wAuthorName.css('display', 'block');
    	        nameCheck = false;
    	    } else{
    	        wAuthorName.css('display', 'none');
    	        nameCheck = true;
    	    }
    	    
    	    /* 소속 국가 공란 체크 */
    	    if(subject ==='none'){
    	        wNationId.css('display', 'block');
    	        nationCheck = false;
    	    } else{
    	        wNationId.css('display', 'none');
    	        nationCheck = true;
    	    }    
    	    
    	    /* 작가 소개 공란 체크 */
    	    if(doctorContent ===''){
    	        wAuthorIntro.css('display', 'block');
    	        introCheck = false;
    	    } else{
    	        wAuthorIntro.css('display', 'none');
    	        introCheck = true;
    	    }    
    	    
    	    /* 최종 검사 */
    	    if(nameCheck && nationCheck && introCheck){
    	    	 e.preventDefault();
    	          enrollForm.submit();   
    	    } else{
    	        return;
    	    }

        
      });

      /* 취소 버튼 */
      $("#cancelBtn").click(function() {
         location.href = "/admin/main"
      });

      $(document).ready(function(){
         
         let eResult = '<c:out value="${enroll_result}"/>';
         
         checkResult(eResult);
         
         function checkResult(result){
            
            if(result === ''){
               return;
            }
            
            alert("의료진'"+ eResult +"'을 등록하였습니다.");
            
         }

      });
      
      /* 이미지 업로드 */
      $("input[type='file']").on("change", function(e) {
         
         /* 이미지 존재시 삭제 */
         if($(".imgDeleteBtn").length > 0){
            deleteFile();
         }
         
         let formData = new FormData();
         let fileInput = $('input[name="uploadFile"]');
         let fileList = fileInput[0].files;
         let fileObj = fileList[0];
         /*
         if (!fileCheck(fileObj.name, fileObj.size)) {
            return false;
         }
         */
         formData.append("uploadFile", fileObj);

         $.ajax({
            url : 'uploadAjaxAction',
            processData : false,
            contentType : false,
            data : formData,
            type : 'POST',
            dataType : 'json',
            success : function(result) {
               console.log(result);
               showUploadImage(result);
            },
            error : function(result) {
               alert("이미지 파일이 아닙니다.");
            }
         });

      });
      
      /* var, method related with attachFile */
      let regex = new RegExp("(.*?)\.(jpg|png)$");
      let maxSize = 5242880; //1MB   

      function fileCheck(fileName, fileSize) {

         if (fileSize >= maxSize) {
            alert("파일 사이즈 초과");
            return false;
         }

         if (!regex.test(fileName)) {
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
         
         str += "<div id='result_card'>";
          console.log("fileCallPath:"+ fileCallPath);
         str += "<img src='/display?fileName=" + fileCallPath +"'/>";
         str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
         str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
         str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
         str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";   
         str += "</div>";      
         
            uploadResult.append(str);     
           
      }   
      
      /* 이미지 삭제 버튼 동작 */
      $("#uploadResult").on("click", ".imgDeleteBtn", function(e){
         
         deleteFile();
         
      });
      
      /* 파일 삭제 메서드 */
      function deleteFile(){
         
         let targetFile = $(".imgDeleteBtn").data("file");
         
         let targetDiv = $("#result_card");
         
         $.ajax({
            url: '/admin/deleteFile',
            data : {fileName : targetFile},
            dataType : 'text',
            type : 'POST',
            success : function(result){
               console.log(result);
               
               targetDiv.remove();
               $("input[type='file']").val("");
               
            },
            error : function(result){
               console.log(result);
               
               alert("파일을 삭제하지 못하였습니다.")
            }
         });
      }
      
      
      
   </script>

</body>
</html>