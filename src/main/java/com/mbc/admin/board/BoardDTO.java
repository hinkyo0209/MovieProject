package com.mbc.admin.board;

public class BoardDTO {
	int boardnum;
	String boardtitle, boardcontent, boardwriter;
	int boardcnt;
	String boarddate;
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardDTO(int boardnum, String boardtitle, String boardcontent, String boardwriter, int boardcnt,
			String boarddate) {
		super();
		this.boardnum = boardnum;
		this.boardtitle = boardtitle;
		this.boardcontent = boardcontent;
		this.boardwriter = boardwriter;
		this.boardcnt = boardcnt;
		this.boarddate = boarddate;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public String getBoardwriter() {
		return boardwriter;
	}
	public void setBoardwriter(String boardwriter) {
		this.boardwriter = boardwriter;
	}
	public int getBoardcnt() {
		return boardcnt;
	}
	public void setBoardcnt(int boardcnt) {
		this.boardcnt = boardcnt;
	}
	public String getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(String boarddate) {
		this.boarddate = boarddate;
	}
	
	
}
