package com.mbc.admin.schedule;

import java.util.ArrayList;

public interface ScheduleService {

	void scheduleinsert(int movienum, String schedule_num, String screening_date, String screening_time,
			String screening_theater);

	ArrayList<ScheduleDTO> outschedule();

	ArrayList<ScheduleDTO> updateschedule(int number);

	void updateschedule2(int movienum, int schedule_num, String screening_date, String screening_time,
			String screening_theater);

	ArrayList<ScheduleDTO> deleteschedule(int number);

	void deleteschedule2(int schedule_num);

}
