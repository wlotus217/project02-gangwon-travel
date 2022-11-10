package com.mystudy.info.vo;

public class infoVO {
	private String infonum, info, city, cityphone, address;

	public String getInfonum() {
		return infonum;
	}

	public void setInfonum(String infonum) {
		this.infonum = infonum;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCityphone() {
		return cityphone;
	}

	public void setCityphone(String cityphone) {
		this.cityphone = cityphone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "infoVO [infonum=" + infonum + ", info=" + info + ", city=" + city + ", cityphone=" + cityphone
				+ ", address=" + address + "]";
	}

	
	
	
}
