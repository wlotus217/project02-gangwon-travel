package com.mystudy.story.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.story.mybatis.DBService;
import com.mystudy.story.vo.ReviewVO;
import com.mystudy.story.vo.ThemeVO;

public class ReviewDAO {
	
	//게시글의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("story.totalCountReview");
		ss.close();
		return totalCount;
	}
	
	//게시글의 검색리스트 전체 건수 조회
	public static int getSearchTotalCount(String search, String searchKeyword) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("searchKeyword", searchKeyword);
		
		int totalCount = ss.selectOne("story.searchTotalCountReview", map);
		ss.close();
		return totalCount;
	}
	
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<ReviewVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end",end);
			
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("story.pageListReview", map);
		ss.close();
		return list;

		}
		
	public static List<ReviewVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("story.listReview", map);
		ss.close();
		return list;
	}
	
	//검색결과리스트 페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<ReviewVO> getSearchList(String begin, String end, String search, String searchKeyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end",end);
		map.put("search", search);
		map.put("searchKeyword", searchKeyword);
			
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("story.SearchpageListReview", map);
		ss.close();
		return list;

	}
	
		
	//게시글 1개 조회(검색)
	public static ReviewVO selectOneReview(int idx) {
		SqlSession ss = DBService.getFactory().openSession();
		ReviewVO vo = ss.selectOne("story.selectOneReview", idx);
		ss.close();
		return vo;
	}

	//게시글 입력
	public static int insertReview(ReviewVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("story.insertReview", vo);
		ss.close();
		return result;
	}
	//게시글 수정
	public static int updateReview(ReviewVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("story.updateReview", vo);
		ss.close();
		return result;
	}
	//게시글 삭제
	public static int deleteReview(int idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("story.deleteReview", idx);
		ss.close();
		return result;
	}
	//게시글 검색
	public static List<ReviewVO> searchReview(String search, String searchKeyword) {	
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("searchKeyword", searchKeyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("story.searchReview", map);
		ss.close();
		return list;
		}
		
	}
	
	
	
	









