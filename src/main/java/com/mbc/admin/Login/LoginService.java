package com.mbc.admin.Login;


public interface LoginService {

	LoginDTO logincheck(String id, String pw);

	LoginDTO mypageinput(String id);

	void myupdate(String pw);

	LoginDTO admincheck(String id);
	

}
