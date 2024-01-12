<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DaeWoo Hospital</title>
<link rel="stylesheet" href="resources/css/medicalinfo.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<h1>헤더</h1>
			</div>
			<div class="content_area">
				<h1>의료진 소개</h1>
				<br> <br>
				<div class="fileName_wrap">
					<input type="hidden" name="fileName"
						value="${밸류 바꿔주세요.fileName}">
					<div class="fileName_name">이름</div>
					<div class="fileName_input_box">
						<input class="fileName_input" name="fileName" readonly="readonly"
							value="${밸류 바꿔주세요.fileName}">
					</div>
				</div>
				<div class="doctorName_wrap">
					<input type="hidden" name="doctorName"
						value="${밸류 바꿔주세요.doctorName}">
					<div class="doctorName_name">이름</div>
					<div class="doctorName_input_box">
						<input class="doctorName_input" name="doctorName" readonly="readonly"
							value="${밸류 바꿔주세요.doctorName}">
					</div>
				</div>
				<div class="subject_wrap">
					<div class="subject_name">과목</div>
					<div class="subject_input_box">
						<input class="subject_input" name="subject"
							value="${밸류 바꿔주세요.subject}">
					</div>
				</div>
				<div class="doctorContent_wrap">
					<div class="doctorContent_name">과목</div>
					<div class="doctorContent_input_box">
						<input class="doctorContent_input" name="doctorContent"
							value="${밸류 바꿔주세요.doctorContent}">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>