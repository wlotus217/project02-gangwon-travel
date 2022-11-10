package com.mystudy.story.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.zzim.dao.ZzimDAO;


public class ZzimDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		String[] zzimIdx = request.getParameterValues("zzim");
		for(String idx : zzimIdx) {
			System.out.println(idx);
		}
		
		//System.out.println(zzimIdx.length);
		
		for(String idx : zzimIdx) {
			ZzimDAO.deleteZzim(Integer.parseInt(idx));
		}
		
		request.setAttribute("id", id);
		
		
		return "/controller3?type=zzimView";
	}

}
