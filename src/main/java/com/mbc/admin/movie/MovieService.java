package com.mbc.admin.movie;

import java.util.ArrayList;

import com.mbc.admin.actor.ActorDTO;
import com.mbc.admin.reply.ReplyDTO;

public interface MovieService {

	public void insertmovie(String movietitle, String moviegenre, 
							String country, String runningtime,
							String movieopen,String moviedate,
							String moviecontent, String moviedirector,
							String casting, String moviegrade,
							String gradefname, String moviefname,
							String trailerfname);

	public ArrayList<MovieDTO> outmovie();

	public ArrayList<MovieDTO> deletemovie(int number);

	public void deletemovie2(int number);

	public ArrayList<MovieDTO> updatemovie(int number);

	public void updatemovie2(int movienum, String movietitle,
							String moviegenre, String country,
							String runningtime,	String movieopen,
							String moviedate, String moviecontent,
							String moviedirector, String casting,
							String moviegrade, String gradefname,
							String moviefname, String trailerfname);

	public ArrayList<MovieDTO> movietitlesearch(String svalue);

	public ArrayList<MovieDTO> moviegenresearch(String svalue);

	public MovieDTO detailmovie(int number);

	public ArrayList<ActorDTO> detailcasting(int number);

	public ArrayList<MovieDTO> homeout();

	public ArrayList<MovieDTO> usermovielist(String open);

	public ArrayList<MovieDTO> usermovielistnoopen(String noopen);

	public ArrayList<MovieDTO> usermovielistreopen(String reopen);

	public ArrayList<MovieDTO> openmovieall(String aa);

	public ArrayList<ReplyDTO> replyout(int number);

	public MovieDTO searchviewmovie(int number);


}
