package com.mystudy.trip.command;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.common.Paging;
import com.mystudy.trip.dao.DAO;
import com.mystudy.trip.vo.CultureVO;

public class cultureListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

       	Paging p = new Paging();
       	
       	p.setTotalRecord(DAO.cultureTotalCount()); 
       	p.setTotalPage();
       	
       	String cPage = request.getParameter("cPage");
       	if (cPage != null) {
       		p.setNowPage(Integer.parseInt(cPage));
       	}
       	
       	p.setEnd(p.getNowPage() * p.getNumPerPage());
       	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
       	
       	if (p.getEnd() > p.getTotalRecord()) {
       		p.setEnd(p.getTotalRecord());
       	}
       	
       	//----------- 블록(block) --------------
       	int nowPage = p.getNowPage();
       	int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
       	p.setBeginPage(beginPage);
       	p.setEndPage(beginPage + p.getNumPerBlock() - 1);
       	
       	if (p.getEndPage() > p.getTotalPage()) {
       		p.setEndPage(p.getTotalPage());
       	}
       	
       	List<CultureVO> list = DAO.cultureList(p.getBegin(), p.getEnd());
       	
       	request.setAttribute("list", list);
       	request.setAttribute("pvo", p);
			
		return "culture.jsp";
	}
}
