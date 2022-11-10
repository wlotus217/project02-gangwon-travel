package com.mystudy.story.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.story.mybatis.DBService;
import com.mystudy.story.vo.ThemeVO;

public class ThemeDAO {
	
	//게시글의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("story.totalCount");
		ss.close();
		return totalCount;
	}
	//게시글의 검색리스트 전체 건수 조회
	public static int getSearchTotalCount(String search, String searchKeyword) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("searchKeyword", searchKeyword);
		
		int totalCount = ss.selectOne("story.searchTotalCount", map);
		ss.close();
		return totalCount;
	}
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<ThemeVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end",end);
			
		SqlSession ss = DBService.getFactory().openSession();
		List<ThemeVO> list = ss.selectList("story.pageList", map);
		ss.close();
		return list;

		}
		
	public static List<ThemeVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ThemeVO> list = ss.selectList("story.list", map);
		ss.close();
		return list;
	}
	
	//검색결과리스트 페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<ThemeVO> getSearchList(String begin, String end, String search, String searchKeyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end",end);
		map.put("search", search);
		map.put("searchKeyword", searchKeyword);
			
		SqlSession ss = DBService.getFactory().openSession();
		List<ThemeVO> list = ss.selectList("story.SearchpageList", map);
		ss.close();
		return list;

	}
		
		
	//게시글 1개 조회(검색) - 글 수정, 삭제
	public static ThemeVO selectOneTheme(int idx) {
		SqlSession ss = DBService.getFactory().openSession();
		ThemeVO vo = ss.selectOne("story.selectOneTheme", idx);
		ss.close();
		return vo;
	}

	//전체 글 목록 조회
	
	 public static List<ThemeVO> getList() { 
		 SqlSession ss = DBService.getFactory().openSession(); 
		 List<ThemeVO> list =ss.selectList("story.list"); 
		 ss.close(); 
		 return list; 
	 }
	 
	
	//게시글 입력
	public static int insertTheme(ThemeVO tvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("story.insertTheme", tvo);
		ss.close();
		return result;
	}
	//게시글 수정
	public static int updateTheme(ThemeVO tvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("story.updateTheme", tvo);
		ss.close();
		return result;
	}
	//게시글 삭제
	public static int deleteTheme(int idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("story.deleteTheme", idx);
		ss.close();
		return result;
	}
	//게시글 검색
	public static List<ThemeVO> searchTheme(String search, String searchKeyword) {	
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("searchKeyword", searchKeyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ThemeVO> list = ss.selectList("story.searchTheme", map);
		ss.close();
		return list;
	}
		
	}
	
	
	
	









