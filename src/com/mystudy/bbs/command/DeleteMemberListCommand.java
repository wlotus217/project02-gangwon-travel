package com.mystudy.bbs.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.MemberVO;

public class DeleteMemberListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberVO vo = DAO.memberSelectOne(id);
		System.out.println(vo);
		System.out.println(id);
		if (vo.getPwd().equalsIgnoreCase(pwd)) {
			SqlSession ss = DBService.getFactory().openSession();
			try {
				int cnt = ss.delete("BBS.memberDelete", vo.getId());
				ss.commit(); //명시적 커밋 처리
				System.out.println(">>>> 삭제건수 cnt : " + cnt);				
//				response.sendRedirect("controller?type=proList");
			} catch (Exception e) {
				ss.rollback();
				e.printStackTrace();
				System.out.println(">>>> 예외발생");
				response.sendRedirect("deleteMember.jsp?check=0");
			} finally {
				ss.close();
			}
		} else {
			return "deleteMember.jsp?check=1";
		}
			
		return "login.jsp?check=4";
	}
}
