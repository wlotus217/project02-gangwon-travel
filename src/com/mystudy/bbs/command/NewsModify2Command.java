package com.mystudy.bbs.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.vo.BbsVO;

public class NewsModify2Command implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNum = request.getParameter("boardNum");
		String title = request.getParameter("title");
		BbsVO vo = new BbsVO();
		if (boardNum.equalsIgnoreCase("공지")) {
			vo = (BbsVO) DAO.newsSelectOne2(title);
		} else {
			vo = DAO.newsSelectOne(title);
		}
		if (vo == null) {
			System.out.print("글번호가 잘 못 입력되었습니다.");
			return "03modify.jsp";
		}
		request.setAttribute("vo", vo);
		return "01-2newsModify.jsp";

	}

}
