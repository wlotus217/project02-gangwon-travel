package com.mystudy.trip.vo;

public class ExperienceVO {
	private int boardNum;
	private String title, contain, fileName, viewName1,
				   viewName2, viewName3, address, pay, phone, 
				   time, writeDate, hit;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContain() {
		return contain;
	}
	public void setContain(String contain) {
		this.contain = contain;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getViewName1() {
		return viewName1;
	}
	public void setViewName1(String viewName1) {
		this.viewName1 = viewName1;
	}
	public String getViewName2() {
		return viewName2;
	}
	public void setViewName2(String viewName2) {
		this.viewName2 = viewName2;
	}
	public String getViewName3() {
		return viewName3;
	}
	public void setViewName3(String viewName3) {
		this.viewName3 = viewName3;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "ExperienceVO [boardNum=" + boardNum + ", title=" + title + ", contain=" + contain + ", fileName="
				+ fileName + ", viewName1=" + viewName1 + ", viewName2=" + viewName2 + ", viewName3=" + viewName3
				+ ", address=" + address + ", pay=" + pay + ", phone=" + phone + ", time=" + time + ", writeDate="
				+ writeDate + ", hit=" + hit + "]";
	}
}
