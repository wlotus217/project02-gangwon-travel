package com.mystudy.zzim.vo;

public class ZzimVO {
	private int idx;
	private String id;
	private String boardName;
	private int boardIdx;
	private String title;
	private String image;
	private String regdate;
	
	
	public ZzimVO() {
		super();
	}
	public ZzimVO(String id, String boardName, int boardIdx) {
		super();
		this.id = id;
		this.boardName = boardName;
		this.boardIdx = boardIdx;
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
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ZzimVO [idx=" + idx + ", id=" + id + ", boardName=" + boardName + ", boardIdx=" + boardIdx + ", title="
				+ title + ", image=" + image + ", regdate=" + regdate + "]";
	}
	
	
}
