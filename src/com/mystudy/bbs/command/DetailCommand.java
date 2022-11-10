package com.mystudy.bbs.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.vo.BbsVO;

public class DetailCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("boardNum");
		String title = request.getParameter("title");
		String path;
		BbsVO vo = new BbsVO();
		System.out.println("디테일커멘드 실행");
		if(num.equalsIgnoreCase("공지")){
			vo = DAO.newsSelectOne2(title);
		} else {
			vo = DAO.newsSelectOne(num);
		}
			 
			//1. DB데이터 조회
			
			
			//2. 뷰에서 사용할 수 있도록 데이터 저장
			request.setAttribute("vo", vo);
			
			//페이지 전환 : searchList.jsp 페이지로 이동
			//request.getRequestDispatcher("searchList.jsp").forward(request, response);
			path = "01detail.jsp";
			
		
		
		return path;
	}

}
