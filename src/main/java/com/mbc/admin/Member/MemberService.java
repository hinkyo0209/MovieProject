package com.mbc.admin.Member;

import java.util.ArrayList;

public interface MemberService {

	void inserta(String name, String id, String pw, String phone, String address, String email, String domain, String birthdate,
			String sb, String question, String reception, String conditions, int num);

	ArrayList<MemberDTO> outm();

	int idcheck(String id);


	ArrayList<MemberDTO> select(String id);

	void update2(String id, String name, String pw, String phone, String address);

	void mydelete(String id);

}
