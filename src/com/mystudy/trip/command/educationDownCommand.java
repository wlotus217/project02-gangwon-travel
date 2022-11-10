package com.mystudy.trip.command;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class educationDownCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글처리
		request.setCharacterEncoding("UTF-8");

		//전달받은 파라미터 값 추출(확인)
		String path = request.getParameter("path"); //저장된 폴더(디렉토리)명
		String filename = request.getParameter("filename"); //물리적 저장 파일명
		
		//다운로드 받을 수 있도록 클라이언트 응답 문서타입 변경
		response.setContentType("application/x-msdownload");
		
		//클라이언트 헤더정보를 첨부파일이 있는 것으로 변경
		response.setHeader("Content-Disposition", "attachment;filename=" + filename);
		
		//----- 실제 파일 읽고 / 쓰기 작업 -----------
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		
		BufferedOutputStream bos = null;
		
		File file = new File(path + "/" + filename);
		
		if (file.isFile()) {
			try {
				//파일 읽기 객체 생성
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				
				//파일 쓰기 객체 생성
				bos = new BufferedOutputStream(response.getOutputStream());
				
				// 파일 읽고, 쓰기
				int readValue = bis.read();
				while (readValue != -1) {
					bos.write(readValue);
					readValue = bis.read();
				}
				
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if (bos != null) bos.close();
				if (bis != null) bis.close();
			}
		}
		
		return "education.jsp";
	}
}
