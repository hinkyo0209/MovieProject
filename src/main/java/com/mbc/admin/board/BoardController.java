package com.mbc.admin.board;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@Autowired
	SqlSession sqlSession;

//	@RequestMapping(value = "/boardgo")
//	public String board1(Model mo) {
//		BoardService bs = sqlSession.getMapper(BoardService.class);
//		ArrayList<BoardDTO>list = bs.boardout();
//		mo.addAttribute("list", list);
//		return "boardview";
//	}
	
	@RequestMapping(value="/boardgo")
    public String ko16(HttpServletRequest request, PageDTO dto,Model mo) {
       String nowPage=request.getParameter("nowPage");
       String cntPerPage=request.getParameter("cntPerPage");
       BoardService bs = sqlSession.getMapper(BoardService.class);
       //  ü   ڵ     ϱ 
       int total=bs.total();
       if(nowPage==null && cntPerPage == null) {
          nowPage="1";
          cntPerPage="10";
       }
       else if(nowPage==null) {
          nowPage="1";
       }
       else if(cntPerPage==null) {
          cntPerPage="10";
       }      
       dto=new PageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
       mo.addAttribute("paging",dto);
       mo.addAttribute("list",bs.page(dto));
       return "boardview";
	}
	@RequestMapping(value = "/boardin")
	public String board2() {
		return "boardinput";
	}
	
	@RequestMapping(value = "/boardsave")
	public String board3(HttpServletRequest request) {
		String boardwriter = request.getParameter("boardwriter");
		String boardtitle = request.getParameter("boardtitle");
		String boardcontent = request.getParameter("boardcontent");
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.insert(boardwriter, boardtitle, boardcontent);
		
		return "redirect:/boardgo";
	}
	@RequestMapping(value = "/detail")
	public String board4(Model mo, HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardService bs = sqlSession.getMapper(BoardService.class);
		BoardDTO dto = bs.detail(num);
		bs.readup(num);
		mo.addAttribute("dto", dto);
		return "boarddetail";
		}
	
	}
