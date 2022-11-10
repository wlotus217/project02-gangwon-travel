package com.mystudy.info.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.info.common.Paging;
import com.mystudy.info.dao.contestDAO;
import com.mystudy.info.vo.contestVO;

public class ListsearchCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Paging p = new Paging();
		String contesttitle = request.getParameter("contesttitle");
		System.out.println(contesttitle);
		//1. 전체 게시물 수량 구하기
		p.setTotalRecord(contestDAO.getsearchTotalCount(contesttitle));
		System.out.println(p.getTotalRecord());
		p.setNumPerPage(4);
		p.setTotalPage();
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		System.out.println("p.getNumPerPage() : " + p.getNumPerPage());
		System.out.println("p.getNowPage() : " + p.getNowPage());
		//3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		
		//------ 블록(block) 계산하기 -----------
		//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		//=====================
		//DB 데이터 가져오기
		//시작번호(begin), 끝번호(end) 사용해서 게시글 조회
		List<contestVO> list = contestDAO.getContestList(p.getBegin(), p.getEnd(), contesttitle);
		System.out.println("list : " + list);
		System.out.println("p.getEnd : " + p.getEnd());
		System.out.println("p.getBegin : " + p.getBegin());
		//===================================
		//EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
		request.setAttribute("contesttitle", contesttitle);
		request.setAttribute("list", list);
		request.setAttribute("pvo", p);
		
		return "contestsearchlist.jsp";
	}
		
	/*@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contesttitle = request.getParameter("contesttitle");
		
		//2. DB연동작업 : 해당 부서 직원정보 조회(DAO 사용)
		List<contestVO> list = contestDAO.getContestList(contesttitle);
		
		//3. 조회된 데이터를 응답페이지(deptList.jsp)에서 사용토록 속성에 저장(scope상에 등록)
		request.setAttribute("list", list);
		
		//4. 응답페이지(contestsearchlist.jsp)로 응답 위임 처리
		
		return "contestsearchlist.jsp";
	}*/

}

