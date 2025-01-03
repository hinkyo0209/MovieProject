package com.mbc.admin.movie;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbc.admin.actor.ActorDTO;
import com.mbc.admin.reply.ReplyDTO;

@Controller
public class MovieController {

	String path="C:\\mbc6\\spring\\teamproject_movie\\src\\main\\webapp\\image"; //이미지 경로
	String path2="C:\\mbc6\\spring\\teamproject_movie\\src\\main\\webapp\\image2";
	String path3="C:\\mbc6\\spring\\teamproject_movie\\src\\main\\webapp\\image3";
	
	@Autowired
	SqlSession sqlsession; // Service의 sqlsession 객체
	
	
	@RequestMapping(value = "/moviein")
	public String movie1() {
		
		return "movieinput";
	}
	
	@RequestMapping(value = "/moviesave", method = RequestMethod.POST)
	public String movie2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String movietitle = mul.getParameter("movietitle"); //1.영화제목
		String moviegenre = mul.getParameter("moviegenre"); //2.장르
		String country = mul.getParameter("country"); //3.나라
		String runningtime = mul.getParameter("runningtime");//4.러닝타임
		String movieopen = mul.getParameter("movieopen");//5.개봉여부
		
		String moviedate = mul.getParameter("moviedate");//6.개봉일자
		String moviecontent = mul.getParameter("moviecontent");//7.줄거리
		String moviedirector = mul.getParameter("moviedirector");//8.감독
		String casting = mul.getParameter("casting");//9.출연진
		String moviegrade = mul.getParameter("moviegrade");//10.등급
		
		MultipartFile gradefm = mul.getFile("gradeimage");
		String gradefname = gradefm.getOriginalFilename();
		gradefm.transferTo(new File(path+"\\"+gradefname)); //11.등급이미지
		
		MultipartFile moviefm = mul.getFile("moviecover");
		String moviefname = moviefm.getOriginalFilename();
		moviefm.transferTo(new File(path2+"\\"+moviefname)); //12.표지
		
		MultipartFile trailerfm = mul.getFile("trailer");
		String trailerfname = trailerfm.getOriginalFilename();
		trailerfm.transferTo(new File(path3+"\\"+trailerfname)); //13.예고편
		
