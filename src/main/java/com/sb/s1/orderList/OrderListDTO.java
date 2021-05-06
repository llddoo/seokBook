package com.sb.s1.orderList;

import java.sql.Date;

import com.sb.s1.bookList.BookListDTO;
import com.sb.s1.purchase.PurchaseDTO;

public class OrderListDTO {

   private String orderNumber;
   private long pointUsage;
   private long lumpSum;
   private PurchaseDTO purchaseDTO;
   private String id;
   private BookListDTO bookListDTO;

   private long purnum;
   private Date purdate;
   private long price;
   private long point;
   private long bpoint;

   
   public BookListDTO getBookListDTO() {
	return bookListDTO;
}

public void setBookListDTO(BookListDTO bookListDTO) {
	this.bookListDTO = bookListDTO;
}


   public long getBpoint() {
	return bpoint;
}

public void setBpoint(long bpoint) {
	this.bpoint = bpoint;
}

public long getPoint() {
      return point;
   }

   public void setPoint(long point) {
      this.point = point;
   }

   public long getPurnum() {
      return purnum; 
   }

   public void setPurnum(long purnum) {
      this.purnum = purnum;
   }

   public Date getPurdate() {
      return purdate;
   }

   public void setPurdate(Date purdate) {
      this.purdate = purdate;
   }

   public long getPrice() {
      return price;
   }

   public void setPrice(long price) {
      this.price = price;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public PurchaseDTO getPurchaseDTO() {
      return purchaseDTO;
   }

   public void setPurchaseDTO(PurchaseDTO purchaseDTO) {
      this.purchaseDTO = purchaseDTO;
   }

   public String getOrderNumber() {
      return orderNumber;
   }

   public void setOrderNumber(String orderNumber) {
      this.orderNumber = orderNumber;
   }



   public long getPointUsage() {
	return pointUsage;
}

public void setPointUsage(long pointUsage) {
	this.pointUsage = pointUsage;
}

public long getLumpSum() {
      return lumpSum;
   }

   public void setLumpSum(long lumpSum) {
      this.lumpSum = lumpSum;
   }

}
