package com.mystudy.info.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.info.dao.contestDAO;
import com.mystudy.info.vo.contestVO;

public class ContestModifyFormCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		contestVO cvo = contestDAO.selectOne(Integer.parseInt(request.getParameter("picNum")));
		
		request.setAttribute("cvo", cvo);
		
		return "contestmodify.jsp";
	}

}
