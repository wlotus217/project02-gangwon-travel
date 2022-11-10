package com.mystudy.bbs.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.BbsVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NewsDeleteListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String boardNum = request.getParameter("boardNum");
		String title = request.getParameter("title");
		String pwd = request.getParameter("pwd");
		BbsVO vo = DAO.naSelectOne(boardNum, title);
		if(vo==null){
			return "controller?type=newsList";
		}
		System.out.println(vo);
		int cnt = 0;
		if (vo.getPwd().equalsIgnoreCase(pwd)) {
			SqlSession ss = DBService.getFactory().openSession();
			try {
				if (vo.getBoardNum().equalsIgnoreCase("공지")) {
					cnt = ss.delete("BBS.anDelete", vo);
				} else {
					cnt = ss.delete("BBS.newsDelete", vo);					
				}
				ss.commit(); //명시적 커밋 처리
				System.out.println(">>>> 삭제건수 cnt : " + cnt);	
//				response.sendRedirect("controller?type=proList");
			} catch (Exception e) {
				ss.rollback();
				e.printStackTrace();
				System.out.println(">>>> 예외발생");
				response.sendRedirect("01delete.jsp");
			} finally {
				ss.close();
			}
		}
	
			
		return "controller?type=newsList";
	}
}
