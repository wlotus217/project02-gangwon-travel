package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.dao.HitDAO;
import com.mystudy.story.vo.HitVO;

public class HitTravelCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("히트조회");
		List<HitVO> list = HitDAO.hitTravel();
		System.out.println(list);
		request.setAttribute("list", list);
		
		return "/main/hitView.jsp";
	}

}