package com.mystudy.story.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.dao.ThemeDAO;
import com.mystudy.story.vo.ThemeVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ThemeModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 파일 저장 위치
		String path = "c:/MyStudy/temp";
		
		MultipartRequest mr = new MultipartRequest(
						request, path, (10 *1024 * 1024) // 10Mb
						, "UTF-8", new DefaultFileRenamePolicy()
				);
		
		// 전달받은 데이터 처리
		ThemeVO tvo = new ThemeVO();
		tvo.setIdx(Integer.parseInt(mr.getParameter("idx")));
		tvo.setTitle(mr.getParameter("title"));
		tvo.setIntro(mr.getParameter("intro"));
		tvo.setPlaceName1(mr.getParameter("placeName1"));
		tvo.setPlaceName2(mr.getParameter("placeName2"));
		tvo.setPlaceName3(mr.getParameter("placeName3"));
		tvo.setPlaceName4(mr.getParameter("placeName4"));
		tvo.setPlaceName5(mr.getParameter("placeName5"));
		/*
		 * tvo.setDetail1(mr.getParameter("detail1"));
		 * tvo.setDetail2(mr.getParameter("detail2"));
		 * tvo.setDetail3(mr.getParameter("detail3"));
		 * tvo.setDetail4(mr.getParameter("detail4"));
		 * tvo.setDetail5(mr.getParameter("detail5"));
		 */
		String detail1 = mr.getParameter("detail1");
		tvo.setDetail1(detail1.replace("\r\n","<br>"));
		String detail2 = mr.getParameter("detail2");
		tvo.setDetail2(detail2.replace("\r\n","<br>"));
		String detail3 = mr.getParameter("detail3");
		tvo.setDetail3(detail3.replace("\r\n","<br>"));
		String detail4 = mr.getParameter("detail4");
		tvo.setDetail4(detail4.replace("\r\n","<br>"));
		String detail5 = mr.getParameter("detail5");
		tvo.setDetail5(detail5.replace("\r\n","<br>"));
		System.out.println("br 처리 변경");
		
		
		//System.out.println(tvo);
				
		// 첨부파일 데이터 처리
		//첨부파일 데이터 처리
		if (mr.getFile("image1") != null) { //첨부파일 있으면
			tvo.setImage1(mr.getOriginalFileName("image1"));
			
		} else { //첨부파일 없으면
			tvo.setImage1("");
		}
		if (mr.getFile("image2") != null) { //첨부파일 있으면
			tvo.setImage2(mr.getOriginalFileName("image2"));
			
		} else { //첨부파일 없으면
			tvo.setImage2("");
		}
		if (mr.getFile("image3") != null) { //첨부파일 있으면
			tvo.setImage3(mr.getOriginalFileName("image3"));
			
		} else { //첨부파일 없으면
			tvo.setImage3("");
		}
		if (mr.getFile("image4") != null) { //첨부파일 있으면
			tvo.setImage4(mr.getOriginalFileName("image4"));
			
		} else { //첨부파일 없으면
			tvo.setImage4("");
		}
		if (mr.getFile("image5") != null) { //첨부파일 있으면
			tvo.setImage5(mr.getOriginalFileName("image5"));
			
		} else { //첨부파일 없으면
			tvo.setImage5("");
		}
		
		
		// DB에 입력(저장) 처리
		int result = ThemeDAO.updateTheme(tvo);
		System.out.println("update결과" + result);
		System.out.println(tvo);
		
		
		// 화면 전환(목록페이지로 이동 - 첫페이지로 가기)
		//response.sendRedirect("themeTravel.jsp");
		return "/controller3?type=themeTravel";
	}

}