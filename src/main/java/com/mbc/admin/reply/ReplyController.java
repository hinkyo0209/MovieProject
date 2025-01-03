package com.mbc.admin.reply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ReplyController {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value = "/replyin")
	public String reply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ReplyService rs = sqlsession.getMapper(ReplyService.class);
		HttpSession hs = request.getSession();
		Boolean yy =(Boolean)hs.getAttribute("loginState");
		if(yy !=null && yy) {
			int movienum = Integer.parseInt(request.getParameter("movienum"));
			String replywriter = request.getParameter("replywriter");
			String replycontent = request.getParameter("replycontent");
			int star = Integer.parseInt(request.getParameter("star"));
			
			rs.replyinsert(movienum, replywriter, replycontent, star);
			
			return "redirect:./";
		}
		else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pww=response.getWriter();
			pww.print("<script> alert('로그인 후 이용해주세요');</script>");
			pww.print("<script> location.href='login';</script>");
			pww.flush();
			
			return "redirect:login";
		}
		
	}
}
