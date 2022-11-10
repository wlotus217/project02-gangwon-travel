package com.mystudy.story.vo;

public class HitVO {
	private int boardnum, hit;
	private String title, address;
	
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "HitVO [boardnum=" + boardnum + ", hit=" + hit + ", title=" + title + ", address=" + address + "]";
	}
	
	
}