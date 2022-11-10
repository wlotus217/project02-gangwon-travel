package com.mystudy.story.vo;

import java.sql.Date;

public class ReviewVO {
	private int idx;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	private String image1,image2,image3;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	@Override
	public String toString() {
		return "ReviewVO [idx=" + idx + ", id=" + id + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + "]";
	}
	
	
}
