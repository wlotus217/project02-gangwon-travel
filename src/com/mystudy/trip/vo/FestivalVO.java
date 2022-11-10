package com.mystudy.trip.vo;

public class FestivalVO {
	private int boardNum;
	private String month , title, time, host, 
				   address, contain, fileName, viewName1, viewName2,
				   viewName3, information;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	@Override
	public String toString() {
		return "FestivalVO [boardNum=" + boardNum + ", month=" + month + ", title=" + title + ", time=" + time
				+ ", host=" + host + ", address=" + address + ", contain=" + contain + ", fileName=" + fileName
				+ ", viewName1=" + viewName1 + ", viewName2=" + viewName2 + ", viewName3=" + viewName3
				+ ", information=" + information + "]";
	}

}
