package com.hos.model;

public class DocImageVO {
	/* 경로 */
	private String uploadPath;
	/* uuid */
	private String uuid;
	/* 파일 이름 */
	private String fileName;
	/* 상품 id */
	private int doctorNum;
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getDoctorNum() {
		return doctorNum;
	}
	public void setDoctorNum(int doctorNum) {
		this.doctorNum = doctorNum;
	}
	@Override
	public String toString() {
		return "DocImageVO [uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName=" + fileName + ", doctorNum="
				+ doctorNum + "]";
	}
	
}
