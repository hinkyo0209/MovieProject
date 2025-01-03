package com.mbc.admin.Member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value = "/member")
	public String login1() {
		return "memberinput";
	}
	@RequestMapping(value = "/membersave" , method = RequestMethod.POST)
	public String login2(HttpServletRequest request) {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String domain = request.getParameter("domain");
		String birthdate = request.getParameter("birthdate");
		String sb =  request.getParameter("sb");
		String question = request.getParameter("question");
		String reception = request.getParameter("reception");
		String conditions = request.getParameter("conditions");
		int num = Integer.parseInt(request.getParameter("num"));
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.inserta(name,id,pw,phone,address,email,domain,birthdate,sb,question,reception,conditions,num);
		return "redirect:/";
	}
	@RequestMapping(value = "/memberout1")
	public String login3(Model mo) {
		MemberService ms = sqlsession.getMapper(MemberService.class);
	    ArrayList<MemberDTO>list=ms.outm();
	    mo.addAttribute("list", list);
		return "memberout";
	}
	@ResponseBody
	@RequestMapping(value = "/idcheck1")
	public String login4(String id) {
		MemberService ms = sqlsession.getMapper(MemberService.class);
	    int count = ms.idcheck(id); 
	    if(count==0)
	    	return "ok";
	    else 
	    	return "no";	       
	}
	@RequestMapping(value = "/myup" , method = RequestMethod.GET)
	public String login3(HttpServletRequest request ,Model mo) {
		String id = request.getParameter("id");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ArrayList<MemberDTO>list = ms.select(id);
		mo.addAttribute("list", list);
		return "myupdate1";		
	 }
	@RequestMapping(value = "/update2" , method = RequestMethod.POST)
	public String login4(HttpServletRequest request ,Model mo) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.update2(id, name, pw, phone, address);
		
		return "redirect:/mypage";		
	 }
	
	@RequestMapping(value = "/mydelete" , method = RequestMethod.GET)
	   public String login5(HttpServletRequest request) {
	      String id = request.getParameter("num");
	      MemberService ms = sqlsession.getMapper(MemberService.class);
	      ms.mydelete(id);
	      HttpSession hs = request.getSession();
	      hs.setAttribute("loginState", false);
	      hs.removeAttribute("dto");
	      return "redirect:./";      
	    }
	
	}