		MovieService ms = sqlsession.getMapper(MovieService.class);
		ms.insertmovie(movietitle,moviegenre,
						country,runningtime,
						movieopen,moviedate,
						moviecontent,moviedirector,
						casting,moviegrade,
						gradefname,moviefname,
						trailerfname);
		
		
		return "redirect:/";
	}
	@RequestMapping(value = "/movieout")
	public String movie3(Model mo) {
		MovieService ms = sqlsession.getMapper(MovieService.class);
		ArrayList<MovieDTO>list = ms.outmovie();
		mo.addAttribute("list",list);
		
		return "movieout";
	}
	@RequestMapping(value = "/moviedetail")
	public String movie4(Model mo,HttpServletRequest request) {
		int number = Integer.parseInt(request.getParameter("number"));
		MovieService ms = sqlsession.getMapper(MovieService.class);
		MovieDTO dto = ms.detailmovie(number);
		ArrayList<ReplyDTO>list = ms.replyout(number);
		mo.addAttribute("list",list);
		mo.addAttribute("dto",dto);
		
		return "moviedetail";
	}
	@RequestMapping(value = "/castingdetail")
	public String movie5(Model mo,HttpServletRequest request) {
		
		int number = Integer.parseInt(request.getParameter("number"));
		
		MovieService ms = sqlsession.getMapper(MovieService.class);
		MovieDTO dto = ms.detailmovie(number);
		ArrayList<ActorDTO>list = ms.detailcasting(number);
		//System.out.print(" 사이즈: "+list.size());
		mo.addAttribute("dto",dto);
		mo.addAttribute("list",list);

		return "castingdetail";
	}
	
	@RequestMapping(value = "/moviedelete")
	public String movie6(Model mo, HttpServletRequest request) {
		int number = Integer.parseInt(request.getParameter("number"));
		MovieService ms = sqlsession.getMapper(MovieService.class);
		ArrayList<MovieDTO>list = ms.deletemovie(number);
		mo.addAttribute("list",list);
		
		return "deleteview_movie";
	}
	@RequestMapping(value = "/moviedelete2")
	public String movie7(Model mo, HttpServletRequest request) {
		int number = Integer.parseInt(request.getParameter("movienum"));
		MovieService ms = sqlsession.getMapper(MovieService.class);
		ms.deletemovie2(number);
		
		return "redirect:/movieout";
	}
	@RequestMapping(value = "/movieupdate")
	public String movie8(Model mo, HttpServletRequest request) {
		int number = Integer.parseInt(request.getParameter("number"));
		MovieService ms = sqlsession.getMapper(MovieService.class);
		ArrayList<MovieDTO>list = ms.updatemovie(number);
		mo.addAttribute("list",list);
		
		return "updateview_movie";
	}
	@RequestMapping(value = "/movieupdate2")
	public String movie9(Model mo, MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int movienum = Integer.parseInt(mul.getParameter("movienum"));
		String movietitle = mul.getParameter("movietitle"); //1.영화제목
		String moviegenre = mul.getParameter("moviegenre"); //2.장르
		String country = mul.getParameter("country"); //3.나라
		String runningtime = mul.getParameter("runningtime");//4.러닝타임
		String movieopen = mul.getParameter("movieopen");//5.개봉여부
		
		String moviedate = mul.getParameter("moviedate");//6.개봉일자
		String moviecontent = mul.getParameter("moviecontent");//7.줄거리
		String moviedirector = mul.getParameter("moviedirector");//8.감독
		String casting = mul.getParameter("casting");//9.출연진
		String moviegrade = mul.getParameter("moviegrade");//10.등급
		
		MultipartFile gradefm = mul.getFile("gradeimage");
		String gradefname = gradefm.getOriginalFilename();
		gradefm.transferTo(new File(path+"\\"+gradefname)); //11.등급이미지
		
		MultipartFile moviefm = mul.getFile("moviecover");
		String moviefname = moviefm.getOriginalFilename();
		moviefm.transferTo(new File(path2+"\\"+moviefname)); //12.표지
		
		MultipartFile trailerfm = mul.getFile("trailer");
		String trailerfname = trailerfm.getOriginalFilename();
		trailerfm.transferTo(new File(path3+"\\"+trailerfname)); //13.예고편
		
		MovieService ms = sqlsession.getMapper(MovieService.class);
		ms.updatemovie2(movienum,movietitle,
						moviegenre,country,
						runningtime,movieopen,
						moviedate,moviecontent,
						moviedirector,casting,
						moviegrade,gradefname,
						moviefname,trailerfname);
		
		
		return "redirect:/movieout";
	}
	@RequestMapping(value = "/searchview_movie")
    public String movie10(Model mo,HttpServletRequest request) {
       int number = Integer.parseInt(request.getParameter("number"));
       MovieService ms = sqlsession.getMapper(MovieService.class);
       MovieDTO dto = ms.searchviewmovie(number);
       mo.addAttribute("dto",dto);
       
       return "searchview_movie";
    }
	@RequestMapping(value = "/searchsave")
	public String movie11(HttpServletRequest request,Model mo) {
		String key=request.getParameter("key");
		String svalue=request.getParameter("svalue");
		MovieService ms = sqlsession.getMapper(MovieService.class);
		
		ArrayList<MovieDTO>list;
		if(key.equals("movietitle")) {
			list=ms.movietitlesearch(svalue);
		}
		else {
			list=ms.moviegenresearch(svalue);
		}
		mo.addAttribute("list",list);
		
		return "searchview_movie";
	}
	
	@RequestMapping(value = "/usermovie")
	public String movie11(Model mo, HttpServletRequest request) {
		String open="현재상영영화";
		String noopen="개봉예정영화";
		String reopen="재개봉";
		MovieService ms = sqlsession.getMapper(MovieService.class);
		ArrayList<MovieDTO>list = ms.usermovielist(open);
		ArrayList<MovieDTO>list1 = ms.usermovielistnoopen(noopen);
		ArrayList<MovieDTO>list2 = ms.usermovielistreopen(reopen);
		mo.addAttribute("open", list);
		mo.addAttribute("noopen", list1);
		mo.addAttribute("reopen", list2);
		
		return "usermovie";
	}
	@RequestMapping(value = "/openmovieall")
	public String movie1(Model mo, HttpServletRequest request) {
		int name = Integer.parseInt(request.getParameter("btn"));
		System.out.println(name);
		if(name==1) {
			String aa= "현재상영영화";
			MovieService ms = sqlsession.getMapper(MovieService.class);
			ArrayList<MovieDTO>list = ms.openmovieall(aa);
			mo.addAttribute("list",list);
			
			return "openmovieall";
		}
		else if(name==2) {
			String aa = "개봉예정영화";
			MovieService ms = sqlsession.getMapper(MovieService.class);
			ArrayList<MovieDTO>list = ms.openmovieall(aa);
			mo.addAttribute("list",list);
			
			return "openmovieall";
		}
		else if(name==3) {
			String aa = "재개봉";
			MovieService ms = sqlsession.getMapper(MovieService.class);
			ArrayList<MovieDTO>list = ms.openmovieall(aa);
			mo.addAttribute("list",list);
			
			return "openmovieall";
		}
		else {
			String aa = "현재상영영화";
			MovieService ms = sqlsession.getMapper(MovieService.class);
			ArrayList<MovieDTO>list = ms.openmovieall(aa);
			mo.addAttribute("list",list);
			
			return "openmovieall";
		}
		
	}
	
	
}

