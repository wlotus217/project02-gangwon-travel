package com.mystudy.story.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.story.mybatis.DBService;
import com.mystudy.story.vo.CourseVO;
import com.mystudy.story.vo.ThemeVO;

public class CourseDAO {
	//게시글의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("story.totalCountCourse");
		ss.close();
		return totalCount;
	}
	
	//게시글의 검색리스트 전체 건수 조회
	public static int getSearchTotalCount(String tDay) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("story.totalCountCourseTDay", tDay);
		ss.close();
		return totalCount;
	}
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<CourseVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end",end);
			
		SqlSession ss = DBService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("story.pageListCourse", map);
		ss.close();
		return list;

	}
	//페이지에 해당하는 게시글 조회	
	public static List<CourseVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("story.listCourse", map);
		ss.close();
		return list;
	}
	
	public static CourseVO selectOneCourse(int idx) {
		SqlSession ss = DBService.getFactory().openSession();
		CourseVO vo = ss.selectOne("story.selectOneCourse", idx);
		ss.close();
		return vo;
	}
	
	//검색결과리스트 페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<CourseVO> getSearchList(String begin, String end, String tDay) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end",end);
		map.put("tDay", tDay);
			
		SqlSession ss = DBService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("story.pageListCourseTDay", map);
		ss.close();
		return list;

	}
	
	//게시글 입력
	public static int insertCourse(CourseVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("story.insertCourse", vo);
		ss.close();
		return result;
	}
	
	//게시글 수정
	public static int updateCourse(CourseVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("story.updateCourse", vo);
		ss.close();
		return result;
	}
	
	//게시글 삭제
	public static int deleteCourse(int idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("story.deleteCourse", idx);
		ss.close();
		return result;
	}
	
	//게시글 조회	
	public static List<CourseVO> searchCourseTDay(String tDay) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("story.searchCourse", tDay);
		ss.close();
		return list;
	}
	
}
