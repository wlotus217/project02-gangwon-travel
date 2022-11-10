package com.mystudy.story.vo;

import java.sql.Date;

public class ThemeVO {
	private int idx;
	private String id;
	private String title;
	private String intro;
	private Date regdate;
	private String image1,image2,image3,image4,image5;
	private String placeName1, placeName2, placeName3, placeName4, placeName5;
	private String detail1, detail2, detail3, detail4, detail5;
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
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public String getImage5() {
		return image5;
	}
	public void setImage5(String image5) {
		this.image5 = image5;
	}
	public String getPlaceName1() {
		return placeName1;
	}
	public void setPlaceName1(String placeName1) {
		this.placeName1 = placeName1;
	}
	public String getPlaceName2() {
		return placeName2;
	}
	public void setPlaceName2(String placeName2) {
		this.placeName2 = placeName2;
	}
	public String getPlaceName3() {
		return placeName3;
	}
	public void setPlaceName3(String placeName3) {
		this.placeName3 = placeName3;
	}
	public String getPlaceName4() {
		return placeName4;
	}
	public void setPlaceName4(String placeName4) {
		this.placeName4 = placeName4;
	}
	public String getPlaceName5() {
		return placeName5;
	}
	public void setPlaceName5(String placeName5) {
		this.placeName5 = placeName5;
	}
	public String getDetail1() {
		return detail1;
	}
	public void setDetail1(String detail1) {
		this.detail1 = detail1;
	}
	public String getDetail2() {
		return detail2;
	}
	public void setDetail2(String detail2) {
		this.detail2 = detail2;
	}
	public String getDetail3() {
		return detail3;
	}
	public void setDetail3(String detail3) {
		this.detail3 = detail3;
	}
	public String getDetail4() {
		return detail4;
	}
	public void setDetail4(String detail4) {
		this.detail4 = detail4;
	}
	public String getDetail5() {
		return detail5;
	}
	public void setDetail5(String detail5) {
		this.detail5 = detail5;
	}
	@Override
	public String toString() {
		return "ThemeVO [idx=" + idx + ", id=" + id + ", title=" + title + ", intro=" + intro + ", regdate=" + regdate
				+ ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4
				+ ", image5=" + image5 + ", placeName1=" + placeName1 + ", placeName2=" + placeName2 + ", placeName3="
				+ placeName3 + ", placeName4=" + placeName4 + ", placeName5=" + placeName5 + ", detail1=" + detail1
				+ ", detail2=" + detail2 + ", detail3=" + detail3 + ", detail4=" + detail4 + ", detail5=" + detail5
				+ "]";
	}
	
	
	
	
}
