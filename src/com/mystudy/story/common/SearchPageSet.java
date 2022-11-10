package com.mystudy.story.common;

import java.util.List;

import com.mystudy.story.dao.CourseDAO;
import com.mystudy.story.dao.ReviewDAO;
import com.mystudy.story.dao.ThemeDAO;
import com.mystudy.story.vo.CourseVO;
import com.mystudy.story.vo.ReviewVO;
import com.mystudy.story.vo.ThemeVO;
import com.mystudy.zzim.dao.ZzimDAO;
import com.mystudy.zzim.vo.ZzimVO;

public class SearchPageSet {
	
	private Paging p = new Paging();
	
	public Paging getP() {
		return p;
	}

	public void setP(Paging p) {
		this.p = p;
	}
	public List<ThemeVO> SearchPageSetTheme(String cPage, String search, String searchKeyword) {
		
		//1. 전체 게시물 수량 구하기
		p.setTotalRecord(ThemeDAO.getSearchTotalCount(search,searchKeyword)); //전체 게시물 수
		p.setTotalPage(); // 전체 페이지 수
		
		//2. 현재 페이지 구하기
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
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
		
		
		List<ThemeVO> list = ThemeDAO.getSearchList(Integer.toString(p.getBegin()), Integer.toString(p.getEnd()),search,searchKeyword);
		
		return list;
	}
	
	public List<ReviewVO> SearchPageSetReview(String cPage, String search, String searchKeyword) {
		//1. 전체 게시물 수량 구하기
		p.setTotalRecord(ReviewDAO.getSearchTotalCount(search,searchKeyword)); //전체 게시물 수
		p.setTotalPage(); // 전체 페이지 수
		
		//2. 현재 페이지 구하기
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
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
		
		List<ReviewVO> list = ReviewDAO.getSearchList(Integer.toString(p.getBegin()), Integer.toString(p.getEnd()),search,searchKeyword);
		
		return list;
	}
	
	public List<CourseVO> SearchPageSetCourse(String cPage, String tDay) {
		//1. 전체 게시물 수량 구하기
		p.setTotalRecord(CourseDAO.getSearchTotalCount(tDay)); //전체 게시물 수
		p.setTotalPage(); // 전체 페이지 수
		
		//2. 현재 페이지 구하기
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
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
		
		List<CourseVO> list = CourseDAO.getSearchList(Integer.toString(p.getBegin()), Integer.toString(p.getEnd()),tDay);
		
		return list;
	}
	
	public List<ZzimVO> pageSetZzim(String cPage, String id) {
		//1. 전체 게시물 수량 구하기
		p.setTotalRecord(ZzimDAO.getTotalCount(id)); //전체 게시물 수
		p.setTotalPage(); // 전체 페이지 수
		
		//2. 현재 페이지 구하기
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
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
		
		List<ZzimVO> list = ZzimDAO.getPageListZzim(Integer.toString(p.getBegin()), Integer.toString(p.getEnd()),id);
		
		return list;
	
	
	
	}

}
