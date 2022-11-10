package com.mystudy.bbs.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.vo.BbsVO;

public class NewsSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		System.out.println("> keyword : -" + keyword + "-");
		
		//단순 페이지 전환인지 DB데이터 조회처리를 해야하는지 결정
		String path;
		if (keyword == null || keyword.equals("")) {
			System.out.println("::: newsMain.jsp 페이지로 이동");
			
			//request.getRequestDispatcher("search.jsp").forward(request, response);
			path = "controller?type=newsList";
			
		} else { 
			//DB데이터 조회 후 결과 페이지로 이동
			System.out.println("::: DB데이터 조회 후 searchList.jsp 페이지로 이동");
			 
			//1. DB데이터 조회
			List<BbsVO> list = DAO.newsSearch(keyword);
			
			//2. 뷰에서 사용할 수 있도록 데이터 저장
			request.setAttribute("list", list);
			
			//페이지 전환 : searchList.jsp 페이지로 이동
			//request.getRequestDispatcher("searchList.jsp").forward(request, response);
			path = "controller?type=newsSearchList";
			
		}
		
		return path;
	}

}
