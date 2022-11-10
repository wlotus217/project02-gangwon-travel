package com.mystudy.info.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.info.dao.contestDAO;
import com.mystudy.info.dao.planDAO;
import com.mystudy.info.vo.contestVO;
import com.mystudy.info.vo.planVO;

public class PlanInsertCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String triptitle = request.getParameter("triptitle");
		String region = request.getParameter("region");
		String theme = request.getParameter("theme");
		String purpose = request.getParameter("purpose");
		String day1 = request.getParameter("day1");
		String day2 = request.getParameter("day2");
		String day3 = request.getParameter("day3");
		String id = request.getParameter("id");
		
		planVO pvo = new planVO();
		pvo.setTriptitle(triptitle);
		pvo.setRegion(region);
		pvo.setTriptheme(theme);
		pvo.setPurpose(purpose);
		pvo.setDay1(day1);
		pvo.setDay2(day2);
		pvo.setDay3(day3);
		pvo.setId(id);
		
		//DB에 입력(저장) 처리
		planDAO.insert(pvo);
		
		//화면 전환(목록페이지로 이동 - 첫페이지로 가기)
		return "controller4?type=planlist";
	}
}
