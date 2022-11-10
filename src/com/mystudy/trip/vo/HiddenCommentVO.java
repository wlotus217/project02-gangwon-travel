package com.mystudy.trip.vo;

public class HiddenCommentVO { 
	private int boardNum;
	private String writer, password, contain, writeDate;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContain() {
		return contain;
	}
	public void setContain(String contain) {
		this.contain = contain;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "HiddenCommentVO [boardNum=" + boardNum + ", writer=" + writer + ", password=" + password + ", contain="
				+ contain + ", writeDate=" + writeDate + "]";
	}

}
