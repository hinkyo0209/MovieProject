package com.mbc.admin.ticket;

public class TicketDTO {
   int ticketnum;
   String movie_title,
         movie_cover,
         screening_date,
         screening_time,
         screening_theater,
         selected_seats;
   int adult_count,
       minor_count,
       elderly_count,
       disabled_count;
   String reservation_date;
   String reserved_name;
   String ticket_number;
   String user_id;
   
   public TicketDTO() {
      super();
      // TODO Auto-generated constructor stub
   }

   public TicketDTO(int ticketnum, String movie_title, String movie_cover, String screening_date,
         String screening_time, String screening_theater, String selected_seats, int adult_count, int minor_count,
         int elderly_count, int disabled_count, String reservation_date, String reserved_name, String ticket_number,
         String user_id) {
      super();
      this.ticketnum = ticketnum;
      this.movie_title = movie_title;
      this.movie_cover = movie_cover;
      this.screening_date = screening_date;
      this.screening_time = screening_time;
      this.screening_theater = screening_theater;
      this.selected_seats = selected_seats;
      this.adult_count = adult_count;
      this.minor_count = minor_count;
      this.elderly_count = elderly_count;
      this.disabled_count = disabled_count;
      this.reservation_date = reservation_date;
      this.reserved_name = reserved_name;
      this.ticket_number = ticket_number;
      this.user_id = user_id;
   }

   public int getTicketnum() {
      return ticketnum;
   }

   public void setTicketnum(int ticketnum) {
      this.ticketnum = ticketnum;
   }

   public String getMovie_title() {
      return movie_title;
   }

   public void setMovie_title(String movie_title) {
      this.movie_title = movie_title;
   }

   public String getMovie_cover() {
      return movie_cover;
   }

   public void setMovie_cover(String movie_cover) {
      this.movie_cover = movie_cover;
   }

   public String getScreening_date() {
      return screening_date;
   }

   public void setScreening_date(String screening_date) {
      this.screening_date = screening_date;
   }

   public String getScreening_time() {
      return screening_time;
   }

   public void setScreening_time(String screening_time) {
      this.screening_time = screening_time;
   }

   public String getScreening_theater() {
      return screening_theater;
   }

   public void setScreening_theater(String screening_theater) {
      this.screening_theater = screening_theater;
   }

   public String getSelected_seats() {
      return selected_seats;
   }

   public void setSelected_seats(String selected_seats) {
      this.selected_seats = selected_seats;
   }

   public int getAdult_count() {
      return adult_count;
   }

   public void setAdult_count(int adult_count) {
      this.adult_count = adult_count;
   }

   public int getMinor_count() {
      return minor_count;
   }

   public void setMinor_count(int minor_count) {
      this.minor_count = minor_count;
   }

   public int getElderly_count() {
      return elderly_count;
   }

   public void setElderly_count(int elderly_count) {
      this.elderly_count = elderly_count;
   }

   public int getDisabled_count() {
      return disabled_count;
   }

   public void setDisabled_count(int disabled_count) {
      this.disabled_count = disabled_count;
   }

   public String getReservation_date() {
      return reservation_date;
   }

   public void setReservation_date(String reservation_date) {
      this.reservation_date = reservation_date;
   }

   public String getReserved_name() {
      return reserved_name;
   }

   public void setReserved_name(String reserved_name) {
      this.reserved_name = reserved_name;
   }

   public String getTicket_number() {
      return ticket_number;
   }

   public void setTicket_number(String ticket_number) {
      this.ticket_number = ticket_number;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   
}
