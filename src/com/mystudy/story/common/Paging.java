package com.mystudy.story.common;

import java.util.List;

import com.mystudy.story.dao.CourseDAO;
import com.mystudy.story.dao.ReviewDAO;
import com.mystudy.story.dao.ThemeDAO;
import com.mystudy.story.vo.CourseVO;
import com.mystudy.story.vo.ReviewVO;
import com.mystudy.story.vo.ThemeVO;

public class Paging {
	private int nowPage = 1; //현재페이지
	private int nowBlock = 1; //현재블록(페이지 담는 단위)
	
	private int numPerPage = 6; //하나의 페이지에 표시할 게시글 수
	private int numPerBlock = 3; //블록당 표시하는 페이지 갯수
	
	private int totalRecord = 0; //총 게시물 갯수(원본 게시글 수)
	private int totalPage = 0; //전체 페이지 갯수
	private int totalBlock = 0; //전체 블록 갯수
	
	private int begin = 0; //현재 페이지상의 시작 번호
	private int end = 0; //현재 페이지상의 마지막 번호
	
	private int beginPage = 0; //현재 블록의 시작 페이지 번호
	private int endPage = 0; //현재 블록의 끝 페이지 번호
	
	//전체 페이지 갯수 구하기
	//totalRecord 값을 numPerPage 값으로 나누고 
	//나머지가 있으면 페이지 하나 더 추가
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage ;
		if (totalRecord % numPerPage > 0) totalPage++;
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getNumPerBlock() {
		return numPerBlock;
	}
	public void setNumPerBlock(int numPerBlock) {
		this.numPerBlock = numPerBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public List<ThemeVO> pageSetTheme(String curPage) {
		this.totalPage = ThemeDAO.getTotalCount();
		this.totalRecord = ThemeDAO.getTotalCount();
		String cPage = curPage;
	
		if (cPage != null) {
			this.nowPage = Integer.parseInt(cPage);
		}		
				
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		this.end = this.nowPage * numPerPage;
		this.begin = end - numPerPage + 1;
					
		//3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (end > totalRecord) {
			end = totalRecord;
		}
				
		//------ 블록(block) 계산하기 -----------
		//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage = this.nowPage;
		int beginPage = (nowPage - 1) / numPerBlock * numPerBlock + 1;
		this.beginPage = (beginPage);
		this.endPage = beginPage + numPerBlock - 1;
					
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (this.endPage > totalPage) {
			this.endPage = totalPage;
		}
		

		//=====================
		//DB 데이터 가져오기
		//시작번호(begin), 끝번호(end) 사용해서 게시글 조회
		List<ThemeVO> list = ThemeDAO.getList(this.begin, this.end);
//		System.out.println(">> 현재페이지 글목록(list) : " + list);
		return list;
			
		//===================================
		//EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
		//pageContext.setAttribute("list", list);
		//pageContext.setAttribute("pvo", p);
				
	}
	
	public List<ReviewVO> pageSetReview(String curPage) {
		this.totalPage = ThemeDAO.getTotalCount();
		this.totalRecord = ThemeDAO.getTotalCount();
		String cPage = curPage;
	
		if (cPage != null) {
			this.nowPage = Integer.parseInt(cPage);
		}		
				
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		this.end = this.nowPage * numPerPage;
		this.begin = end - numPerPage + 1;
					
		//3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (end > totalRecord) {
			end = totalRecord;
		}
				
		//------ 블록(block) 계산하기 -----------
		//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage = this.nowPage;
		int beginPage = (nowPage - 1) / numPerBlock * numPerBlock + 1;
		this.beginPage = (beginPage);
		this.endPage = beginPage + numPerBlock - 1;
					
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (this.endPage > totalPage) {
			this.endPage = totalPage;
		}
		

		//=====================
		//DB 데이터 가져오기
		//시작번호(begin), 끝번호(end) 사용해서 게시글 조회
		List<ReviewVO> list = ReviewDAO.getList(this.begin, this.end);
//		System.out.println(">> 현재페이지 글목록(list) : " + list);
		return list;
			
		//===================================
		//EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
		//pageContext.setAttribute("list", list);
		//pageContext.setAttribute("pvo", p);
				
	}
	public List<CourseVO> pageSetCourse(String curPage) {
		this.totalPage = ThemeDAO.getTotalCount();
		this.totalRecord = ThemeDAO.getTotalCount();
		String cPage = curPage;
	
		if (cPage != null) {
			this.nowPage = Integer.parseInt(cPage);
		}		
				
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		this.end = this.nowPage * numPerPage;
		this.begin = end - numPerPage + 1;
					
		//3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (end > totalRecord) {
			end = totalRecord;
		}
				
		//------ 블록(block) 계산하기 -----------
		//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage = this.nowPage;
		int beginPage = (nowPage - 1) / numPerBlock * numPerBlock + 1;
		this.beginPage = (beginPage);
		this.endPage = beginPage + numPerBlock - 1;
					
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (this.endPage > totalPage) {
			this.endPage = totalPage;
		}
		

		//=====================
		//DB 데이터 가져오기
		//시작번호(begin), 끝번호(end) 사용해서 게시글 조회
		List<CourseVO> list = CourseDAO.getList(this.begin, this.end);
//		System.out.println(">> 현재페이지 글목록(list) : " + list);
		return list;
			
		//===================================
		//EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
		//pageContext.setAttribute("list", list);
		//pageContext.setAttribute("pvo", p);
				
	}
	
	
	
	@Override
	public String toString() {
		return "Paging [nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", numPerPage=" + numPerPage + ", numPerBlock="
				+ numPerBlock + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage + ", totalBlock="
				+ totalBlock + ", begin=" + begin + ", end=" + end + ", beginPage=" + beginPage + ", endPage=" + endPage
				+ "]";
	}
	

}
