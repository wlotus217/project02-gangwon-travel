package com.mystudy.bbs.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.vo.BbsVO;
import com.mystudy.bbs.dao.DAO;

public class ProListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. DB연결하고 데이터 가져오기
		List<BbsVO> vo = DAO.promotionList();
		
		//2.데이터를 응답할 페이지(list.jsp)에 전달
		request.setAttribute("vo", vo);
		
		//3. 페이지 전환 - 응답할 페이지(list.jsp)
		//request.getRequestDispatcher("list.jsp").forward(request, response);

		return "promotionMain.jsp";
	}

}
