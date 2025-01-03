package com.mbc.admin.ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbc.admin.Login.LoginDTO;
import com.mbc.admin.movie.MovieDTO;
import com.mbc.admin.schedule.ScheduleDTO;



@Controller
public class TicketController {
   @Autowired
   SqlSession sqlsession;
   
   //01. �󿵽ð�
   @RequestMapping(value = "/step1in", method = RequestMethod.GET)
   public String step1(Model mo, HttpServletRequest request) {
      TicketService ts = sqlsession.getMapper(TicketService.class);
      ArrayList<MovieDTO>mlist = ts.moviestep1();
      ArrayList<ScheduleDTO>slist = ts.schedulestep1();
      mo.addAttribute("mlist",mlist);
      mo.addAttribute("slist",slist);
      return "step1";
   }
   
   //02. �ο�/�¼�
   @RequestMapping(value = "/step2", method = RequestMethod.GET)
   public String step2(Model mo, HttpServletRequest request, HttpServletResponse response) throws IOException {
      int movie_num = Integer.parseInt(request.getParameter("movie_num"));
      String schedule_num = request.getParameter("schedule_num");
      HttpSession hs=request.getSession();
     Boolean yy=(Boolean)hs.getAttribute("loginState");
      if(yy !=null && yy) 
      {   
         TicketService ts = sqlsession.getMapper(TicketService.class);
         MovieDTO mItem = ts.moviestep2(movie_num);
         ScheduleDTO sItem = ts.schedulestep2(schedule_num);
         mo.addAttribute("mItem",mItem);
         mo.addAttribute("sItem",sItem);
         return "step2";
      }
     else 
      {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter pww=response.getWriter();
        pww.print("<script> alert('�α��� �� �̿����ּ���');</script>");
        pww.print("<script> location.href='login';</script>");
        pww.flush();
        return "redirect:login";
      }
   }

   
   @RequestMapping(value = "/step3", method = RequestMethod.GET)
   public String step3(Model mo, HttpServletRequest request) {
       // ��û �Ķ���Ϳ��� ������ ����
       String selected_seats = request.getParameter("selectedSeats");
       System.out.println("Controller_selected_seats: " + selected_seats); //�α� ���
       
       // �����ϰ� adultCount ��������
       String adultCountParam = request.getParameter("adultCount");
       int adult_count = (adultCountParam != null && !adultCountParam.isEmpty()) ? Integer.parseInt(adultCountParam) : 0;
       System.out.println("Controller_adult_count: " + adult_count); //�α� ���
       
       // ������ �ο� �� �Ķ���͵� �����ϰ� ��������
       String minorCountParam = request.getParameter("minorCount");
       int minor_count = (minorCountParam != null && !minorCountParam.isEmpty()) ? Integer.parseInt(minorCountParam) : 0;
       System.out.println("Controller_minor_count: " + minor_count); //�α� ���
       
       String elderlyCountParam = request.getParameter("elderlyCount");
       int elderly_count = (elderlyCountParam != null && !elderlyCountParam.isEmpty()) ? Integer.parseInt(elderlyCountParam) : 0;
       System.out.println("Controller_elderly_count: " + elderly_count); //�α� ���
       
       String disabledCountParam = request.getParameter("disabledCount");
       int disabled_count = (disabledCountParam != null && !disabledCountParam.isEmpty()) ? Integer.parseInt(disabledCountParam) : 0;
       System.out.println("Controller_disabled_count: " + disabled_count); //�α� ���
       
       String movie_cover = request.getParameter("movieCover");
       String grade_image = request.getParameter("gradeImage");
       String movie_title = request.getParameter("movieTitle");
       String screening_theater = request.getParameter("screeningTheater");
       String screening_date = request.getParameter("screeningDate");
       String screening_time = request.getParameter("screeningTime");
       
       // ���ǿ��� ����� ���� ��������
       HttpSession session = request.getSession();
       LoginDTO member = (LoginDTO) session.getAttribute("member");       
       
       // �𵨿� ������ �߰�
       mo.addAttribute("selected_seats", selected_seats);
       mo.addAttribute("adult_count", adult_count);
       mo.addAttribute("minor_count", minor_count);
       mo.addAttribute("elderly_count", elderly_count);
       mo.addAttribute("disabled_count", disabled_count);
       mo.addAttribute("movie_cover", movie_cover);
       mo.addAttribute("grade_image", grade_image);
       mo.addAttribute("movie_title", movie_title);
       mo.addAttribute("screening_theater", screening_theater);
       mo.addAttribute("screening_date", screening_date);
       mo.addAttribute("screening_time", screening_time);
       
       //�α����� ����� �̸� �߰�
       mo.addAttribute("reserved_name", member.getName());
       mo.addAttribute("user_id", member.getId());

       // step3.jsp�� �̵�
       return "step3"; 
   }
   

