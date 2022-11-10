package com.mystudy.trip.vo;

public class EducationVO {
	private String boardNum, title, oriName, fileName;

	public String getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "EducationVO [boardNum=" + boardNum + ", title=" + title + ", oriName=" + oriName + ", fileName="
				+ fileName + "]";
	}

	
}
