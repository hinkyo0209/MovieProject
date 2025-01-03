package com.mbc.admin;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbc.admin.movie.MovieDTO;
import com.mbc.admin.movie.MovieService;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/")
	public String home(Model mo) {
		MovieService ms = sqlSession.getMapper(MovieService.class);
		ArrayList<MovieDTO>list = ms.homeout();
		mo.addAttribute("list", list);
		
		return "usermain";
	}
	@RequestMapping(value = "/adminmain")
	public String home2(Model mo) {
		MovieService ms = sqlSession.getMapper(MovieService.class);
		ArrayList<MovieDTO>list = ms.homeout();
		mo.addAttribute("list", list);
		
		return "adminmain";
	}
	
}
