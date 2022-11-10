package com.mystudy.info.vo;

public class planVO {
	private String tripnum,
	triptitle,
	region,
	triptheme,
	purpose,
	regdate,
	day1,
	day2,
	day3,
	id;

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTripnum() {
		return tripnum;
	}

	public void setTripnum(String tripnum) {
		this.tripnum = tripnum;
	}

	public String getTriptitle() {
		return triptitle;
	}

	public void setTriptitle(String triptitle) {
		this.triptitle = triptitle;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getTriptheme() {
		return triptheme;
	}

	public void setTriptheme(String triptheme) {
		this.triptheme = triptheme;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "planVO [tripnum=" + tripnum + ", triptitle=" + triptitle + ", region=" + region + ", triptheme="
				+ triptheme + ", purpose=" + purpose + ", regdate=" + regdate + ", day1=" + day1 + ", day2=" + day2
				+ ", day3=" + day3 + ", id=" + id + "]";
	}

	
}
