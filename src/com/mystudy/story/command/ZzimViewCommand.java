package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.common.PageSet;
import com.mystudy.story.common.Paging;
import com.mystudy.story.common.SearchPageSet;
import com.mystudy.story.vo.CourseVO;
import com.mystudy.zzim.dao.ZzimDAO;
import com.mystudy.zzim.vo.ZzimVO;

public class ZzimViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cPage = request.getParameter("cPage");
		String id = request.getParameter("id");
		
		
		SearchPageSet p = new SearchPageSet();
		List<ZzimVO> list = p.pageSetZzim(cPage, id);
		Paging pvo = p.getP();
		
		request.setAttribute("list", list);
		request.setAttribute("id", id);
		request.setAttribute("pvo", pvo);
		
		return "/main/zzim_view.jsp";
	}

}
