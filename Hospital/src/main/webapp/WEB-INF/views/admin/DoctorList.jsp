<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/doctorList.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<style type="text/css">
#result_card img {
	max-width: 100%;
	width:100px;
	height: 120px;
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
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 관리</span>
		</div>
		<div class="goods_table_wrap">
			<!-- 상품 리스트 O -->
			<c:if test="${listcheck != 'empty'}">
				<table class="goods_table">
					<thead>
						<tr>
							<td class="th_column_1"></td>
							
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

										<div id="uploadReslut${list.doctorNum}"></div>
									</div>
								</div> <script>
                    			arrlist.push("${list.doctorNum}");
                    			table++;
                    		</script>
							</td>
							<td><a class="move"
								href='<c:out value="${list.doctorNum}"/>'> <c:out
										value="${list.doctorName}"></c:out>
							</a></td>
							<td><c:out value="${list.doctorContent}"></c:out></td>
							<td><c:out value="${list.subject}"></c:out></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<!-- 상품 리스트 X -->
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 의사가 없습니다.</div>
			</c:if>
		</div>

		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form id="searchForm" action="/admin/DoctorList" method="get">
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

		<form id="moveForm" action="/admin/DoctorList" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	</div>


	<%@include file="../includes/admin/footer.jsp"%>
	<script>
	
		$(document).ready(function(){
			
			/*이미지 정보 호출*/
			let uploadReslut = [];
			for(var i=0;i<table;i++){
				uploadReslut[i] = $("#uploadReslut" + arrlist[i]);
				console.log(uploadReslut[i]);
			}
			
			/* 삭제 결과 경고창 */
			let delete_result = '${delete_result}';
			
			if(delete_result == 1){
				alert("삭제 완료");
			}
			
			/*for(var i=0;i<10;i++){
				$.getJSON("/getAttachList", {DOCTORNUM : arrlist[i]}, function(arr){	
				if(arr.length === 0){		
					let str = "";
					str += "<div id='result_card'>";
					str += "<img src='/resources/img/goodsNoImage.jpg'>";
					str += "</div>";
					
					uploadReslut[i].html(str);	
					
					return;
				}	
				
				let str = "";
				let obj = arr[i];	
				
				let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				str += "<div id='result_card'";
				str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
				str += ">";
				str += "<img src='/display?fileName=" + fileCallPath +"'>";
				str += "</div>";		
				
				uploadReslut[i].html(str);						
				
				});	
			}*/
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
			
		$(".move").on("click", function(e){
			
			e.preventDefault();
			
			moveForm.append("<input type='hidden' name='doctorNum' value='"+$(this).attr("href") + "'>");
			moveForm.attr("action", "/admin/DoctorDetail");
			moveForm.submit();
		});
		
		
	
	</script>
</body>
</html>