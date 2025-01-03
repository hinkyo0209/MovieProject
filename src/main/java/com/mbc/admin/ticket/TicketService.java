package com.mbc.admin.ticket;

import java.util.ArrayList;

import com.mbc.admin.movie.MovieDTO;
import com.mbc.admin.schedule.ScheduleDTO;

public interface TicketService {

   ArrayList<MovieDTO> moviestep1(); //(int number)

   ArrayList<ScheduleDTO> schedulestep1(); //(int number)

   MovieDTO moviestep2(int movie_num);

   ScheduleDTO schedulestep2(String schedule_num);

   MovieDTO moviestep3(int movie_num);

   ScheduleDTO schedulestep3(String schedule_num);

   void insertticket(String movie_title, String movie_cover,
                 String screening_date, String screening_time,
                 String screening_theater, String selected_seats,
                 int adult_count, int minor_count,
                 int elderly_count, int disabled_count,
                 String reserved_name, String ticket_number,
                 String user_id);

   ArrayList<TicketDTO> outticket();

   ArrayList<TicketDTO> myticket(String user_id);

   void delete(String num);


}
