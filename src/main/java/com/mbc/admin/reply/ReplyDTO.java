package com.mbc.admin.reply;

public class ReplyDTO {
	int replynum, movienum;
	String replywriter, replycontent,replydate;
	int star;
	public ReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyDTO(int replynum, int movienum, String replywriter, String replycontent, int star, String replydate) {
		super();
		this.replynum = replynum;
		this.movienum = movienum;
		this.replywriter = replywriter;
		this.replycontent = replycontent;
		this.star = star;
		this.replydate = replydate;
	}
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getMovienum() {
		return movienum;
	}
	public void setMovienum(int movienum) {
		this.movienum = movienum;
	}
	public String getReplywriter() {
		return replywriter;
	}
	public void setReplywriter(String replywriter) {
		this.replywriter = replywriter;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getReplydate() {
		return replydate;
	}
	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}
	
	
}
