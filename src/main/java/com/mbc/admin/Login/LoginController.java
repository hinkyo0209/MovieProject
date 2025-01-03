package com.mbc.admin.Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.System.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbc.admin.Member.MemberDTO;
import com.mbc.admin.Member.MemberService;

@Controller
public class LoginController {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/logincheck" , method = RequestMethod.POST)
	public String loginChek(HttpServletRequest request , HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		LoginService ls = sqlsession.getMapper(LoginService.class);
		LoginDTO dto = ls.logincheck(id,pw);
		LoginDTO num = ls.admincheck(id);
		String npath="";
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				HttpSession hs = request.getSession();
				if(!(dto==null)) {
					if(num.getNum()==0) {
						hs.setAttribute("loginState",true);
						hs.setAttribute("member",dto);
						hs.setMaxInactiveInterval(1500);
						npath="redirect:adminmain";
					}
					else {
						hs.setAttribute("loginState",true);
						hs.setAttribute("member",dto);
						hs.setMaxInactiveInterval(1500);
						npath="redirect:./";
					}
				}
				else {
					out.print("<script>alert('아이디 또는 비밀번호가 잘못입력되었습니다.');history.go(-1);</script>");
					out.flush();
				}
			} catch (IOException e) {
			}
			return npath;		
			}
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.setAttribute("loginState", false);
		hs.removeAttribute("dto");
		return "redirect:./";	
	}
	//@RequestMapping(value = "/mypage")
	//public String mypage1() {
		//return "mypageinput";
	//}
	@RequestMapping(value = "/mypage")
	public String login2(HttpServletRequest request,Model mo,HttpServletResponse response) throws IOException {
		HttpSession hs=request.getSession();
		Boolean yy=(Boolean)hs.getAttribute("loginState");
		if(yy !=null && yy) 
		{	
			LoginDTO dto=(LoginDTO)hs.getAttribute("member");
			LoginService ls=sqlsession.getMapper(LoginService.class);
			LoginDTO dto1=ls.mypageinput(dto.getId());		
			mo.addAttribute("dto", dto1);
			return "mypageinput";
		}
		else 
		{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pww=response.getWriter();
			pww.print("<script> alert('로그인 후 이용해주세요');</script>");
			pww.print("<script> location.href='login';</script>");
			pww.flush();
			return "redirect:login";
		}
		
		}
	
}
