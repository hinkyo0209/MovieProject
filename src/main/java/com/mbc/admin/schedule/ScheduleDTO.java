package com.mbc.admin.schedule;

public class ScheduleDTO {
	int movienum;
	String schedule_num,screening_date,screening_time,screening_theater;
	public ScheduleDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ScheduleDTO(int movienum, String schedule_num, String screening_date, String screening_time,
			String screening_theater) {
		super();
		this.movienum = movienum;
		this.schedule_num = schedule_num;
		this.screening_date = screening_date;
		this.screening_time = screening_time;
		this.screening_theater = screening_theater;
	}
	public int getMovienum() {
		return movienum;
	}
	public void setMovienum(int movienum) {
		this.movienum = movienum;
	}
	public String getSchedule_num() {
		return schedule_num;
	}
	public void setSchedule_num(String schedule_num) {
		this.schedule_num = schedule_num;
	}
	public String getScreening_date() {
		return screening_date;
	}
	public void setScreening_date(String screening_date) {
		this.screening_date = screening_date;
	}
	public String getScreening_time() {
		return screening_time;
	}
	public void setScreening_time(String screening_time) {
		this.screening_time = screening_time;
	}
	public String getScreening_theater() {
		return screening_theater;
	}
	public void setScreening_theater(String screening_theater) {
		this.screening_theater = screening_theater;
	}
	
	
	
}
