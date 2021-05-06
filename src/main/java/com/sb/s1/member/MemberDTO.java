package com.sb.s1.member;

public class MemberDTO {

   private String id;
   private String pw;
   private String name;
   private String email;
   private String phonenum;
   private String grade;
   private long point;
   private String isbn;
   private long price;



   public MemberDTO(){
      this.isbn="null";
   }   

   
   public long getPrice() {
      return price;
   }


   public void setPrice(long price) {
      this.price = price;
   }


   public String getIsbn() {
      return isbn;
   }
   public void setIsbn(String isbn) {
      this.isbn = isbn;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPhonenum() {
      return phonenum;
   }
   public void setPhonenum(String phonenum) {
      this.phonenum = phonenum;
   }
   public String getGrade() {
      return grade;
   }
   public void setGrade(String grade) {
      this.grade = grade;
   }
   public long getPoint() {
      return point;
   }
   public void setPoint(long point) {
      this.point = point;
   }

   
   
}