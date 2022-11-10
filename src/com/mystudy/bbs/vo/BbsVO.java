package com.mystudy.bbs.vo;

public class BbsVO {
	private String boardNum, title, id, content, fileName, 
			oriName, pwd, writeDate;

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}


	

	@Override
	public String toString() {
		return "BbsVO [boardNum=" + boardNum + ", title=" + title + ", id=" + id + ", content=" + content
				+ ", fileName=" + fileName + ", oriName=" + oriName + ", pwd=" + pwd + ", writeDate=" + writeDate
				+ "]";
	}
	
}
