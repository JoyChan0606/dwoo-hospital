package com.hos.model;

import java.util.List;

public class DoctorVO {

   private int doctorNum;
   private String doctorName;
   private String doctorContent;
   private String subject;
   private List<DocImageVO> imageList;
   public int getDoctorNum() {
      return doctorNum;
   }
   public void setDoctorNum(int doctorNum) {
      this.doctorNum = doctorNum;
   }
   public String getDoctorName() {
      return doctorName;
   }
   public void setDoctorName(String doctorName) {
      this.doctorName = doctorName;
   }
   public String getDoctorContent() {
      return doctorContent;
   }
   public void setDoctorContent(String doctorContent) {
      this.doctorContent = doctorContent;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public List<DocImageVO> getImageList() {
      return imageList;
   }
   public void setImageList(List<DocImageVO> imageList) {
      this.imageList = imageList;
   }
   @Override
   public String toString() {
      return "DoctorVO [doctorNum=" + doctorNum + ", doctorName=" + doctorName + ", doctorContent=" + doctorContent
            + ", subject=" + subject + ", imageList=" + imageList + "]";
   }
   
   
   
}




