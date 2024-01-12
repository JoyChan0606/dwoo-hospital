package com.hos.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RecordVO {
	private int recordNum;
	
	private int doctorNum;
	
	private String doctorName;
	
	private int memberNum;
	
	private String recordContent;
	
	private String recordTitle;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date recordDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dsDate;
	
	private String expense;
	
	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public int getRecordNum() {
		return recordNum;
	}

	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}

	public int getDoctorNum() {
		return doctorNum;
	}

	public void setDoctorNum(int doctorNum) {
		this.doctorNum = doctorNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getRecordContent() {
		return recordContent;
	}

	public void setRecordContent(String recordContent) {
		this.recordContent = recordContent;
	}

	public String getRecordTitle() {
		return recordTitle;
	}

	public void setRecordTitle(String recordTitle) {
		this.recordTitle = recordTitle;
	}

	public Date getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}

	public Date getDsDate() {
		return dsDate;
	}

	public void setDsDate(Date dsDate) {
		this.dsDate = dsDate;
	}

	public String getExpense() {
		return expense;
	}

	public void setExpense(String expense) {
		this.expense = expense;
	}

	@Override
	public String toString() {
		return "RecordVO [recordNum=" + recordNum + ", doctorNum=" + doctorNum + ", doctorName=" + doctorName
				+ ", memberNum=" + memberNum + ", recordContent=" + recordContent + ", recordTitle=" + recordTitle
				+ ", recordDate=" + recordDate + ", dsDate=" + dsDate + ", expense=" + expense + "]";
	}
	
}