package com.mystudy.bbs.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.vo.BbsVO;

public class SearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println("> keyword : -" + keyword + "-");
		
		//단순 페이지 전환인지 DB데이터 조회처리를 해야하는지 결정
		String path;
		if (keyword == null || keyword.equals("")) {
			System.out.println("::: search.jsp 페이지로 이동");
			
			//request.getRequestDispatcher("search.jsp").forward(request, response);
			path = "search.jsp";
			
		} else { 
			//DB데이터 조회 후 결과 페이지로 이동
			System.out.println("::: DB데이터 조회 후 searchList.jsp 페이지로 이동");
			
			//idx 값 확인하고 텍스트로 변환
			String title = "";
			switch (idx) {
				case "0": title = "사번"; break;
				case "1": title = "이름"; break;
				case "2": title = "직종"; break;
				case "3": title = "부서"; break;
			}
			 
			//1. DB데이터 조회
			List<BbsVO> list = DAO.promotionList();
			
			//2. 뷰에서 사용할 수 있도록 데이터 저장
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			
			//페이지 전환 : searchList.jsp 페이지로 이동
			//request.getRequestDispatcher("searchList.jsp").forward(request, response);
			path = "searchList.jsp";
			
		}
		
		return path;
	}

}