   @RequestMapping(value = "/step4", method = RequestMethod.GET)
   public String step4(Model model, HttpServletRequest request) {
       // ��û �Ķ���� ����
       String movie_title = request.getParameter("movie_title");
       String movie_cover = request.getParameter("movie_cover");
       String screening_date = request.getParameter("screening_date");
       String screening_time = request.getParameter("screening_time");
       String screening_theater = request.getParameter("screening_theater");
       String selected_seats = request.getParameter("selected_seats");
       int adult_count = Integer.parseInt(request.getParameter("adult_count"));
       int minor_count = Integer.parseInt(request.getParameter("minor_count"));
       int elderly_count = Integer.parseInt(request.getParameter("elderly_count"));
       int disabled_count = Integer.parseInt(request.getParameter("disabled_count"));
       String reserved_name = request.getParameter("reserved_name");
       
       String ticket_number = generateTicketNumber(movie_title); //Ƽ�Ϲ�ȣ ���� ����
       
       String user_id = request.getParameter("user_id");
       
       
       TicketService ts = sqlsession.getMapper(TicketService.class);
       ts.insertticket(movie_title,
                      movie_cover,
                      screening_date,
                      screening_time,
                      screening_theater,
                      selected_seats,
                      adult_count,
                      minor_count,
                      elderly_count,
                      disabled_count,
                      reserved_name,
                      ticket_number,
                      user_id
                      );   
   
//       // ��� �𵨿� �߰�
//       model.addAttribute("movie_title", movie_title);
//       model.addAttribute("selected_seats", selected_seats);
//       model.addAttribute("adult_count", adult_count);
//       model.addAttribute("minor_count", minor_count);
//       model.addAttribute("elderly_count", elderly_count);
//       model.addAttribute("disabled_count", disabled_count);
   
       return "redirect:/myticket"; // ��� �������� �̵�
   }
   
   //Ƽ�Ϲ�ȣ ���� �޼ҵ�
   private String generateTicketNumber(String movie_title) {
      //A���� Z������ ���� ���ĺ� ������ ���� ��¥�� ����
      char randomChar1 = (char)('A' + Math.random() *26); //A(65)���� Z(90)������ ASCII �ڵ� ���
      String datePart = new SimpleDateFormat("yyyyMMdd").format(new Date()); //���糯¥ YYYYMMDD ����
      char randomChar2 = (char)('A' + Math.random() *26); //A(65)���� Z(90)������ ASCII �ڵ� ���
      
      //���� ���� ����(0-999 ����)
      int randomNumber = (int)(Math.random() * 1000); //0���� 999������ ��������
      String formattedRandomNumber = String.format("%03d", randomNumber); //3�ڸ� ���ڷ� ���˵�
      
      //���� Ƽ�Ϲ�ȣ ����
      return randomChar1 + datePart + randomChar2 + formattedRandomNumber; //��: A20231024W0123
   }

   @RequestMapping(value = "/ticketout")
      public String step4out1(Model mo) {
         TicketService ts = sqlsession.getMapper(TicketService.class);
         ArrayList<TicketDTO>tlist = ts.outticket();
         mo.addAttribute("tlist", tlist);
         
         
         return "ticketout";
      }

   @RequestMapping(value = "/myticket")
      public String step5(Model mo,HttpServletRequest request, HttpServletResponse response) throws IOException {
         
         HttpSession session=request.getSession();
         Boolean loginTicket=(Boolean)session.getAttribute("loginState");
         if(loginTicket !=null && loginTicket)
         {
            LoginDTO member=(LoginDTO)session.getAttribute("member");
            TicketService ts = sqlsession.getMapper(TicketService.class);
            ArrayList<TicketDTO>tlist = ts.myticket(member.getId());
            mo.addAttribute("tlist", tlist);
            mo.addAttribute("dto", member);
            return "myticketcheck";
         }
         else
         {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter pww=response.getWriter();
            pww.print("<script> alert('�α��� �� �̿����ּ���.');</script>");
            pww.print("<script> location.href='login';</script>");
            pww.flush();
            return "redirect:login";
         }
         
   }
   
   @RequestMapping(value = "/deleteticket")
   public String step6(HttpServletRequest request) {
      String num = request.getParameter("num");
         TicketService ts = sqlsession.getMapper(TicketService.class);
         ts.delete(num);
      
         return "redirect:./";
   }
      
         


}
