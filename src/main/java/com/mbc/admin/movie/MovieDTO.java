package com.mbc.admin.movie;

import com.mbc.admin.actor.ActorDTO;

public class MovieDTO {
	int movienum;
	String movietitle,moviegenre
		  ,country,runningtime
		  ,movieopen,moviedate
		  ,moviecontent,moviedirector
		  ,casting,moviegrade
		  ,gradeimage,moviecover,trailer;
	ActorDTO actorDTO;
	public MovieDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MovieDTO(int movienum, String movietitle, String moviegenre, String country, String runningtime,
			String movieopen, String moviedate, String moviecontent, String moviedirector, String casting,
			String moviegrade, String gradeimage, String moviecover, String trailer) {
		super();
		this.movienum = movienum;
		this.movietitle = movietitle;
		this.moviegenre = moviegenre;
		this.country = country;
		this.runningtime = runningtime;
		this.movieopen = movieopen;
		this.moviedate = moviedate;
		this.moviecontent = moviecontent;
		this.moviedirector = moviedirector;
		this.casting = casting;
		this.moviegrade = moviegrade;
		this.gradeimage = gradeimage;
		this.moviecover = moviecover;
		this.trailer = trailer;
	
	}
	

	public MovieDTO(ActorDTO actorDTO) {
		this.actorDTO = actorDTO;
	}

	public ActorDTO getActorDTO() {
		return actorDTO;
	}

	public int getMovienum() {
		return movienum;
	}
	public void setMovienum(int movienum) {
		this.movienum = movienum;
	}
	public String getMovietitle() {
		return movietitle;
	}
	public void setMovietitle(String movietitle) {
		this.movietitle = movietitle;
	}
	public String getMoviegenre() {
		return moviegenre;
	}
	public void setMoviegenre(String moviegenre) {
		this.moviegenre = moviegenre;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
	public String getMovieopen() {
		return movieopen;
	}
	public void setMovieopen(String movieopen) {
		this.movieopen = movieopen;
	}
	public String getMoviedate() {
		return moviedate;
	}
	public void setMoviedate(String moviedate) {
		this.moviedate = moviedate;
	}
	public String getMoviecontent() {
		return moviecontent;
	}
	public void setMoviecontent(String moviecontent) {
		this.moviecontent = moviecontent;
	}
	public String getMoviedirector() {
		return moviedirector;
	}
	public void setMoviedirector(String moviedirector) {
		this.moviedirector = moviedirector;
	}
	public String getCasting() {
		return casting;
	}
	public void setCasting(String casting) {
		this.casting = casting;
	}
	public String getMoviegrade() {
		return moviegrade;
	}
	public void setMoviegrade(String moviegrade) {
		this.moviegrade = moviegrade;
	}
	public String getGradeimage() {
		return gradeimage;
	}
	public void setGradeimage(String gradeimage) {
		this.gradeimage = gradeimage;
	}
	public String getMoviecover() {
		return moviecover;
	}
	public void setMoviecover(String moviecover) {
		this.moviecover = moviecover;
	}
	public String getTrailer() {
		return trailer;
	}
	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

}
