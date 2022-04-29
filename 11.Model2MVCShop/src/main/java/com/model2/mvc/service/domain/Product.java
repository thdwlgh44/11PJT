package com.model2.mvc.service.domain;

import java.sql.Date;


public class Product {
	
	private String fileName; //�̹����������ϸ�
	private String manuDate; //��������
	private int price; //����
	private String prodDetail; //��ǰ������
	private String prodName; //��ǰ��
	private int prodNo; //��ǰ��ȣ
	private Date regDate; //����Ͻ�
	private String proTranCode;
	
	private String regDateString;
	
	public Product(){
	}
	
	public String getRegDateString() {
		return regDateString;
	}

	public void setRegDateString(String regDateString) {
		this.regDateString = regDateString;
	}

	public String getProTranCode() {
		return proTranCode;
	}
	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getManuDate() {
		return manuDate;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;

		if (regDate != null) {
			// JSON ==> Domain Object Binding�� ���� �߰��� �κ�
			this.setRegDateString(regDate.toString().split("-")[0] + "-" + regDate.toString().split("-")[1] + "-"
					+ regDate.toString().split("-")[2]);
		}
	}

	// Override
	public String toString() {
		return "Product : [fileName]" + fileName
				+ "[manuDate]" + manuDate+ "[price]" + price + "[prodDetail]" + prodDetail
				+ "[prodName]" + prodName + "[prodNo]" + prodNo;
	}	
}