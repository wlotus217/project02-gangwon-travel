package com.mystudy.story.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.zzim.dao.ZzimDAO;
import com.mystudy.zzim.vo.Zzim;
import com.mystudy.zzim.vo.ZzimVO;


public class ZzimAddCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String boardName = request.getParameter("boardName");
		int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
		String title = request.getParameter("title");
		String image = request.getParameter("image");
		
		List<ZzimVO> zlist = ZzimDAO.getListZzim(id);
		Zzim zzim = new Zzim();
		zzim.list = zlist;
		System.out.println(zlist);
		
		boolean result = zzim.addZzim(id, boardName, boardIdx);
		if (result == false ) {
			ZzimVO zvo = new ZzimVO();
			
			zvo.setId(id);
			zvo.setBoardName(boardName);
			zvo.setBoardIdx(boardIdx);
			zvo.setTitle(title);
			zvo.setImage(image);
			
			
			System.out.print("찜하기 추가");
			System.out.println(ZzimDAO.addZzim(zvo));
			
			response.setContentType("text/html;charset=utf-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('찜에 추가되었습니다.');");

			out.println("history.back();");

			out.println("</script>");

			out.close();

			return null;
		}
		
		
			response.setContentType("text/html;charset=utf-8");
	
			PrintWriter out = response.getWriter();
	
			out.println("<script>");
	
			out.println("alert('게시물이 찜 리스트에 이미 존재합니다');");
	
			out.println("history.back();");
	
			out.println("</script>");
	
			out.close();
	
			return null;
			
			
	}

}
