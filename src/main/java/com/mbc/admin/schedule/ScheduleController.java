package com.mbc.admin.schedule;

import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/schedulein")
	public String schedule1() {
		
		return "scheduleinput";
	}
	@RequestMapping(value = "schedulesave")
	public String schedule2(HttpServletRequest request) {
		int movienum = Integer.parseInt(request.getParameter("movienum"));
		String schedule_num = request.getParameter("schedule_num");
		String screening_date = request.getParameter("screening_date");
		String screening_time = request.getParameter("screening_time");
		String screening_theater = request.getParameter("screening_theater");
		ScheduleService ss = sqlsession.getMapper(ScheduleService.class);
		ss.scheduleinsert(movienum,schedule_num,screening_date,screening_time,screening_theater);
		
		return "redirect:/";
	}
	@RequestMapping(value = "scheduleout")
	public String schedule3(Model mo) {
		ScheduleService ss = sqlsession.getMapper(ScheduleService.class);
		ArrayList<ScheduleDTO>list = ss.outschedule();
		mo.addAttribute("list",list);
		
		return "scheduleout";
	}
	@RequestMapping(value = "/scheduleupdate")
	public String schedule4(HttpServletRequest request,Model mo) {
		int number = Integer.parseInt(request.getParameter("number"));
		ScheduleService ss = sqlsession.getMapper(ScheduleService.class);
		ArrayList<ScheduleDTO>list = ss.updateschedule(number);
		mo.addAttribute("list",list);
		
		return "updateview_schedule";
	}
	@RequestMapping(value = "scheduleupdate2")
	public String schedule5(HttpServletRequest request) {
		int movienum = Integer.parseInt(request.getParameter("movienum"));
		int schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
		String screening_date = request.getParameter("screening_date");
		String screening_time = request.getParameter("screening_time");
		String screening_theater = request.getParameter("screening_theater");
		ScheduleService ss = sqlsession.getMapper(ScheduleService.class);
		ss.updateschedule2(movienum,schedule_num,screening_date,screening_time,screening_theater);
		
		
		return "redirect:/scheduleout";
	}
	@RequestMapping(value = "scheduledelete")
	public String schedule6(Model mo,HttpServletRequest request) {
		int number = Integer.parseInt(request.getParameter("number"));
		ScheduleService ss = sqlsession.getMapper(ScheduleService.class);
		ArrayList<ScheduleDTO>list = ss.deleteschedule(number);
		mo.addAttribute("list",list);
		
		return "deleteview_schedule";
	}
	@RequestMapping(value = "scheduledelete2")
	public String schedule7(Model mo,HttpServletRequest request) {
		int schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
		ScheduleService ss = sqlsession.getMapper(ScheduleService.class);
		 ss.deleteschedule2(schedule_num);
		
		return "redirect:/scheduleout";
	}
	
}
