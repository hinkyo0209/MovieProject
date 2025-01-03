package com.mbc.admin.actor;

import java.util.ArrayList;

public interface ActorService {

	void actorinsert(int movienum,String actor, String fname, String actortv1, String actortv2, String actortv3);

	ArrayList<ActorDTO> actorout();

	ArrayList<ActorDTO> update(int num);

	void update2(int movienum,int num, String actor, String fname, String actortv1, String actortv2, String actortv3);

}
