package com.mystudy.bbs.vo;

public class MasterVO {
	private String id, pwd;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		return "MasterVO [id=" + id + ", pwd=" + pwd + "]";
	}

	
	
}
