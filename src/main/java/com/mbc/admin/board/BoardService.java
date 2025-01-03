package com.mbc.admin.board;

import java.util.ArrayList;

public interface BoardService {


	ArrayList<BoardDTO> boardout();

	BoardDTO detail(int num);

	void readup(int num);

	public int total();
    public ArrayList<BoardDTO> page(PageDTO dto);

	void insert(String boardwriter, String boardtitle, String boardcontent);

}
