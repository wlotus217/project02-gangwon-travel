package com.mystudy.story.vo;

import java.sql.Date;

public class CourseVO {
	private int idx;
	private String id;
	private String title;
	private String intro;
	private Date regdate;
	private String image;
	private String tDay;
	private String day1, day2, day3;
	private String placeName, placeLa, placeMa;
	
	
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceLa() {
		return placeLa;
	}
	public void setPlaceLa(String placeLa) {
		this.placeLa = placeLa;
	}
	public String getPlaceMa() {
		return placeMa;
	}
	public void setPlaceMa(String placeMa) {
		this.placeMa = placeMa;
	}
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
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String gettDay() {
		return tDay;
	}
	public void settDay(String tDay) {
		this.tDay = tDay;
	}
	public String getDay1() {
		return day1;
	}
	public void setDay1(String day1) {
		this.day1 = day1;
	}
	public String getDay2() {
		return day2;
	}
	public void setDay2(String day2) {
		this.day2 = day2;
	}
	public String getDay3() {
		return day3;
	}
	public void setDay3(String day3) {
		this.day3 = day3;
	}
	@Override
	public String toString() {
		return "CourseVO [idx=" + idx + ", id=" + id + ", title=" + title + ", intro=" + intro + ", regdate=" + regdate
				+ ", image=" + image + ", tDay=" + tDay + ", day1=" + day1 + ", day2=" + day2 + ", day3=" + day3
				+ ", placeName=" + placeName + ", placeLa=" + placeLa + ", placeMa=" + placeMa + "]";
	}
	
	
	
}
