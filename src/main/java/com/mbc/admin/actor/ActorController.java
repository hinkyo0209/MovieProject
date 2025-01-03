package com.mbc.admin.actor;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ActorController {
	@Autowired
	SqlSession sqlSession;
	
	String path="C:\\mbc6\\spring\\teamproject_movie\\src\\main\\webapp\\actorimage";
	
	@RequestMapping(value = "/actorin")
	public String actor() {
		
		return "actorinput";
	}
	@RequestMapping(value = "/actorinsave")
	public String actor1(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int movienum = Integer.parseInt(mul.getParameter("movienum"));
		String actor = mul.getParameter("actor");
		MultipartFile mf = mul.getFile("actorimage");
		String fname=mf.getOriginalFilename();
		String actortv1 = mul.getParameter("actortv1");
		String actortv2 = mul.getParameter("actortv2");
		String actortv3 = mul.getParameter("actortv3");
		ActorService as = sqlSession.getMapper(ActorService.class);
		mf.transferTo(new File(path+"\\"+fname));
		as.actorinsert(movienum,actor, fname, actortv1, actortv2, actortv3);
		
		
		return "redirect:/";
	}
	@RequestMapping(value = "/actorout")
	public String actor2(Model mo) {
		ActorService as = sqlSession.getMapper(ActorService.class);
		ArrayList<ActorDTO>list= as.actorout();
		mo.addAttribute("list", list);
		
		return "actorout";
	}
	@RequestMapping(value = "/update")
	public String actor3(HttpServletRequest request, Model mo) {
		int num = Integer.parseInt(request.getParameter("num"));
		ActorService as = sqlSession.getMapper(ActorService.class);
		ArrayList<ActorDTO>list = as.update(num);
		mo.addAttribute("list", list);
		
		return "actorupdateview";
	}
	@RequestMapping(value = "/update2")
	public String actor4(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int movienum = Integer.parseInt(mul.getParameter("movienum"));
		int num = Integer.parseInt(mul.getParameter("actornum"));
		String actor = mul.getParameter("actor");
		MultipartFile mf = mul.getFile("actorimage");
		String fname = mf.getOriginalFilename();
		String actortv1 = mul.getParameter("actortv1");
		String actortv2 = mul.getParameter("actortv2");
		String actortv3 = mul.getParameter("actortv3");
		ActorService as = sqlSession.getMapper(ActorService.class);
		mf.transferTo(new File(path+"\\"+fname));
		as.update2(movienum,num, actor, fname, actortv1, actortv2, actortv3);
		
		return "redirect:actorout";
	}

}
