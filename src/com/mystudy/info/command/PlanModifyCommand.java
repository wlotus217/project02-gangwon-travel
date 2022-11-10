package com.mystudy.info.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.info.dao.contestDAO;
import com.mystudy.info.dao.planDAO;
import com.mystudy.info.vo.contestVO;
import com.mystudy.info.vo.planVO;

public class PlanModifyCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tripnum = request.getParameter("tripnum");
		String triptitle = request.getParameter("triptitle");
		String region = request.getParameter("region");
		String theme = request.getParameter("theme");
		String purpose = request.getParameter("purpose");
		
		planVO pvo = new planVO();
		pvo.setTripnum(tripnum);
		pvo.setTriptitle(triptitle);
		pvo.setRegion(region);
		pvo.setTriptheme(theme);
		pvo.setPurpose(purpose);
		
		//DB에 입력(저장) 처리
		planDAO.planModify(pvo);
		
		//화면 전환(목록페이지로 이동 - 첫페이지로 가기)
		return "controller4?type=planlist";
	}
}
