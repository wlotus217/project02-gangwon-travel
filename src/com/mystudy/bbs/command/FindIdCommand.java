package com.mystudy.bbs.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.BbsVO;
import com.mystudy.bbs.vo.MemberVO;

public class FindIdCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		System.out.println(name);
		System.out.println(birth);
		
		MemberVO ch = DAO.findId(birth);
		if(ch==null){
			return "searchId.jsp?check=1";
		} else if(!ch.getName().equalsIgnoreCase(name)){
			return "searchId.jsp?check=1";
		} else {
			request.setAttribute("findId", ch.getId());
		}
		return "searchId_ok.jsp";
			
		
	}
}
