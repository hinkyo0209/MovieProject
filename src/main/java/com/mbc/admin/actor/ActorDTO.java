package com.mbc.admin.actor;

public class ActorDTO {
	int movienum;
	int actornum;
	String actor, actorimage, actortv1, actortv2, actortv3;


	public ActorDTO() {
	}



	public ActorDTO(int movienum,int actornum, String actor, String actorimage, String actortv1, String actortv2, String actortv3) {
		super();
		this.movienum = movienum;
		this.actornum = actornum;
		this.actor = actor;
		this.actorimage = actorimage;
		this.actortv1 = actortv1;
		this.actortv2 = actortv2;
		this.actortv3 = actortv3;

	}



	public int getActornum() {
		return actornum;
	}



	public void setActornum(int actornum) {
		this.actornum = actornum;
	}



	public int getMovienum() {
		return movienum;
	}

	public void setMovienum(int movienum) {
		this.movienum = movienum;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getActorimage() {
		return actorimage;
	}

	public void setActorimage(String actorimage) {
		this.actorimage = actorimage;
	}

	public String getActortv1() {
		return actortv1;
	}

	public void setActortv1(String actortv1) {
		this.actortv1 = actortv1;
	}

	public String getActortv2() {
		return actortv2;
	}

	public void setActortv2(String actortv2) {
		this.actortv2 = actortv2;
	}

	public String getActortv3() {
		return actortv3;
	}

	public void setActortv3(String actortv3) {
		this.actortv3 = actortv3;
	}
	
	
}
